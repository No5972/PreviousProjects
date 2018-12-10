<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="command" class="io.github.no5972.audiocms.models.News"
	scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改文章：${ news.title }</title>
<link rel="stylesheet" href="switch.css" />
<link rel="stylesheet" href="manage_content.css" />
<script charset="utf-8" src="editor/kindeditor-all.js"></script>
<script charset="utf-8" src="editor/lang/zh-CN.js"></script>
<script>
	KindEditor.ready(function(K) {
		window.editor = K.create('#news_news_content', {
			uploadJson : '/AudioCMS/upload_json.jsp',
			fileManagerJson : '/AudioCMS/file_manager_json.jsp',
			allowFileManager : true,
			width: "800px",
			height: "600px"
		});
		K.html('#news_news_content', document.getElementById("load_content").value);
	});
</script>
</head>
<body>
	<jsp:include page="manage_menu.jsp"></jsp:include>
	<p style="color:red;">${ errMsg_News }</p>
	<a href="manage_news.php?cid=${ cid }">返回类别：${ currCategoryName }</a>
	<div class="manage_content">
		<form:form action="manage_updatenews.php" method="post" namespace="/">
		<form:hidden path="id" value="${ news.id }"/>
	文章标题：<form:input path="title" value="${ news.title }" required="true" />
			<br />
	类　　别：<select name="cid" id="news_cid">
				<option value="-1">选择类别</option>
				<c:forEach items="${ allCategories }" var="category">
					<option value="${ category.id }">${ category.name }</option>
				</c:forEach>
			</select>
			<br />
	文章内容：<textarea id="news_news_content" name="content" >${ news.content }</textarea>
	
			<input type="submit" value="提交" />
		</form:form>
		<script type="text/javascript">
			var select = document.getElementById('news_cid');
			for (var i = 0; i < select.options.length; i++) {
				if (select.options[i].value == "${ news.cid }") {
					select.options[i].selected = true;
					break;
				}
			}
		</script>
	</div>
</body>
</html>