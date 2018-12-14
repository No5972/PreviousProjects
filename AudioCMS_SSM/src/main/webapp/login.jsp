<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:useBean id="command" class="io.github.no5972.audiocms.models.Manager" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>语音播报门户网站 后台登录</title>
</head>
<body>
<script type="text/javascript">
var onSubmit = function() {
	document.myform.submit();
}
</script>
<center>
<h1>语音播报门户网站 后台登录</h1><hr/><br/>
<span style="color:red;"><% if (session.getAttribute("errMsg")!=null) out.print(session.getAttribute("errMsg")); %></span>
<form:form method="POST" action="loginSubmit.php">
用户名：<form:input path="account" /><br/>
密　码：<form:password path="password" /><br/>
<input type="submit" value="登录"/>
</form:form>
</center>
</body>
</html>