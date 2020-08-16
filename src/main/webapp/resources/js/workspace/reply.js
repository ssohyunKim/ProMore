$("textarea.autosize").on("keydown keyup", function () {
  $(this)
    .height(1)
    .height($(this).prop("scrollHeight") + 12);
});

// single
var replyTmpl = document.querySelector("#reply-tmpl");

function init() {
  // static
  var replyForms = document.querySelectorAll("[id^='work-no-'] .reply-form");
  var replyLikeBtns = document.querySelectorAll(
    "[id^='reply-no-'] .reply-like"
  );
  var replyEditBtns = document.querySelectorAll(
    "[id^='reply-no-'] .reply-edit"
  );
  var replyDeleteBtns = document.querySelectorAll(
    "[id^='reply-no-'] .reply-delete"
  );

  // static
  [].forEach.call(replyForms, function (form) {
    form.onsubmit = addReply;
  });

  [].forEach.call(replyLikeBtns, function (btn) {
    btn.onclick = likeReply;
  });

  [].forEach.call(replyEditBtns, function (btn) {
    btn.onclick = editReply;
  });

  [].forEach.call(replyDeleteBtns, function (btn) {
    btn.onclick = deleteReply;
  });
}

init();

// onsubmit에 추가
function addReply(e) {
  e.preventDefault();

  var work = this.closest("[id^='work-no-']");
  var list = work.querySelector(".reply-list");
  var replyContent = this["replyContent"];
  var workNum = work.id.substr(8);

  var data = new FormData(this);

  data.append("replyId", memId);
  data.append("workNum", workNum);

  $.ajax({
    url: root + "/work-reply/add-reply.do",
    method: "post",
    data: data,
    dataType: "text",
    enctype: "multipart/form-data",
    contentType: false,
    processData: false,
  })
    .then(function (num) {
      if (parseInt(num.trim()) <= 0) return new Error();

      // dynamic
      var copyReply = replyTmpl.cloneNode(true);
      copyReply.classList.remove("d-none");
      copyReply.id = "reply-no-" + num;
      list.appendChild(copyReply);

      // 가짜 데이터 바인딩
      copyReply.querySelector(".reply-writer").innerText = memId;
      copyReply.querySelector(".reply-write-date").innerText =
        moment(Date.now()).format("yyyy-MM-DD") +
        moment(Date.now()).format(" HH:mm:ss");
      copyReply.querySelector(
        ".reply-content"
      ).innerHTML = replyContent.value.replace(/\n/g, "<br>");
      replyContent.value = "";

      // 파일도 업로드 한다면
      var inputFile = data.get("inputFile");
      if (data.get("inputFile").size > 0) {
        copyReply.querySelector(".file-down").classList.remove("d-none");
        copyReply.querySelector(".reply-file-name").innerText = inputFile.name;

        work.querySelector(".input-file").value = "";
        // dynamic
        copyReply
          .querySelector(".download-file")
          .setAttribute(
            "href",
            root + "/workspace/download.do?replyNum=" + num
          );
        // copyReply.querySelector(".delete-file").onclick = deleteReplyFile;
      }

      // dynamic
      copyReply.querySelector(".reply-like").onclick = likeReply;
      copyReply.querySelector(".reply-edit").onclick = editReply;
      copyReply.querySelector(".reply-delete").onclick = deleteReply;
    })
    .catch(function (num) {
      alert("댓글을 작성하는데 실패했습니다.");
    });
}

function deleteReply(e) {
  e.preventDefault();

  var reply = this.closest("[id^='reply-no-']");
  var replyNum = reply.id.trim().substr(9);

  var data = {
    replyNum: replyNum,
  };

  $.ajax({
    url: root + "/work-reply/delete-reply.do",
    method: "get",
    data: data,
    dataType: "text",
  })
    .then(function (chk) {
      if (chk.trim() !== "1") return new Error();

      reply.remove();
    })
    .catch(function () {
      alert("댓글이 삭제되지 못했습니다. 다시 시도해주세요.");
    });
}

// editReply, deleteReplyFile 에서 사용됨
var cachedReply;
var cachedForm;

