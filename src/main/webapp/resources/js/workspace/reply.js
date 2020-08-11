function init() {
  var replyForm = document.querySelector("#reply-form");
  var replyList = document.querySelector(".reply-list");
  var replyTmpl = document.querySelector("#reply-tmpl");
  var replyFileSel = document.querySelector("#reply-file-select");
  var uploadProgress = document.querySelector(".upload-progress");

  // 리스너
  replyForm.onsubmit = function (e) {
    e.preventDefault();

    var myReplyContent = document.querySelector("#reply-my-content");
    var replyContent = myReplyContent.value.replace("/\n/g", "<br/>");
    myReplyContent.value = "";

    // 업로드할 파일 없음
    if (replyFileSel.files.length === 0) {
    }

    //AJAX
    // ...

    var copyReply = replyTmpl.cloneNode(true);
    copyReply.classList.remove("d-none");
    replyList.appendChild(copyReply);

    copyReply.querySelector(".reply-content").innerText = replyContent;
    // copyReply.querySelector(".reply-writer").innerText = replyContent;
    // copyReply.querySelector(".reply-write-date").innerText = replyContent;
  };
}

init();
