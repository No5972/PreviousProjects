<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="command" class="io.github.no5972.audiocms.models.Manager" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改密码</title>
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
</head>
<body>
<jsp:include page="manage_menu.jsp"></jsp:include>
<div class="manage_content"><center>
<p style="color:red;">${ errMsg_pass }</p>
<form:form action="manage_changepassword.php" method="post">
	<form:hidden path="id" value="${ manager_id }"/>
	原密码　：<input type="password" name="oldPassword" required/><br/>
	新密码　：<input type="password" name="newPassword" required><br/>
	确认密码：<input type="password" name="confirmPassword" required/><br/>
	<input type="submit" value="确认修改"/>
</form:form>
</center>
</div>
</body>
</html>