function editReply(e) {
  e.preventDefault();

  var reply = this.closest("[id^='reply-no-']");
  var replyForm = reply.closest(".reply-list").nextElementSibling;
  var replyContent = replyForm.querySelector(".reply-content");
  cachedForm = replyForm;
  cachedReply = reply.cloneNode(true);

  reply.replaceWith(replyForm);
  replyForm.replyNum = reply.id.trim().substr(9);

  replyContent.value = reply
    .querySelector(".reply-content")
    .innerHTML.replace(/<br>/g, "\n");

  // scroll 높이 만큼 확장
  replyContent.style.height = replyContent.scrollHeight + "px";
  replyContent.focus();

  // 업로드된 파일이 있다면 파일 다운로드 가짜 데이터 바인딩
  if (reply.querySelector(".reply-file-name").innerText) {
    replyForm.querySelector(".file-down").classList.remove("d-none");
    replyForm.querySelector(".reply-file-name").innerText = reply.querySelector(
      ".reply-file-name"
    ).innerText;
    replyForm.querySelector(".delete-file").onclick = deleteReplyFile;
  }

  replyForm.onsubmit = editReplyOk;
}

function editReplyOk(e) {
  e.preventDefault();

  var data = new FormData(this);
  var fileDown = this.querySelector(".file-down");

  data.append("replyId", memId);
  data.append("replyNum", cachedForm.replyNum.trim());

  // 기존 파일이 있는 경우
  if (
    !fileDown.classList.contains("d-none") &&
    data.get("inputFile").size > 0
  ) {
    var choose = confirm("기존 파일을 대체하시겠습니까?");
    if (!choose) return;
  }

  $.ajax({
    url: root + "/work-reply/edit-reply.do",
    method: "post",
    data: data,
    dataType: "text",
    enctype: "multipart/form-data",
    contentType: false,
    processData: false,
  })
    .then(function (chk) {
      if (chk.trim() !== "1") return new Error();

      // 가짜 데이터 바인딩
      cachedReply.querySelector(
        ".reply-content"
      ).innerHTML = cachedForm
        .querySelector(".reply-content")
        .value.replace(/\n/g, "<br>");
      cachedForm.replaceWith(cachedReply);
      if (cachedReply.querySelector(".reply-like"))
        cachedReply.querySelector(".reply-like").onclick = likeReply;
      cachedReply.querySelector(".reply-edit").onclick = editReply;
      cachedReply.querySelector(".reply-delete").onclick = deleteReply;

      // 파일이 업로드 되는 경우(cachedReply에 바인딩)
      if (data.get("inputFile").size > 0) {
        var inputFile = data.get("inputFile");
        cachedReply.querySelector(".reply-file-name").innerText =
          inputFile.name;
        cachedReply
          .querySelector(".download-file")
          .setAttribute(
            "href",
            root + "/workspace/download.do?replyNum=" + cachedForm.replyNum
          );
      }

      // 폼 데이터 초기화
      cachedReply.parentNode.parentNode.appendChild(cachedForm);
      cachedForm.querySelector(".reply-content").value = "";
      cachedForm.querySelector(".reply-content").style.height = "60px";
      cachedForm.onsubmit = editReply;
    })
    .catch(function () {
      alert("댓글을 수정하지 못했습니다. 다시 시도해주세요.");
    });
}

function likeReply(e) {
  e.preventDefault();

  var reply = this.closest("[id^='reply-no-']");
  var replyBtn = this;

  var data = {
    replyNum: reply.id.trim().substr(9),
  };

  $.ajax({
    url: root + "/work-reply/like-reply.do",
    method: "get",
    data: data,
    dataType: "json",
  })
    .then(function (data) {
      var result = data.result;
      if (result.chk > 0) {
        alert("한 댓글 당 한번만 추천할 수 있습니다.");
        return;
      }

      var likeCnt = reply.querySelector(".like-cnt");
      likeCnt.innerText = result.cnt;
      likeCnt.style.color = "#f00";

      replyBtn.replaceWith(likeCnt);
    })
    .catch(function () {
      alert("추천하는데 실패했습니다. 다시 시도해주세요.");
    });
}

function deleteReplyFile(e) {
  e.preventDefault();

  var fileDown = e.target.closest(".file-down");

  var data = {
    replyNum: cachedForm.replyNum,
  };

  $.ajax({
    url: root + "/workspace/delete-file.do",
    method: "get",
    data: data,
    dataType: "text",
  })
    .then(function (chk) {
      if (chk.trim() !== "1") return new Error();

      fileDown.classList.add("d-none");
    })
    .catch(function () {
      alert("파일을 삭제하는데 실패하였습니다.");
    });
}
