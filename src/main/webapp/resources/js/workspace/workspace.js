var koreanDays = ["일", "월", "화", "수", "목", "금", "토"];
var beforeEditState = "0";
var beforeEditContent = "";
var beforeEditHeight = "0px";
var workForm = document.querySelector("#work-form"); // form
var workList = document.querySelector("#work-list"); // div
var workTmpl = document.querySelector("#work-tmpl"); // div

// 페이지 로딩 때마다 리스너 바인딩
function init() {
  var workEditBtns = workList.querySelectorAll(".work-edit");
  var editCancelBtns = workList.querySelectorAll(".work-edit-cancel");
  var workNoForms = workList.querySelectorAll("[id^='work-no-'] form");
  var workContents = workList.querySelectorAll(".work-content");

  var deleteBtns = workList.querySelectorAll(".work-delete");
  var deleteFileBtns = workList.querySelectorAll(".delete-file");

  workForm.onsubmit = addWork;

  // 일감 삭제 버튼
  [].forEach.call(workEditBtns, function (item) {
    item.onclick = editWork;
  });

  // 일감 수정 취소 버튼
  [].forEach.call(editCancelBtns, function (item) {
    item.onclick = cancelEdit;
  });

  // 일감 수정 전송 버튼
  [].forEach.call(workNoForms, function (item) {
    item.onsubmit = okEdit;
  });

  // 일감 수정 전송 버튼
  [].forEach.call(deleteBtns, function (item) {
    item.onclick = deleteWork;
  });

  // 파일 삭제 전송 버튼
  [].forEach.call(deleteFileBtns, function (item) {
    item.onclick = deleteFile;
  });

  // workCotent 높이 설정
  [].forEach.call(workContents, function (item) {
    item.style.height = item.scrollHeight + "px";
  });
}

// 작성 폼 내용을 바탕으로 템플릿에 값을 채워 넣어 복사
// workForm에 바인딩
function addWork(e) {
  e.preventDefault();

  var data = new FormData(this);

  $.ajax({
    url: root + "/workspace/add-work.do",
    method: "post",
    data: data,
    dataType: "text",
    enctype: "multipart/form-data",
    contentType: false,
    processData: false,
  })
    .then(function (workNum) {
      workNum = parseInt(workNum.trim());
      if (workNum == 0) throw new Error();

      var copyWorkTmpl = workTmpl.cloneNode(true);
      copyWorkTmpl.classList.remove("d-none");
      copyWorkTmpl.id = "work-no-" + workNum;

      copyWorkTmpl.querySelector("b.work-sender").innerText = data.get(
        "workSender"
      );
      copyWorkTmpl.querySelector("p.work-write-date").innerText =
        moment(Date.now()).format("yyyy.MM.DD") +
        " (" +
        koreanDays[new Date().getDay()] +
        ")";
      copyWorkTmpl.querySelector("h5.work-subject").innerText = data.get(
        "workSubject"
      );
      copyWorkTmpl.querySelector("span.work-receiver").innerText = data.get(
        "workReceiver"
      );
      copyWorkTmpl.querySelector(".work-start-date").value = data.get(
        "workStartDate"
      );
      copyWorkTmpl.querySelector(".work-end-date").value = data.get(
        "workEndDate"
      );
      var workContent = copyWorkTmpl.querySelector(".work-content");
      workContent.value = data.get("workContent");
      workContent.style.height =
        workForm.querySelector(".work-content").scrollHeight + "px";
      autosize(workContent);

      copyWorkTmpl.querySelector(".reply-form").onsubmit = addReply;
      copyWorkTmpl.querySelector(".work-edit").onclick = editWork;
      copyWorkTmpl.querySelector(".work-edit-cancel").onclick = cancelEdit;
      copyWorkTmpl.querySelector("form").onsubmit = okEdit;
      copyWorkTmpl.querySelector(".work-delete").onclick = deleteWork;

      // 파일까지 업로드 한다면
      var uploadingFile = data.get("inputFile");
      if (uploadingFile !== null && uploadingFile.size > 0) {
        var fileDown = copyWorkTmpl.querySelector(".file-down");
        fileDown.classList.remove("d-none");
        fileDown.querySelector(".work-file-name").innerText =
          uploadingFile.name;
        fileDown
          .querySelector(".download-file")
          .setAttribute(
            "href",
            root + "/workspace/download.do?workNum=" + workNum
          );
        var deleteFileBtn = fileDown.querySelector(".delete-file");
        deleteFileBtn.setAttribute(
          "href",
          root + "/workspace/delete-file.do?workNum=" + workNum
        );
        deleteFileBtn.onclick = deleteFile;
      }

      // 작성한 폼 내용 초기화
      workForm.reset();
      workForm.querySelector(".work-content").style.height = "78px";
      workForm.querySelectorAll("input[name='workState']")[0].click();

      workList.prepend(copyWorkTmpl);
      copyWorkTmpl
        .querySelectorAll("input[name='workState']")
        [parseInt(data.get("workState"))].click();
    })
    .catch(function () {
      alert("일감을 생성하지 못했습니다. 다시 시도해주세요.");
    });
}

