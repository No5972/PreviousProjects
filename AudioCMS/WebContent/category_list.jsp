<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>类别管理</title>
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="manage_content">
<a href="category!inputCategory.action">添加类别</a>
<p style="color:red; text-align: center;"><% if (session.getAttribute("errMsg_category")!=null) out.print(session.getAttribute("errMsg_category")); %></p>
<s:if test="#request.clist.size()!=0">
	<table style="width: 100%; text-align: center; border-spacing:0;">
		<tr>
			<td style="width:50%; border: 1px solid #ddd;">类别名称</td><td style="width:50%; border: 1px solid #ddd;">基本操作</td>
		</tr>
		<s:iterator value="#request.clist" var="category">
		<tr>
			<td style="border: 1px solid #ddd;"><s:property value="#category.name"/></td>
			<td style="border: 1px solid #ddd;"><a href="category!updateInput.action?category.id=<s:property value="#category.id"/>">编辑</a><span>&nbsp;</span><a href="category!delCategory.action?category.id=<s:property value="#category.id"/>">删除</a></td>
		</tr>
		</s:iterator>
	</table>
</s:if>
</div>
</body>
</html>