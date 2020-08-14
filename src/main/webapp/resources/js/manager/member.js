/**
 * 
 */
 
 var memnum ="";
 
 $(document).ready(function(){
   $('#memberDeleteModal').on('show.bs.modal', function(event) {          
        memnum = $(event.relatedTarget).data('memnum');
    });
 
 }); 
 
 function memberDelete(root){
	/*alert(root + '/manager/memberDeleteOk.do?memNum=' + memnum);*/
    location.href = root + '/manager/memberDeleteOk.do?memNum=' + memnum;
}