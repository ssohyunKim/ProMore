/**
 * 
 */
var notnum = "";

$('#noticeReadModal').on('show', function() {
	var getIdFromRow = $(event.target).closest('a').data('id')
    consol.log($(getIdFromRow))
})

$(document).ready(function() {     
    $('#noticeDeleteModal').on('show.bs.modal', function(event) {          
        notnum = $(event.relatedTarget).data('notnum');
        
        alert(notnum)
    });
    
    $('#noticeReadModal').on('show.bs.modal', function(event) {          
        nottitle = $(event.relatedTarget).data('nottitle');
        notcontent = $(event.relatedTarget).data('notcontent');
        
        $('#staticTitle').text(nottitle);
        $('#staticContent').text(notcontent);
    });
});


function noticeDelete()
{
    alert("삭제되었습니다." + notnum)
}

