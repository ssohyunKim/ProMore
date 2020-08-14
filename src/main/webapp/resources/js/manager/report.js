/**
 *
 */
 var root = "";
 var cusNum = "";
 var cusTitle = "";
 var cusContent = "";
 var fileName = "";

$(document).ready(function() {
    $('#reportReadModal').on('show.bs.modal', function(event) {
        root = $(event.relatedTarget).data('root');
        cusNum = $(event.relatedTarget).data('num');
        cusTitle = $(event.relatedTarget).data('custitle');
        cusContent = $(event.relatedTarget).data('cuscontent');
        fileName = $(event.relatedTarget).data('file');

        $('#staticTitle').text(cusTitle);
        $('#staticContent').text(cusContent);

        if (fileName != "") {
          $('#fileName').text(fileName);
          var url = root + "/manager/reportFileDownload.do?cusNum=" + cusNum;
          $('#fileName').attr("href", url);
        } else {
          $('#fileName').html("첨부파일 없음");
        }
    });

    $('#reportStateModal').on('show.bs.modal', function(event) {
        cusNum = $(event.relatedTarget).data('cusnum');
    });
});

function reportStateChange(root) {
  location.href = root + '/manager/reportStateChange.do?cusNum=' + cusNum;
}
