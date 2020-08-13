$(function () {
  //   $("#date1").datepicker({
  //     dateFormat: "yy-mm-dd",
  //     monthNames: [
  //       "1월",
  //       "2월",
  //       "3월",
  //       "4월",
  //       "5월",
  //       "6월",
  //       "7월",
  //       "8월",
  //       "9월",
  //       "10월",
  //       "11월",
  //       "12월",
  //     ],
  //     dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
  //     changeMonth: true,
  //     changeYear: true,
  //     currentText: "Today",
  //     showOtherMonths: true,
  //     yearRange: "2010:2020",
  //   });
  //   $("#date2").datepicker({
  //     dateFormat: "yy-mm-dd",
  //     monthNames: [
  //       "1월",
  //       "2월",
  //       "3월",
  //       "4월",
  //       "5월",
  //       "6월",
  //       "7월",
  //       "8월",
  //       "9월",
  //       "10월",
  //       "11월",
  //       "12월",
  //     ],
  //     dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
  //     changeMonth: true,
  //     changeYear: true,
  //     currentText: "Today",
  //     showOtherMonths: true,
  //     yearRange: "2010:2020",
  //   });
  //   $("#btn").click(function () {
  //     $("#resultDate").text($("#date1").val());
  //   });
  //   $("#btn").click(function () {
  //     $("#resultDate").text($("#date2").val());
  //   });
  //   $(".addIndex").click(function () {
  //     //alert("확인");
  //     $(".addIndexDiv").css("display", "block");
  //     $(".addIndex").css("display", "none");
  //   });
  //   $("#manager")
  //     .children("a")
  //     .eq(0)
  //     .click(function () {
  //       //alert("왕아아아");
  //       var test = $("#manager").children("a").eq(0).text();
  //       //alert(test);
  //       $("#managerWho").html(test);
  //     });
  //   $("#manager")
  //     .children("a")
  //     .eq(1)
  //     .click(function () {
  //       //alert("왕아아아");
  //       var test = $("#manager").children("a").eq(1).text();
  //       $("#managerWho").html(test);
  //     });
  //   $("#manager")
  //     .children("a")
  //     .eq(2)
  //     .click(function () {
  //       //alert("왕아아아");
  //       var test = $("#manager").children("a").eq(2).text();
  //       //alert(test);
  //       $("#managerWho").html(test);
  //     });
});

var koreanDays = ["일", "월", "화", "수", "목", "금", "토"];
var beforeEditState = {};

function managerSelect(root) {
  //alert("확인"+root);
  var url = root + "/workspace/manager.do";
  alert(url);
  window.open(url, "", "width=300px, height=200px");
  //"주소","윈도우이름","가로세로스크롤"
}

