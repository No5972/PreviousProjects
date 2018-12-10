<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>学生管理 - 学生信息管理系统</title>
<link rel="stylesheet" href="switch.css" />
<link rel="stylesheet" href="query.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
var submitChange = function() {
	if (document.getElementById("newPwd").value!=document.getElementById("ConfirmPwd").value) {
		document.getElementById("errText").innerText="错误：两次输入新密码不一致";
		return;
	}
	$.ajax({
		type:"POST",
		url:"updatePassword.php",
		data:
		{
			username : "${ username }",
			oldPwd : document.getElementById("oldPwd").value,
			newPwd : document.getElementById("newPwd").value,
		}, 
		success:function(data,status) {
			if (data.isSuccess==-1) document.getElementById("errText").innerText="错误：修改非当前用户";
			if (data.isSuccess==-2) document.getElementById("errText").innerText="错误：原密码错误";
			if (data.isSuccess==-3) document.getElementById("errText").innerText="错误：未知错误";
			if (data.isSuccess==0) window.location.href="manage_main.php";
		}	
	});
}
</script>
</head>
<body>
<jsp:include page="commonheader.jsp"></jsp:include>
<br>
<center>
<p style="color:red;" id="errText"></p>
原密码　：<input type="password" id="oldPwd"/><br/>
新密码　：<input type="password" id="newPwd"/><br/>
确认密码：<input type="password" id="ConfirmPwd"/><br/>
<button id="submit" onclick="submitChange()">提交</button> 
</center>
</body>
<script src="jquery-3.1.1.js"></script>
</html>