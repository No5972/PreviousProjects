<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加文章</title>
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
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
<a href="news.action?topId=<s:property value="#session.topId"/>">返回类别：<s:property value="#session.topName"/></a><br/>
<s:form action="news!addNews.action" method="post" namespace="/">
	<s:textfield name="news.title" value="" label="文章标题"/>
	<s:select name="cid" label="类　　别" list="#request.cList" listKey="id" listValue="name" value="%{#session.topName}" headerKey="0" headerValue="选择类别"/>
	<s:textarea name="news.content" value="" label="文章内容" cols="100" rows="40"/>
	<s:submit value="提交"/>
</s:form>
<script type="text/javascript">
var select = document.getElementById('news_cid');
for (var i = 0; i < select.options.length; i++){  
    if (select.options[i].value == <s:property value="#session.topId" /> ){  
        select.options[i].selected = true;  
        break;  
    }  
}
</script>
</div>
</body>
</html>