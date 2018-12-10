<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:useBean id="command" class="io.github.no5972.audiocms.models.Category" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加类别</title>
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
</head>
<body>
<jsp:include page="manage_menu.jsp"></jsp:include>
<div class="manage_content">
<form:form action="manage_addCategory.php" method="post" namespace="/">
	类别名称：<form:input path="name" required /><br/>
	<form:hidden path="id"/><br/>
	<input type="submit" value="添加"/>
</form:form>
</div>
</body>
</html>