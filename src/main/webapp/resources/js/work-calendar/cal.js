var calendar = new tui.Calendar("#calendar", {
  defaultView: "month",
  taskView: false,
  calendars: [
    {
      id: "take-work",
      name: "take-work",
      color: "#ffffff",
      bgColor: "#23e40a",
      dragBgColor: "#23e40a",
      borderColor: "#23e40a",
    },
    {
      id: "give-work",
      name: "give-work",
      color: "#ffffff",
      bgColor: "#8d09f8",
      dragBgColor: "#8d09f8",
      borderColor: "#8d09f8",
    },
  ],
  template: {
    monthDayname: function (dayname) {
      return (
        '<span class="calendar-week-dayname-name">' + dayname.label + "</span>"
      );
    },
  },
});

var koreanDays = ["일", "월", "화", "수", "목", "금", "토"];
var workStateArr = ["요청", "진행", "완료"];

calendar.on("clickSchedule", function (e) {
  var schedule = e.schedule;
  var id = schedule.id;
  var calId = schedule.calendarId;
  var title = schedule.title;
  var startDate = schedule.start;
  var endDate = schedule.end;
  var momentStartDate = moment(startDate.toDate());
  var momentEndDate = moment(endDate.toDate());
  var content = schedule.body;
  var raw = schedule.raw;

  var content = content.replace(/\n/g, "<br/>");

  var scheduleView = $("#work-view");

  scheduleView.find(".modal-title").html(title);
  if (calId === "give-work") {
    scheduleView.find("#work-giver").addClass("d-none");
    scheduleView.find("#work-taker").removeClass("d-none");
    scheduleView.find("#work-team-id").text(raw.workReceiver);
  } else {
    scheduleView.find("#work-giver").removeClass("d-none");
    scheduleView.find("#work-taker").addClass("d-none");
    scheduleView.find("#work-team-id").text(raw.workSender);
  }
  scheduleView.find("#work-content").html(content);

  scheduleView
    .find("#work-start-date")
    .text(
      momentStartDate.format("yyyy-MM-DD") +
        " (" +
        koreanDays[momentStartDate.day()] +
        ")"
    );
  scheduleView
    .find("#work-end-date")
    .text(
      momentEndDate.format("yyyy-MM-DD") +
        " (" +
        koreanDays[momentEndDate.day()] +
        ")"
    );

  scheduleView.find("#work-state").text(workStateArr[raw.workState]);
  scheduleView.find("#work-state").removeClass("bg-0 bg-1 bg-2");
  scheduleView.find("#work-state").addClass("bg-" + raw.workState);

  scheduleView
    .find("#work-detail")
    .attr(
      "href",
      root + "/workspace/workspace.do?proNum=1&workNum=" + raw.workNum
    );

  scheduleView.modal("toggle");
});

function fillMonth(month) {
  return parseInt(month) < 10 ? "0" + month : month;
}

function setYearMonthHeader(ymHeader) {
  var year = calendar.getDate().getFullYear();
  var month = fillMonth(calendar.getDate().getMonth() + 1);
  ymHeader.innerText = year + "." + month;
}

function getAllGiveSchedule() {
  $.ajax({
    url: root + "/workcal/get-givesche.do",
    dataType: "json",
  })
    .then(function (data) {
      var result = data.result;

      [].forEach.call(result, function (item) {
        calendar.createSchedules([
          {
            id: item.workNum,
            calendarId: "give-work",
            title: item.workSubject,
            body: item.workContent,
            category: "allday",
            start: moment(parseInt(item.workStartDate)).format(
              "yyyy-MM-DD (ddd)"
            ),
            end: moment(parseInt(item.workEndDate)).format("yyyy-MM-DD (ddd)"),
            raw: {
              workNum: item.workNum,
              workSender: item.workSender,
              workReceiver: item.workReceiver,
              workState: parseInt(item.workState),
            },
          },
        ]);
      });
    })
    .catch(function (err) {
      alert("요청한 일정 정보를 불러오지 못했습니다.");
    });
}

function getAllTakeSchedule() {
  $.ajax({
    url: root + "/workcal/get-takesche.do",
    dataType: "json",
  })
    .then(function (data) {
      var result = data.result;

      [].forEach.call(result, function (item) {
        calendar.createSchedules([
          {
            id: item.workNum,
            calendarId: "take-work",
            title: item.workSubject,
            body: item.workContent,
            category: "allday",
            start: moment(parseInt(item.workStartDate)).format(
              "yyyy-MM-DD (ddd)"
            ),
            end: moment(parseInt(item.workEndDate)).format("yyyy-MM-DD (ddd)"),
            raw: {
              workNum: item.workNum,
              workSender: item.workSender,
              workReceiver: item.workReceiver,
              workState: parseInt(item.workState),
            },
          },
        ]);
      });
    })
    .catch(function (err) {
      alert("요청받은 일정 정보를 불러오지 못했습니다.");
    });
}

function init() {
  var nextBtn = document.querySelector(".calendar-next");
  var prevBtn = document.querySelector(".calendar-prev");
  var todayBtn = document.querySelector(".calendar-today");
  var ymHeader = document.querySelector(".calendar-ym-header");
  // var scheduleForm = document.querySelector("#schedule-form");

  var takeWorkCb = document.querySelector("#take-work-cb");
  var giveWorkCb = document.querySelector("#give-work-cb");

  // 년/달 현재 달로 초기화
  setYearMonthHeader(ymHeader);
  // 체크박스 모두 체크
  giveWorkCb.checked = true;
  takeWorkCb.checked = true;

  getAllGiveSchedule();
  getAllTakeSchedule();

  // 리스너 설정
  nextBtn.onclick = function () {
    calendar.next();
    setYearMonthHeader(ymHeader);
  };

  prevBtn.onclick = function () {
    calendar.prev();
    setYearMonthHeader(ymHeader);
  };

  todayBtn.onclick = function () {
    calendar.today();
    setYearMonthHeader(ymHeader);
  };

  giveWorkCb.onchange = function () {
    calendar.toggleSchedules("give-work", !this.checked);
  };

  takeWorkCb.onchange = function () {
    calendar.toggleSchedules("take-work", !this.checked);
  };

  // 모달 꺼짐 리스너
  $("#schedule-modal-container").on("hidden.bs.modal", function (e) {});

  // 모달 켜짐 리스너
  $("#schedule-modal-container").on("show.bs.modal", function (e) {});

  // section의 display:none을 지정하면서 캘린더를 만들기 위함
  var tab2 = document.querySelector("#tab2");
  tab2.addEventListener(
    "change",
    function () {
      todayBtn.click();
    },
    { once: true }
  );
}

init();
