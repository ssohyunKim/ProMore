/**
 * 
 */
var notNum = "";

$(document).ready(function() {
    $('#noticeDeleteModal').on('show.bs.modal', function(event) {          
        notNum = $(event.relatedTarget).data('num');
    });
    
    $('#noticeReadModal').on('show.bs.modal', function(event) {          
        notTitle = $(event.relatedTarget).data('title');
        notContent = $(event.relatedTarget).data('content');
        
        $('#staticTitle').text(notTitle);
        $('#staticContent').text(notContent);
    });
});


function noticeDelete(root)
{
    location.href = root + '/manager/noticeDeleteOk.do?notNum=' + notNum;
}