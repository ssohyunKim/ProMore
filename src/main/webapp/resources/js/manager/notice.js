/**
 *
 */
var notNum = "";
var notTitle = "";
var notContent = "";
var fileName = "";

$(document).ready(function() {
  $('#noticeDeleteModal').on('show.bs.modal', function(event) {
    notNum = $(event.relatedTarget).data('num');
  });

  $('#noticeReadModal').on('show.bs.modal', function(event) {
    notNum = $(event.relatedTarget).data('num');
    notTitle = $(event.relatedTarget).data('title');
    notContent = $(event.relatedTarget).data('content');
    fileName = $(event.relatedTarget).data('file');

    $('#staticTitle').text(notTitle);
    $('#staticContent').text(notContent);

    if (fileName != "") {
      $('#fileName').text(fileName);
      //a.attr("href", "#");
    } else {
      $('#fileName').html("첨부파일 없음");
    }
  });

  $('#noticeUpdateModal').on('show.bs.modal', function(event) {
    var a = $('.fileName');
    
    $('#updateNum').val(notNum);
    $('#updateTitle').val(notTitle);
    $('#updateContent').html(notContent);

    if (fileName != "") {
      a.text(fileName);
      //a.attr("href", "#");
    } else {
      a.html("첨부파일 없음");
    }
  });

  var fileTarget = $('#fileupload');
  fileTarget.on('change', function() { // 값이 변경되면
    if (window.FileReader) { // modern browser
      var filename = $(this)[0].files[0].name;
    } else { // old IE
      var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
    }

    // 추출한 파일명 삽입
    $('.fileName').text(filename);
  });
});

function noticeDelete(root) {
  location.href = root + '/manager/noticeDeleteOk.do?notNum=' + notNum;
}
