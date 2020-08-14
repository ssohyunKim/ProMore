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