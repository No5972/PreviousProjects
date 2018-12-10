<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改密码</title>
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="manage_content"><center>
<p style="color:red;"><% if (session.getAttribute("errMsg_pass")!=null) out.print(session.getAttribute("errMsg_pass")); %></p>
<s:form action="manager!updatePassword.action" method="post" namespace="/">
	<s:hidden name="manager.id" value="%{#session.login.id}"/>
	<s:password label="原密码" value="%{#session.login.password}" name="oldPassword" />
	<s:password label="新密码" name="manager.password" />
	<s:password label="确认密码" name="newpwd"/>
	<s:hidden name="manager.account" value="%{#session.login.account}" />
	<s:hidden name="manager.name" value="%{#session.login.name}" />
	<s:hidden name="manager.number" value="%{#session.login.number}" />
	<s:submit value="确认修改"/>
</s:form>
</center>
</div>
</body>
</html>