<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<% if (session.getAttribute("errMsg")!=null) out.print(session.getAttribute("errMsg")); %>
<form action="managerLogin!login.action" method="post" name="myform">
用户名：<input type="text" name="manager.account"/><br/>
密　码：<input type="password" name="manager.password"/><br/>
<input type="submit" value="登录"/>
</form>
</center>
</body>
</html>