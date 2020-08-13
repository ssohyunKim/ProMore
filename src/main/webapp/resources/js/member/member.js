/**
 *
 */

var memnum = "";
var memberDto = "";
var radio = "";

function memberUpdate(obj, password) {

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

  for (var i = 0; i < obj.InputMailing.length; i++) {
    if (obj.InputMailing[i].checked) {
      radio = obj.InputMailing[i].value;
    }
  }

  memberDto = {
    memNum: obj.num.value,
    memNickname: obj.nickname.value,
    memPhone: obj.phone.value,
    memEmail: obj.email.value,
    memMailing: radio,
    memSkills: obj.skills.value
  };

  $('#memberUpdateModal').modal();
}

function memberUpdateOk(root) {
  var url = root + '/manager/memberUpdateOk.do';

  $.ajax({
    url: url,
    type: "post",
    dataType: "text",
    success: writeProcess(memberDto),
    error: failProcess()
  });
}

function writeProcess(data) {
  alert(data);
}

function failProcess() {
  alert('실패');
}
