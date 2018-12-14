<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:useBean id="command" class="io.github.no5972.audiocms.models.Category" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改类别</title>
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
</head>
<body>
<jsp:include page="manage_menu.jsp"></jsp:include>
<div class="manage_content">
<form:form action="manage_updateCategory.php" method="post" namespace="/">
	<form:hidden path="id" value="${ originalCategory.id }"/><br/>
	类别名称：<form:input path="name" value="${ originalCategory.name }" required/><br/>
	<input type="submit" value="确认更新"/>
</form:form>
</div>
</body>
</html>