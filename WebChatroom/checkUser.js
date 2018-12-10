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
     document.getElementById("prompt").innerText="本地返回错误：用户名不能为空";
     return false;
   } else
   if (checkExist(result)) {
     document.getElementById("prompt").innerText="服务器返回错误：该用户名已被使用";
     return false;
   } else {
     return true;
   }
}

window.onload=checkExist();