function writeToServer() {
  //   $("#workRead").css("display", "block");
  //   $("#alarm").css("display", "block");
  //   $(".toast").toast("show");
  var workForm = $("#work-form");

  var workSender = workForm.find(".work-sender").val();
  var workStateVar = workForm
    .find('input[name="workState"]:checked')
    .val()
    .trim();
  var workState;
  if (workStateVar === "요청") workState = 0;
  if (workStateVar === "진행") workState = 1;
  if (workStateVar === "완료") workState = 2;

  var workReceiver = workForm.find(".work-receiver").text();
  var workStartDate = workForm.find(".work-start-date").val();
  var workEndDate = $(".work-end-date").val();
  var workSubject = $(".work-subject").val();
  var workContent = $(".work-content").val();
  var proNum = $("#pro-num").val();

  var data = {
    workSender: workSender,
    workReceiver: workReceiver,
    workSubject: workSubject,
    workState: workState,
    workContent: workContent,
    workStartDate: workStartDate,
    workEndDate: workEndDate,
    proNum: proNum,
  };

  console.log(data);

  $.ajax({
    url: root + "/workspace/add-work.do",
    method: "post",
    data: data,
    dataType: "text",
  })
    .then(function (num) {
      num = num.trim();

      var workTmpl = document.getElementById("work-tmpl");
      var copyWorkTmpl = workTmpl.cloneNode(true);
      copyWorkTmpl.style.display = "block";
      copyWorkTmpl.id = "work-no-" + num;

      $tmpl = $(copyWorkTmpl);
      $tmpl.find(".work-sender").text(workSender);
      $tmpl
        .find(".work-write-date")
        .text(
          moment(Date.now()).format("yyyy.MM.DD") +
            " (" +
            koreanDays[new Date().getDay()] +
            ")"
        );
      $tmpl.find(".work-subject").text(workSubject);
      $tmpl.find("input[value='" + workStateVar + "']").attr("checked", "");
      $tmpl
        .find("input[name='workState']")
        .not("input[value='" + workStateVar + "']")
        .attr("disabled", "");
      $tmpl
        .find("input[value='" + workStateVar + "']")
        .parent()
        .addClass("active");
      $tmpl.find(".work-receiver").text(workReceiver);
      $tmpl.find(".work-start-date").val(workStartDate);
      $tmpl.find(".work-end-date").val(workEndDate);
      $tmpl.find(".work-content").text(workContent);
      copyWorkTmpl.querySelector(".work-edit").onclick = editWork;
      copyWorkTmpl.querySelector(".work-edit-cancel").onclick = cancelEdit;
      copyWorkTmpl.querySelector(".work-edit-ok").onclick = okEdit;
      copyWorkTmpl.querySelector(".work-delete").onclick = deleteWork;

      $form = $(workForm);
      $form.find(".work-subject").val("");
      $form
        .find("input[value='" + workStateVar + "']")
        .removeAttr("checked", "");
      $form
        .find("input[value='" + workStateVar + "']")
        .parent()
        .removeClass("active");
      $form.find("input[value='요청']").attr("checked", "");
      $form.find("input[value='요청']").parent().addClass("active");
      // $form.find(".work-receiver").text('');
      $form.find(".work-start-date").val("");
      $form.find(".work-end-date").val("");
      $form.find(".work-content").val("");

      var workList = document.getElementById("work-list");
      workList.prepend(copyWorkTmpl);
    })
    .catch(function (err) {
      alert("일감을 작성하지 못했습니다. 다시 시도해주세요.");
    });

  return false;
}

function init() {
  var workList = document.querySelector("#work-list");
  var workEdit = workList.querySelectorAll(".work-edit");
  var editCancelBtn = workList.querySelectorAll(".work-edit-cancel");
  var editOkBtn = workList.querySelectorAll(".work-edit-ok");
  var deleteBtn = workList.querySelectorAll(".work-delete");

  // 일감 삭제 버튼
  [].forEach.call(workEdit, function (item) {
    item.onclick = editWork;
  });

  // 일감 수정 취소 버튼
  [].forEach.call(editCancelBtn, function (item) {
    item.onclick = cancelEdit;
  });

  // 일감 수정 전송 버튼
  [].forEach.call(editOkBtn, function (item) {
    item.onclick = okEdit;
  });

  // 일감 수정 전송 버튼
  [].forEach.call(deleteBtn, function (item) {
    item.onclick = deleteWork;
  });
}

function editWork(e) {
  e.preventDefault();

  var work = e.target.closest("[id^='work-no-']");
  work.querySelector(".writer-row").classList.add("d-none");

  work.querySelector("h5.work-subject").classList.add("d-none");
  work.querySelector("input.work-subject").classList.remove("d-none");
  work.querySelector("input.work-subject").value = work.querySelector(
    "h5.work-subject"
  ).innerText;

  work
    .querySelectorAll("input[name='workState'][disabled]")
    .forEach(function (i) {
      i.removeAttribute("disabled");
    });
  beforeEditState.btnState = work
    .querySelector("input[name='workState']:checked")
    .value.trim();

  work.querySelector(".receiver-search").removeAttribute("disabled");

  work.querySelector(".work-start-date").removeAttribute("readonly");
  work.querySelector(".work-end-date").removeAttribute("readonly");

  work.querySelector("div.work-content").classList.add("d-none");
  work.querySelector("textarea.work-content").classList.remove("d-none");
  work.querySelector("textarea.work-content").innerText = work.querySelector(
    "div.work-content"
  ).innerText;

  work.querySelector(".more").classList.add("d-none");
  work.querySelector(".edit-more").classList.remove("d-none");
}

