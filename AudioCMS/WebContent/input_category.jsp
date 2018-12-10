<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加类别</title>
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="manage_content">
<s:form action="category!addCategory.action" method="post" namespace="/">
	<s:textfield name="category.name" label="类别名称"/>
	<s:hidden name="category.topId" value="0"/>
	<s:submit value="添加"/>
</s:form>
</div>
</body>
</html>