// all
var replyTmpl = document.querySelector("#reply-tmpl");
function init() {
  // static
  var replyForm = document.querySelectorAll("[id^='work-no-'] .reply-form");

  // static
  [].forEach.call(replyForm, function (form) {
    form.onsubmit = addReply;
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

  // id -> 현재 세션의 아이디로 변경
  data.append("replyId", id);
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

      var copyReply = replyTmpl.cloneNode(true);
      copyReply.classList.remove("d-none");
      copyReply.removeAttribute("id");
      list.appendChild(copyReply);

      // 가짜 데이터 바인딩
      copyReply.querySelector(".reply-writer").innerText = id;
      copyReply.querySelector(".reply-write-date").innerText =
        moment(Date.now()).format("yyyy-MM-DD") +
        moment(Date.now()).format(" HH:mm:ss");
      copyReply.querySelector(
        ".reply-content"
      ).innerHTML = replyContent.value.replace(/\n/g, "<br/>");
      replyContent.value = "";

      copyReply.querySelector(".reply-like").onclick = null;
      copyReply.querySelector(".reply-edit").onclick = null;
      copyReply.querySelector(".reply-edit").onclick = null;
    })
    .catch(function (num) {
      alert("댓글을 작성하는데 실패했습니다.");
    });
}
