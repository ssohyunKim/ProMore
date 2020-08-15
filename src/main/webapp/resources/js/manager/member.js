/**
 * 
 */
 
 var memNum ="";
 
 $(document).ready(function(){
   $('#memberDeleteModal').on('show.bs.modal', function(event) {          
        memNum = $(event.relatedTarget).data('memnum');
        var memName = $(event.relatedTarget).data('name');
        
        var question = "'" + memName + "' 님을 탈퇴 처리하시겠습니까?";
        
        $('#memberDeleteTitle').html(question);
    });
 
 }); 
 
 function memberDelete(root){
    location.href = root + '/manager/memberDeleteOk.do?memNum=' + memNum;
}