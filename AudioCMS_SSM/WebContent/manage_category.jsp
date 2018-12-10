<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>类别管理</title>
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
<script type="text/javascript">
var xx=0, y=0;
document.onmousedown = function (e) { 
	xx = e.view.innerWidth - e.pageX; 
	y = e.pageY; 
	console.log(e.view.innerHeight); 
};

var hideConfirmation = function () {
	document.getElementById('deleteConfirm').style.display="none";
}

var showConfirmation = function (x) {
	document.getElementById('confirmDetele').href="manage_delCategory.php?id="+x;
	document.getElementById('deleteConfirm').style.display="block";
	document.getElementById('deleteConfirm').style.position="absolute";
	document.getElementById('deleteConfirm').style.border="1px solid #000";
	var e = x || window.event;
	//console.log(e);
	document.getElementById('deleteConfirm').style.right=xx-50+"px";
	document.getElementById('deleteConfirm').style.top=y-70+"px";
}
</script>
</head>
<body>
<jsp:include page="manage_menu.jsp"></jsp:include>
<div class="manage_content">
<a href="manage_addCategoryInput.php">添加类别</a>
<p style="color:red; text-align: center;"><% if (session.getAttribute("errMsg_category")!=null) out.print(session.getAttribute("errMsg_category")); %></p>
<c:if test="${ fn:length(allCategories)!=0 }">
	<table style="width: 100%; text-align: center; border-spacing:0;">
		<tr>
			<td style="width:50%; border: 1px solid #ddd;">类别名称</td><td style="width:50%; border: 1px solid #ddd;">基本操作</td>
		</tr>
		<c:forEach items="${ allCategories }" var="category">
		<tr>
			<td style="border: 1px solid #ddd;">${ category.name }</td>
			<td style="border: 1px solid #ddd;"><a href="manage_updateCategoryInput.php?id=${ category.id }">编辑</a><span>&nbsp;</span><a href="#" onclick="showConfirmation(${ category.id })">删除</a></td>
		</tr>
		</c:forEach>
	</table>
</c:if>
</div>
<div class="deleteConfirm" id="deleteConfirm" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p>确定要删除吗？</p>
	<a href="#" id="confirmDetele">确认</a>&nbsp;
	<a href="#" onclick="hideConfirmation()">取消</a>
</div>
</body>
</html>