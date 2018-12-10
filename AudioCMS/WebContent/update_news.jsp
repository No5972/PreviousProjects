<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改文章：<s:property value="news.title" /></title>
<link rel="stylesheet" href="switch.css" />
<link rel="stylesheet" href="manage_content.css" />
<script charset="utf-8" src="editor/kindeditor-all.js"></script>
<script charset="utf-8" src="editor/lang/zh-CN.js"></script>
<script>
	KindEditor.ready(function(K) {
		window.editor = K.create('#news_news_content', {
			uploadJson : '/AudioCMS/upload_json.jsp',
			fileManagerJson : '/AudioCMS/file_manager_json.jsp',
			allowFileManager : true
		});
	});
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="manage_content">
		<a href="news.action?topId=<s:property value="#session.topId"/>">返回类别：<s:property
				value="%{news.category.name}" /></a><br />
		<s:form action="news!updateNews.action" method="post" namespace="/">
			<s:hidden name="news.id" value="%{news.id}" />
			<s:textfield name="news.title" label="文章标题" value="%{news.title}"
				style="width: 500px;" />
			<s:select name="cid" label="类　　别" list="#request.cList" listKey="id"
				listValue="name" value="#session.topId" headerKey="0" header="选择类别" />
			<s:textarea name="news.content" label="内　　容" value="%{news.content}"
				cols="100" rows="40" />
			<s:submit value="更新" />
		</s:form>
		<script type="text/javascript">
			var select = document.getElementById('news_cid');
			for (var i = 0; i < select.options.length; i++) {
				if (select.options[i].value == <s:property value="%{news.category.id}" />) {
					select.options[i].selected = true;
					break;
				}
			}
		</script>
	</div>
</body>
</html>