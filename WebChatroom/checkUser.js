var chk;

function checkExist(result) {
	$.get("checkExist.jsp?username="+result, function(data,status) {
		if (data=="true") {
			chk=true;
		} else { 
			chk=false; 
		}
	});
	return chk;
}

function checkUser(){
   var result = document.getElementById("name").value;
   if(result == ""  ){
     document.getElementById("prompt").innerText="���ط��ش����û�������Ϊ��";
     return false;
   } else
   if (checkExist(result)) {
     document.getElementById("prompt").innerText="���������ش��󣺸��û����ѱ�ʹ��";
     return false;
   } else {
     return true;
   }
}

window.onload=checkExist();