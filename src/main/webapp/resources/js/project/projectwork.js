var proNum = "";
var name = "";
var content = "";
var max = "";

$(function() {
	$('#projectReadModal').on('show.bs.modal', function(event) {
		proNum = $(event.relatedTarget).data('num');
		
		name = $(event.relatedTarget).data('name');
		$('input[name="proName"]').val(name);

		max = $(event.relatedTarget).data('max');
		$('select[name="proMax"]').val(max).attr("selected", "selected");
		$('select[name="proMax"] option').attr('disabled', true);

		content = $(event.relatedTarget).data('content');
		$('textarea[name="proContent"]').text(content);

	});

	$('#updateBtn').click(function() {
		$('#projectUpdateModal').modal();

		$('input[name="proName"]').val(name);

		$('select[name="proMax"]').val(max).prop("selected", true);
		$('select[name="proMax"] option').attr('disabled', false);

		$('textarea[name="proContent"]').text(content);

		$('#projectReadModal').modal().hide();
	});

	$('#deleteBtn').click(function() {
		$('#removeConfirmModal').modal();
	});
	

	$('.modal').on('hide.bs.modal', function(event) {
		location.reload();
	});
	
});

function updatePjt(root){
	$('#proNum').val(proNum);
	var proName = $('#proName').val();
	var proMax = $('#proMax').val();
	var proContent = $('#proContent').val();
	
	if(!proName){
		alert("제목 입력은 필수입니다.");
		$("#proName").focus();
		return false;
	}
	else{
		updateOk(root, proNum, proName, proMax, proContent);
	}
}

function updateOk(root, number, name, max, content){
	$.ajax({
		url : root + "/project/update.do",
		type : "POST",
		data : {
			proNum : number,
			proName : name,
			proMax : max,
			proContent : content
		},
		success:function(data){
			alert("글을 수정하였습니다.");
			location.href = root + '/workspace/workspace.do?proNum=' + number;
		},
		error:function(){
			alert("글이 수정되지 않았습니다.");
			location.href = root + '/workspace/workspace.do?proNum=' + number;
		}
	})
}


function projectDelete(root) {	
	$('#proNum').val(proNum);
	projectDeleteOk(root, proNum);
}

function projectDeleteOk(root, number){
	$.ajax({
		url : root + '/project/delete.do?proNum='+number,
		type : "GET",
		success : function(data){
			location.href = root + '/project/main.do';
		},
		error:function(){
			alert("에러입니다");
		}
	});

}