var calendar = new tui.Calendar("#calendar", {
  defaultView: "month",
  taskView: false,
  calendars: [
    {
      id: "schedule",
      name: "schedule",
      color: "#ffffff",
      bgColor: "#18cbe2",
      dragBgColor: "#18cbe2",
      borderColor: "#18cbe2",
    },
    {
      id: "holiday",
      name: "holiday",
      color: "#ffffff",
      bgColor: "#fa0808",
      dragBgColor: "#fa0808",
      borderColor: "#fa0808",
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

var holidayChk = new Set([moment(new Date()).format("yyyyMM")]);

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
  var schduleEdit = document.querySelector("#schedule-edit");

  console.log(content.replace(/\n/g, "<br/>"));
  var content = content.replace(/\n/g, "<br/>");

  var scheduleView = $("#schedule-view");

  scheduleView.find(".modal-title").html(title);
  scheduleView.find(".schedule-content").html(content);
  scheduleView
    .find(".schedule-when")
    .html(
      moment(startDate.toDate()).format("yyyy-MM-DD (ddd)") +
        " ~ " +
        moment(endDate.toDate()).format("yyyy-MM-DD (ddd)")
    );

  if (schedule.calendarId === "schedule")
    schduleEdit.classList.remove("invisible");
  else if (schedule.calendarId === "holiday")
    schduleEdit.classList.add("invisible");

  scheduleView.find("#schedule-edit").attr("schedule-id", id);

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

function getHoliday(year, month) {
  var data = {
    year: year,
    month: month,
  };

  $.ajax({
    url: root + "/calendar/holiday.do",
    // url: "/calendar/holiday",
    data: data,
    dataType: "json",
  }).then(function (data) {
    if (data.response.header.resultCode === "00") {
      var items = data.response.body.items.item;

      if (!items) return;
      if (!Array.isArray(items)) items = [items];

      [].forEach.call(items, function (item) {
        var start = moment("" + item.locdate).format("yyyy-MM-DD (ddd)");

        calendar.createSchedules([
          {
            id: Date.now(),
            calendarId: "holiday",
            title: item.dateName,
            body: item.dateName,
            category: "allday",
            start: start,
            end: start,
          },
        ]);
      });
    }
  });
}

function init() {
  var nextBtn = document.querySelector(".calendar-next");
  var prevBtn = document.querySelector(".calendar-prev");
  var todayBtn = document.querySelector(".calendar-today");
  var ymHeader = document.querySelector(".calendar-ym-header");
  var scheduleForm = document.querySelector("#schedule-form");

  var scheduleCb = document.querySelector("#schedule-cb");
  var holidayCb = document.querySelector("#holiday-cb");

  //FIXME: 더미(나중에 지움)
  calendar.createSchedules([
    {
      id: Date.now(),
      calendarId: "schedule",
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
  scheduleCb.checked = true;
  holidayCb.checked = true;
  // 공휴일 현재 달 생성(프록시)
  getHoliday(new Date().getFullYear(), fillMonth(new Date().getMonth() + 1));

  // 리스너 설정
  nextBtn.onclick = function () {
    calendar.next();
    setYearMonthHeader(ymHeader);

    var date = calendar.getDate();
    var nextYear = "" + date.getFullYear();
    var nextMonth = fillMonth(date.getMonth() + 1);

    if (!holidayChk.has(nextYear + nextMonth)) {
      holidayChk.add(nextYear + nextMonth);
      getHoliday(nextYear, nextMonth);
    }
  };

  prevBtn.onclick = function () {
    calendar.prev();
    setYearMonthHeader(ymHeader);

    var date = calendar.getDate();
    var prevYear = "" + date.getFullYear();
    var prevMonth = fillMonth(date.getMonth() + 1);

    if (!holidayChk.has(prevYear + prevMonth)) {
      holidayChk.add(prevYear + prevMonth);
      getHoliday(prevYear, prevMonth);
    }
  };

  todayBtn.onclick = function () {
    calendar.today();
    setYearMonthHeader(ymHeader);
  };

  scheduleCb.onchange = function () {
    calendar.toggleSchedules("schedule", !this.checked);
  };

  holidayCb.onchange = function () {
    calendar.toggleSchedules("holiday", !this.checked);
  };

  // 모달 꺼짐 리스너
  $("#schedule-modal-container").on("hidden.bs.modal", function () {
    clearForm();
  });

  // 모달 켜짐 리스너
  $("#schedule-modal-container").on("show.bs.modal", function (e) {
    var rT = $(e.relatedTarget);
    var from = rT.data("from");
    var modal = $(this);

    if (from === "add") {
      var today = moment(new Date()).format("yyyy-MM-DD");
      modal.find(".modal-title").html("일정추가");
      modal.find("#schedule-start-date").val(today);
      modal.find("#schedule-end-date").val(today);
    } else if (from === "edit") {
      $("#schedule-view").modal("hide");

      var schedule = calendar.getSchedule(
        parseInt(rT.attr("schedule-id")),
        "schedule"
      );

      modal.find(".modal-title").html("일정수정");
      modal.find("#schedule-title").val(schedule.title);
      modal
        .find("#schedule-start-date")
        .val(moment(schedule.start.toDate()).format("yyyy-MM-DD"));
      modal
        .find("#schedule-end-date")
        .val(moment(schedule.end.toDate()).format("yyyy-MM-DD"));
      modal.find("#schedule-content").val(schedule.body);
      modal.attr("schedule-id", schedule.id);
      modal.modal("show");
    }
  });

  // 저장 버튼
  scheduleForm.onsubmit = function (e) {
    e.preventDefault();
    var title = this["schedule-title"].value;
    var startDate = moment(this["schedule-start-date"].value);
    var endDate = moment(this["schedule-end-date"].value);
    var content = this["schedule-content"].value;
    var modal = $("#schedule-modal-container");

    if (endDate.isBefore(startDate)) {
      alert("일정이 형식에 맞지 않습니다.");
      return;
    }

    var modalTitle = modal.find(".modal-title").text();
    if (modalTitle === "일정추가") {
      calendar.createSchedules([
        {
          id: Date.now(),
          calendarId: "schedule",
          title: title,
          body: content,
          category: "allday",
          start: this["schedule-start-date"].value,
          end: this["schedule-end-date"].value,
        },
      ]);
    } else if (modalTitle === "일정수정") {
      calendar.updateSchedule(parseInt(modal.attr("schedule-id")), "schedule", {
        title: title,
        body: content,
        start: this["schedule-start-date"].value,
        end: this["schedule-end-date"].value,
      });
    }

    $("#schedule-modal-container").modal("hide");
  };
}

init();