<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
<title>文章列表</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="manage_content">
<table style="width: 100%; border-spacing:0;" ><tr>
<td width="50%">
当前类别：<s:property value="#session.topName"/></td><td width="50%">
<s:form action="news.action" method="post" namespace="/" theme="simple"
style="margin:0px;display: inline;">
切换类别：<s:select name="topId" label="类　　别" list="#request.cList" listKey="id" listValue="name" value="%{#session.topName}" headerKey="0" headerValue="选择类别"/>
<s:submit value="切换"></s:submit>
</s:form>
<script type="text/javascript">
var select = document.getElementById('news_topId');
for (var i = 0; i < select.options.length; i++){  
    if (select.options[i].value == <s:property value="#session.topId" /> ){  
        select.options[i].selected = true;  
        break;  
    }  
}
</script></td>
</tr></table>
<br/>
<a href="news!addInputNews.action?topId=<s:property value="#session.topId"/>">增加文章</a>
<s:if test="newsList.size()!=0">
	<table style="width: 100%; border-spacing:0;">
	<thead style="text-align: center;">
		<tr>
			<td style="border: 1px solid #ddd; width: 20%;">标题</td>
			<td style="border: 1px solid #ddd; width: 20%;">发布时间</td>
			<td style="border: 1px solid #ddd; width: 20%;">内容</td>
			<td style="border: 1px solid #ddd; width: 20%;">类别</td>
			<td style="border: 1px solid #ddd; width: 20%;">基本操作</td>
		</tr>
	</thead><tbody>
	<s:iterator value="newsList" var="news">
		<tr>
			<td style="border: 1px solid #ddd;" >
				<a href="news!getNewsById.action?news.id=<s:property value="#news.id"/>&signStr=view">
					<s:if test="#news.title.length()>15">
						<s:property value="#news.title.substring(0,15)"/>...
					</s:if>
					<s:else>
						<s:property value="#news.title"/>
					</s:else>
				</a>
			</td>
			<td style="text-align: center; border: 1px solid #ddd;">
				<s:date name="#news.createTime" format="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td style="border: 1px solid #ddd;">
				<s:if test="#news.content.length()>15">
					<s:property value="#news.content.substring(0,15)"/>...
				</s:if>
				<s:else>
					<s:property value="#news.content"/>
				</s:else>
			</td>
			<td style="text-align: center; border: 1px solid #ddd;">
				<s:property value="#news.category.name"/>
			</td>
			<td style="text-align: center; border: 1px solid #ddd;">
				<a href="news!getNewsById.action?news.id=<s:property value="#news.id"/>&signStr=update&topId=<s:property value="#news.category.id"/>">编辑</a>&nbsp;
				<a href="news!delNews.action?news.id=<s:property value="#news.id"/>">删除</a>&nbsp;
				<a href="news!updateHeadline.action?news.id=<s:property value="#news.id"/>">设为头条</a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	第<s:property value="pageNo"/>/<s:property value="pageCount"/>页&nbsp;
</s:if>
<s:else>
	<br/>暂无数据！<br/>
	第0/0页&nbsp;
</s:else>

<a href="news.action?pageNo=1&topId=<s:property value="#session.topId"/>">首页</a>
<a href="news.action?pageNo=<s:property value="pageNo-1"/>&topId=<s:property value="#session.topId"/>">上一页</a>
<a href="news.action?pageNo=<s:property value="pageNo+1"/>&topId=<s:property value="#session.topId"/>">下一页</a>
</div>
</body>
</html>