/**
 * 
 */
 
var memnum = "";

$('#noticeReadModal').on('show', function() {
	var getIdFromRow = $(event.target).closest('a').data('id')
    consol.log($(getIdFromRow))
})

$(document).ready(function() {     
    $('#memberUpdateModal').on('show.bs.modal', function(event) {          
        memnum = $(event.relatedTarget).data('memnum');
    });
});


function memberUpdate(root)
{
    location.href = root + '/manager/memberUpdate.do?memnum=' + memnum;
}