function cancelEdit(e) {
  var work = e.target.closest("[id^='work-no-']");
  work.querySelector(".writer-row").classList.remove("d-none");

  work.querySelector("h5.work-subject").classList.remove("d-none");
  work.querySelector("input.work-subject").classList.add("d-none");

  work
    .querySelector("input[value='" + beforeEditState.btnState + "']")
    .setAttribute("checked", "");
  work
    .querySelector("input[value='" + beforeEditState.btnState + "']")
    .parentNode.classList.add("active");

  work
    .querySelectorAll(
      "input[name='workState']:not([value='" + beforeEditState.btnState + "'])"
    )
    .forEach(function (i) {
      i.setAttribute("disabled", "");
      i.removeAttribute("checked", "");
      i.parentNode.classList.remove("active");
    });

  work.querySelector(".receiver-search").setAttribute("disabled", "");

  work.querySelector(".work-start-date").setAttribute("readonly", "");
  work.querySelector(".work-end-date").setAttribute("readonly", "");

  work.querySelector("div.work-content").classList.remove("d-none");
  work.querySelector("textarea.work-content").classList.add("d-none");

  work.querySelector(".more").classList.remove("d-none");
  work.querySelector(".edit-more").classList.add("d-none");
}

function okEdit(e) {
  e.preventDefault();

  var work = e.target.closest("[id^='work-no-']");
  var form = work.querySelector("form");

  var workStateVar = $(form)
    .find('input[name="workState"]:checked')
    .val()
    .trim();
  var workState;
  if (workStateVar === "요청") workState = 0;
  if (workStateVar === "진행") workState = 1;
  if (workStateVar === "완료") workState = 2;

  var data = {
    workNum: work.id.substr(8),
    workReceiver: form.querySelector(".work-receiver").innerText,
    workSubject: form.querySelector("input.work-subject").value,
    workContent: form.querySelector("textarea.work-content").value,
    workState: workState,
    workStartDate: form.querySelector(".work-start-date").value,
    workEndDate: form.querySelector(".work-end-date").value,
  };

  $.ajax({
    url: root + "/workspace/edit-work.do",
    method: "post",
    data: data,
    dataType: "text",
  })
    .then(function () {
      work.querySelector(".writer-row").classList.remove("d-none");

      work.querySelector("h5.work-subject").classList.remove("d-none");
      work.querySelector("h5.work-subject").innerText = work.querySelector(
        "input.work-subject"
      ).value;
      work.querySelector("input.work-subject").classList.add("d-none");

      work
        .querySelectorAll("input[name='workState']:not(:checked)")
        .forEach(function (i) {
          i.setAttribute("disabled", "");
        });

      work.querySelector(".receiver-search").setAttribute("disabled", "");

      work.querySelector(".work-start-date").setAttribute("readonly", "");
      work.querySelector(".work-end-date").setAttribute("readonly", "");

      work.querySelector("div.work-content").classList.remove("d-none");
      work.querySelector("div.work-content").innerText = work.querySelector(
        "textarea.work-content"
      ).value;
      work.querySelector("textarea.work-content").classList.add("d-none");

      work.querySelector(".more").classList.remove("d-none");
      work.querySelector(".edit-more").classList.add("d-none");
    })
    .catch(function () {
      alert("수정 되지 못했습니다. 다시 시도해주세요.");
    });
}

function deleteWork(e) {
  e.preventDefault();

  var choose = confirm("정말로 삭제하시겠습니까?");

  if (choose) {
    var work = e.target.closest("[id^='work-no-']");
    var data = {
      workNum: work.id.substr(8),
    };

    $.ajax({
      url: root + "/workspace/delete-work.do",
      method: "get",
      data: data,
      dataType: "text",
    })
      .then(function () {
        work.remove();
      })
      .catch(function () {
        alert("삭제되지 못했습니다. 다시 시도해주세요.");
      });
  }
}

init();
