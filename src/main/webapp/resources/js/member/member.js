/**
 *
 */
var memnum = "";
var memberDto = "";
var radio = "";

function memberUpdateCheck(obj, password) {

  if (obj.password.value != obj.passwordCheck.value) {
    alert("비밀번호가 다릅니다. 비밀번호를 확인하세요.");
    obj.passwordCheck.focus();
    return false;
  }

  if (obj.password.value != password) {
    alert(obj.password.value + " _ " + password);
    alert("비밀번호가 틀렸습니다. 비밀번호를 확인하세요.");
    obj.password.focus();
    return false;
  }

  for (var i = 0; i < obj.memMailing.length; i++) {
    if (obj.memMailing[i].checked) {
      radio = obj.memMailing[i].value;
    }
  }

  //$('#memberUpdateModal').modal();
}

function memberDelete(obj, password){
	//alert("확인");
	//alert("넣은값"+obj.password.value + " _ DB값" + password);

	if(obj.password.value != password){
		alert("비밀번호가 틀렸습니다. 비밀번호를 확인하세요.");
		//alert(obj.password.value + " _ " + password);
		obj.password.focus();
		return false; 
	}
	

}