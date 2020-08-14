/**
 * 
 */
 
 var cusNum = "";
 
$(document).ready(function() {
    $('#reportReadModal').on('show.bs.modal', function(event) {          
        cusTitle = $(event.relatedTarget).data('custitle');
        cusContent = $(event.relatedTarget).data('cuscontent');
        
        $('#staticTitle').text(cusTitle);
        $('#staticContent').text(cusContent);
    });
    
    $('#reportStateModal').on('show.bs.modal', function(event) {          
        cusNum = $(event.relatedTarget).data('cusnum');
    });
});

function reportStateChange()
{
	var id = "state" + cusNum;
	alert(id);
    var state = document.getElementById(id);
    state.text = "접수 완료";
    state.removeAttribute("href");
}