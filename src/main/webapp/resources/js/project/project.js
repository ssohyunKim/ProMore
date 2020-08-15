/**
 * 
 */

var title="";
var content="";
var cnt="";

 function writePjt(root){
		title = $("#inputTitle").val();
		content = $("#inputContent").val();
		cnt = $("#cnt").val();
		
		var url = root + "/project/write.do?title="+title+"&content="+content+"&cnt="+cnt;
		location.href=url;	
}

