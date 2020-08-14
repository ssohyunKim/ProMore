/**
 * 
 */
 
$(document).ready(function() {
    $('#reportReadModal').on('show.bs.modal', function(event) {          
        cusTitle = $(event.relatedTarget).data('custitle');
        cusContent = $(event.relatedTarget).data('cuscontent');
        
        $('#staticTitle').text(cusTitle);
        $('#staticContent').text(cusContent);
    });
});

function reportStateChange()
{
    var state = document.getElementById("state");
    state.text = "접수 완료";
    state.removeAttribute("href");
}