function editWork(e) {
  e.preventDefault();

  var work = e.target.closest("[id^='work-no-']");

  var workSubjectH5 = work.querySelector("h5.work-subject");
  var workSubjectInput = work.querySelector("input.work-subject");
  workSubjectH5.classList.add("d-none");
  workSubjectInput.classList.remove("d-none");
  workSubjectInput.value = workSubjectH5.innerText;

  beforeEditState = parseInt(
    work.querySelector("input[name='workState']:checked").value.trim()
  );

  var workReceiverW = work.querySelector(".work-receiver-wrap");
  var workReceiverW2 = work.querySelector(".work-receiver-wrap-2");
  workReceiverW.classList.add("d-none");
  workReceiverW2.classList.remove("d-none");
  workReceiverW2.querySelector(
    ".work-receiver"
  ).value = workReceiverW.querySelector(".work-receiver").innerText;

  work.querySelector(".work-start-date").removeAttribute("disabled");
  work.querySelector(".work-end-date").removeAttribute("disabled");

  var workContent = work.querySelector(".work-content");
  workContent.removeAttribute("disabled");
  workContent.style.height = workContent.scrollHeight + "px";
  workContent.focus();
  beforeEditContent = workContent.value;
  beforeEditHeight = workContent.scrollHeight + "px";

  work.querySelector(".file-up").classList.remove("d-none");
  work.querySelector(".download-file").classList.add("d-none");
  work.querySelector(".delete-file").classList.remove("d-none");

  var more = work.querySelector(".more");
  var editMore = work.querySelector(".edit-more");
  if (more) {
    more.classList.add("d-none");
    editMore.classList.remove("d-none");
  }
}

function cancelEdit(e) {
  e.preventDefault();

  var work = e.target.closest("[id^='work-no-']");

  work.querySelector("h5.work-subject").classList.remove("d-none");
  work.querySelector("input.work-subject").classList.add("d-none");

  work.querySelectorAll("input[name='workState']")[beforeEditState].click();

  work.querySelector(".work-receiver-wrap").classList.remove("d-none");
  work.querySelector(".work-receiver-wrap-2").classList.add("d-none");

  work.querySelector(".work-start-date").setAttribute("disabled", "");
  work.querySelector(".work-end-date").setAttribute("disabled", "");

  var workContent = work.querySelector(".work-content");
  workContent.value = beforeEditContent;
  workContent.style.height = beforeEditHeight;
  workContent.setAttribute("disabled", "");

  work.querySelector(".file-up").classList.add("d-none");
  work.querySelector(".download-file").classList.remove("d-none");
  work.querySelector(".delete-file").classList.add("d-none");

  work.querySelector(".more").classList.remove("d-none");
  work.querySelector(".edit-more").classList.add("d-none");
}

function okEdit(e) {
  e.preventDefault();

  var work = this.closest("[id^='work-no-']");
  var fileDown = this.querySelector(".file-down");

  data = new FormData(this);
  data.append("workNum", work.id.substr(8));

  if (
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
      // 서버에 업로드한 파일이 있다면
      var uploadingFile = data.get("inputFile");
      if (uploadingFile !== null && uploadingFile.size > 0) {
        fileDown.classList.remove("d-none");
        fileDown.querySelector(".work-file-name").innerText =
          uploadingFile.name;
        fileDown
          .querySelector(".download-file")
          .setAttribute(
            "href",
            root + "/workspace/download.do?workNum=" + data.get("workNum")
          );
        fileDown.querySelector(".delete-file").onclick = deleteFile;
      }

      var workSubjectH5 = work.querySelector("h5.work-subject");
      var workSubjectInput = work.querySelector("input.work-subject");
      workSubjectH5.classList.remove("d-none");
      workSubjectInput.classList.add("d-none");
      workSubjectH5.innerText = workSubjectInput.value;

      work
        .querySelectorAll("input[name='workState']")
        [parseInt(data.get("workState"))].click();

      var workReceiverW = work.querySelector(".work-receiver-wrap");
      var workReceiverW2 = work.querySelector(".work-receiver-wrap-2");
      workReceiverW.classList.remove("d-none");
      workReceiverW2.classList.add("d-none");
      workReceiverW.querySelector(
        ".work-receiver"
      ).innerText = workReceiverW2.querySelector(".work-receiver").value;

      work.querySelector(".work-start-date").setAttribute("disabled", "");
      work.querySelector(".work-end-date").setAttribute("disabled", "");

      var workContent = work.querySelector(".work-content");
      workContent.setAttribute("disabled", "");

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
