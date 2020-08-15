var koreanDays = ["일", "월", "화", "수", "목", "금", "토"];
var beforeEditState = {};

function managerSelect(root) {
  //alert("확인"+root);
  var url = root + "/workspace/manager.do";
  alert(url);
  window.open(url, "", "width=300px, height=200px");
  //"주소","윈도우이름","가로세로스크롤"
}

// 서버 렌더링 후 만들어진 일감 목록 리스너 설정
function init() {
  var workList = document.querySelector("#work-list");

  var workEdit = workList.querySelectorAll(".work-edit");
  var editCancelBtn = workList.querySelectorAll(".work-edit-cancel");
  var editOkBtn = workList.querySelectorAll(".work-edit-ok");

  var deleteBtn = workList.querySelectorAll(".work-delete");
  var deleteFileBtn = workList.querySelectorAll(".delete-file");

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

  // 파일 삭제 전송 버튼
  [].forEach.call(deleteFileBtn, function (item) {
    item.onclick = deleteFile;
  });
}

// 작성 폼 내용을 바탕으로 템플릿에 값을 채워 넣어 복사
function writeToServer(obj) {
  var workForm = $("#work-form");

  var workSender = workForm.find(".work-sender").val();
  var workStateVar = workForm
    .find('input[name="workState"]:checked')
    .val()
    .trim();
  var workState;
  if (workStateVar === "요청") workState = 0;
  else if (workStateVar === "진행") workState = 1;
  else if (workStateVar === "완료") workState = 2;

  var workReceiver = workForm.find(".work-receiver").text();
  var workStartDate = workForm.find(".work-start-date").val();
  var workEndDate = $(".work-end-date").val();
  var workSubject = $(".work-subject").val();
  var workContent = $(".work-content").val();
  var proNum = $("#pro-num").val();

  var data = new FormData(obj);
  data.delete("workState");
  data.append("workSender", workSender);
  data.append("workReceiver", workReceiver);
  //   data.append("workSubject", workSubject);
  data.append("workState", workState);
  //   data.append("workStartDate", workStartDate);
  //   data.append("workEndDate", workEndDate);
  //   data.append("workContent", workContent);
  //   data.append("inputFile", inputFile);
  data.append("proNum", proNum);

  console.log(data);

  $.ajax({
    url: root + "/workspace/add-work.do",
    method: "post",
    data: data,
    dataType: "text",
    enctype: "multipart/form-data",
    contentType: false,
    processData: false,
  })
    .then(function (num) {
      num = num.trim();
      if (parseInt(num) <= 0)
        throw new Error("파일을 업로드하는데 실패하였습니다.");

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
      $tmpl.find(".work-content").html(workContent.replace(/\n/g, "<br>"));
      copyWorkTmpl.querySelector(".reply-form").onsubmit = addReply;
      copyWorkTmpl.querySelector(".work-edit").onclick = editWork;
      copyWorkTmpl.querySelector(".work-edit-cancel").onclick = cancelEdit;
      copyWorkTmpl.querySelector(".work-edit-ok").onclick = okEdit;
      copyWorkTmpl.querySelector(".work-delete").onclick = deleteWork;

      // 업로드 하는 파일이 있을 때
      var uploadingFile = data.get("inputFile");
      if (uploadingFile !== null && uploadingFile.size > 0) {
        var fileDown = $tmpl.find(".file-down");
        fileDown.removeClass("d-none");
        fileDown.find(".work-file-name").text(uploadingFile.name);
        fileDown
          .find(".download-file")
          .attr("href", root + "/workspace/download.do?workNum=" + num);
        fileDown
          .find(".delete-file")
          .attr("href", root + "/workspace/delete-file.do?workNum=" + num);
        fileDown.find(".delete-file").click(deleteFile);
      }

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
      $form.find(".input-file").val("");

      var workList = document.getElementById("work-list");
      workList.prepend(copyWorkTmpl);
    })
    .catch(function (err) {
      alert("일감을 작성하지 못했습니다. 다시 시도해주세요.");
    });

  return false;
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
  var textarea = work.querySelector("textarea.work-content");
  textarea.classList.remove("d-none");
  textarea.value = work
    .querySelector("div.work-content")
    .innerHTML.replace(/<br>/g, "\n");
  textarea.style.height = textarea.scrollHeight + "px";
  textarea.focus();

  work.querySelector(".file-up").classList.remove("d-none");
  work.querySelector(".download-file").classList.add("d-none");
  work.querySelector(".delete-file").classList.remove("d-none");

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

  work.querySelector(".file-up").classList.add("d-none");
  work.querySelector(".download-file").classList.remove("d-none");
  work.querySelector(".delete-file").classList.add("d-none");

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
  else if (workStateVar === "진행") workState = 1;
  else if (workStateVar === "완료") workState = 2;

  //   var data = {
  //  workNum: work.id.substr(8),
  //  workReceiver: form.querySelector(".work-receiver").innerText,
  //  workSubject: form.querySelector("input.work-subject").value,
  //  workContent: form.querySelector("textarea.work-content").value,
  //  workState: workState,
  //  workStartDate: form.querySelector(".work-start-date").value,
  //  workEndDate: form.querySelector(".work-end-date").value,
  //   };

  data = new FormData(form);
  data.delete("workState");

  data.append("workNum", work.id.substr(8));
  data.append("workReceiver", form.querySelector(".work-receiver").innerText);
  data.append("workState", workState);

  var fileDown = form.querySelector(".file-down");
  if (
    fileDown !== null &&
    !fileDown.classList.contains("d-none") &&
    data.get("inputFile").size > 0
  ) {
    var choose = confirm("파일을 대체하시겠습니까?");
    if (!choose) data.delete("inputFile");
  }

  $.ajax({
    url: root + "/workspace/edit-work.do",
    method: "post",
    data: data,
    dataType: "text",
    enctype: "multipart/form-data",
    contentType: false,
    processData: false,
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

      // 업로드 하는 파일이 있을 때
      $work = $(work);
      var uploadingFile = data.get("inputFile");
      if (uploadingFile !== null && uploadingFile.size > 0) {
        var fileDown = $work.find(".file-down");
        fileDown.removeClass("d-none");
        fileDown.find(".work-file-name").text(uploadingFile.name);
        fileDown
          .find(".download-file")
          .attr(
            "href",
            root + "/workspace/download.do?workNum=" + data.get("workNum")
          );
        fileDown
          .find(".delete-file")
          .attr(
            "href",
            root + "/workspace/delete-file.do?workNum=" + data.get("workNum")
          );
        //   fileDown.find(".delete-file").click(deleteFile);
      }

      work.querySelector(".receiver-search").setAttribute("disabled", "");

      work.querySelector(".work-start-date").setAttribute("readonly", "");
      work.querySelector(".work-end-date").setAttribute("readonly", "");

      work.querySelector("div.work-content").classList.remove("d-none");
      work.querySelector("div.work-content").innerHTML = work
        .querySelector("textarea.work-content")
        .value.replace(/\n/g, "<br>");
      work.querySelector("textarea.work-content").classList.add("d-none");

      work.querySelector(".file-up").classList.add("d-none");
      work.querySelector(".download-file").classList.remove("d-none");
      work.querySelector(".delete-file").classList.add("d-none");

      work.querySelector(".more").classList.remove("d-none");
      work.querySelector(".edit-more").classList.add("d-none");

      work.querySelector(".input-file").value = "";
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

function deleteFile(e) {
  e.preventDefault();

  var target = e.target;
  var work = target.closest("[id^='work-no-']");

  $.ajax({
    url: target.closest(".delete-file").getAttribute("href"),
    method: "get",
    dataType: "text",
  })
    .then(function (chk) {
      chk = parseInt(chk.trim());
      if (chk === 0) throw new Error();
      else if (chk === 1) {
        work.querySelector(".file-down").classList.add("d-none");
      }
    })
    .catch(function () {
      alert("삭제되지 못했습니다. 다시 시도해주세요.");
    });
}

init();
