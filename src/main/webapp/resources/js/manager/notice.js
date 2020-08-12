/**
 * 
 */
 
 $(function(){
 	dialog.set({
 		modal: true,
 		buttons: {
 			삭제: function() {
 				dialog.close()
 			},
 			취소: function() {
 				dialog.close()
 			}
 		}
 	})
 })
 
 
 function noticeDelete(){
 	dialog.open("<p>정말로 삭제하시겠습니까?</p>")
 }

$('#noticeReadModal').on('show.bs.modal', function (event) {
	var a = $(event.relatedTarget)
	var noticeTitle = a.data('whatever')
	var modal = $(this)
	
	modal.find('.modal-title').text(noticeTitle)
	modal.find
})