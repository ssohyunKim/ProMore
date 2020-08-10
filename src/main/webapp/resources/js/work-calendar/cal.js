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

calendar.on("beforeCreateSchedule", function (e) {
  var startTime = e.start;
  var endTime = e.end;
  var isAllDay = e.isAllDay;
  var guide = e.guide;
  var triggerEventName = e.triggerEventName;
  var schedule;
});

calendar.on("clickSchedule", function (e) {
  var schedule = e.schedule;
  var id = schedule.id;
  var title = schedule.title;
  var startDate = schedule.start;
  var endDate = schedule.end;
  var content = schedule.body;

  console.log(content.replace(/\n/g, "<br/>"));
  var content = content.replace(/\n/g, "<br/>");

  var scheduleView = $("#work-view");

  scheduleView.find(".modal-title").html(title);
  scheduleView.find(".schedule-content").html(content);
  scheduleView
    .find(".schedule-when")
    .html(
      moment(startDate.toDate()).format("yyyy-MM-DD (ddd)") +
        " ~ " +
        moment(endDate.toDate()).format("yyyy-MM-DD (ddd)")
    );
  // scheduleView.find("#schedule-edit").attr("schedule-id", id);

  scheduleView.modal("toggle");
});

function fillMonth(month) {
  return parseInt(month) < 10 ? "0" + month : month;
}

function clearForm() {
  var scheduleForm = $("#schedule-form");
  scheduleForm.find("#schedule-title").val("");
  scheduleForm.find("#schedule-start-date").val("");
  scheduleForm.find("#schedule-end-date").val("");
  scheduleForm.find("#schedule-content").val("");
}

function setYearMonthHeader(ymHeader) {
  var year = calendar.getDate().getFullYear();
  var month = fillMonth(calendar.getDate().getMonth() + 1);
  ymHeader.innerText = year + "." + month;
}

function init() {
  var nextBtn = document.querySelector(".calendar-next");
  var prevBtn = document.querySelector(".calendar-prev");
  var todayBtn = document.querySelector(".calendar-today");
  var ymHeader = document.querySelector(".calendar-ym-header");
  // var scheduleForm = document.querySelector("#schedule-form");

  var takeWorkCb = document.querySelector("#take-work-cb");
  var giveWorkCb = document.querySelector("#give-work-cb");

  //FIXME: 더미(나중에 지움)
  calendar.createSchedules([
    {
      id: Date.now(),
      calendarId: "take-work",
      title: "팀 회의",
      body: "하계 팀 회의입니다. 많은 참석 바랍니다.",
      category: "time",
      start: "2020-08-09",
      end: "2020-08-15",
    },
  ]);

  // 년/달 현재 달로 초기화
  setYearMonthHeader(ymHeader);
  // 체크박스 모두 체크
  giveWorkCb.checked = true;
  takeWorkCb.checked = true;

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
  $("#schedule-modal-container").on("hidden.bs.modal", function () {
    clearForm();
  });
  
  // section의 display:none을 지정하면서 캘린더를 만들기 위함
  var tab2 = document.querySelector("#tab2");
  tab2.addEventListener("change", function(){
  	todayBtn.click();
  }, {once: true});
}

init();

