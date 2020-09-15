/**
 * 
 */

var proNum="";
var name="";
var content="";
var max="";

$(function(){
	$('#mainReadModal').on('show.bs.modal', function(event) {
		proNum = $(event.relatedTarget).data('num');
		
		name = $(event.relatedTarget).data('name');
		$('input[name="proName"]').val(name);
		
		max = $(event.relatedTarget).data('max');
	 	$('select[name="proMax"]').val(max).attr("selected", "selected");
		$('select[name="proMax"] option').attr('disabled', true);
		
		content = $(event.relatedTarget).data('content');
		$('textarea[name="proContent"]').text(content);
		
	});
	
	$('#projectConfirmModal').on('show.bs.modal', function(event) {
		proNum = $(event.relatedTarget).data('num');
	});
	
	$('#applyBtn').click(function(){
		$('#applyConfirmModal').modal();
	});
		
});

function writePjt(root){
	var proName= $("#proName").val();
	var proMax = $("#proMax").val();
	var proContent= $("#proContent").val();
	
	if(!proName){
		alert("제목 입력은 필수입니다.");
		$("#proName").focus();
		return false;
	}
	else{
		writeOk(root, proName, proMax, proContent);
	} 	 	
}

function writeOk(root, name, max, content){
	$.ajax({
		url : root + "/project/writeOk.do",
		type : "POST",
		data : {
			proName : name,
			proMax : max,
			proContent : content
		},
		success:function(data){
			alert("새로운 프로젝트을 작성했습니다.");
			location.href = root + "/project/main.do";
		},
		
		error:function(){
			alert("프로젝트가 작성되지 않았습니다.");
			location.href = root + "/project/main.do";
		}
		
	});
}

$(function(){
	$('#applyConfirmModal').on('show.bs.modal', function(event){
		proNum = $(event.relatedTarget).data('num');
	});
	
});

function projectApply(root){
	$('#proNum').val(proNum);
	projectApplyOk(root,proNum);
}
 
function projectApplyOk(root, number){
	$.ajax({
			url : root + '/project/projectApply.do?proNum='+proNum,
			type : "GET",
			success : function(data){
				location.href =  root + '/workspace/workspace.do?proNum='+proNum;
			},
			error : function(){
				alert("에러입니다");
				location.href =  root + '/project/main.do';
			}
		});
}




function projectSelect(root){
	$('#proNum').val(proNum);
	projectSelectOk(root, proNum);
}

function projectSelectOk(root, number){
	$.ajax({
		url : root + '/project/projectSelect.do?proNum='+number,
		type : "GET",
		success:function(data){
			location.href= root + '/project/projectSelect.do?proNum='+number;
		},
		error:function(){
			alert("에러입니다.");
		}	
	});

}

