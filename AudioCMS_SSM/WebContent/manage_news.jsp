<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"  href="switch.css"/>
<link rel="stylesheet" href="manage_content.css"/>
<title>文章列表</title>
<script type="text/javascript">
var x=0, y=0;
document.onmousedown = function (e) { 
	xx = e.view.innerWidth - e.pageX;
	y = e.pageY; 
	//console.log(x+","+y); 
};

var hideConfirmation = function () {
	document.getElementById('deleteConfirm').style.display="none";
}

var showConfirmation = function (x) {
	document.getElementById('confirmDetele').href="manage_deleteNews.php?id="+x;
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
<table style="width: 100%; border-spacing:0;" ><tr>
<td width="50%">
当前类别： ${ currCategoryName }</td><td width="50%"> 
<form:form action="manage_news.php" modelAttribute="oneCategory" method="get" style="margin:0px;display: inline;">
切换类别：<select name="cid" id="news_cid">
	<option value="">选择类别</option>
	<c:forEach items="${ allCategories }" var="category">
		<option value="${ category.id }">${ category.name }</option>
	</c:forEach>
</select>
<input type="submit" value="切换" />
</form:form>
<script type="text/javascript">
var select = document.getElementById('news_cid');
for (var i = 0; i < select.options.length; i++){  
    if (select.options[i].value == "${ cid }" ){  
        select.options[i].selected = true;  
        break;  
    }  
}
</script></td>
</tr></table>
<br/>
<a href="manage_addNewsInput.php?cid=${ cid }">增加文章</a>
<c:if test="${ fn:length(newsList)!=0 }"><%-- ${ fn:length(newsList) } --%>
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
	<c:forEach items="${ newsList }" var="news">
		<tr>
			<td style="border: 1px solid #ddd;" >
				<a href="manage_detailed_news.php?id=${ news.id }">
					<c:if test="${ news.title.length()>15 }"><c:out value="${ news.title.substring(0,15) }" escapeXml="true">无</c:out>...</c:if>
					<c:if test="${ news.title.length()<=15 }"><c:out value="${ news.title }" escapeXml="true">无</c:out></c:if>
				</a>
			</td>
			<td style="text-align: center; border: 1px solid #ddd;">
				<fmt:formatDate value="${ news.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td style="border: 1px solid #ddd;">
					<c:if test="${ news.content.length()>15 }"><c:out value="${ news.content.substring(0,15) }" escapeXml="true">无</c:out>...</c:if>
					<c:if test="${ news.content.length()<=15 }"><c:out value="${ news.content }" escapeXml="true">无</c:out></c:if>
			</td>
			<td style="text-align: center; border: 1px solid #ddd;">
				${ news.categoryName }
			</td>
			<td style="text-align: center; border: 1px solid #ddd;">
				<a href="manage_updatenewsinput.php?id=${ news.id }">编辑</a>&nbsp;
				<a href="#" onclick="showConfirmation(${ news.id })" >删除</a>&nbsp;
				<c:if test="${ news.isHeadline() }">
					<b>当前头条</b>
				</c:if>
				<c:if test="${ !news.isHeadline() }">
					<a href="manage_setheadline.php?id=${ news.id }">设为头条</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	第${ currPage }/${ pageCount }页&nbsp;
</c:if>
<c:if test="${ fn:length(newsList)==0 }">
	<br/>暂无数据！<br/>
	第0/0页&nbsp;
</c:if>
<%-- <c:if test="${ cid==null }">类别</c:if> --%>
<c:if test="${ cid==null }"><a href="manage_news.php?page=1">首页</a></c:if>
<c:if test="${ cid!=null }"><a href="manage_news.php?page=1&cid=${ cid }">首页</a></c:if>
<c:if test="${ cid==null }">
	<c:if test="${ currPage>1 }">
		<a href="manage_news.php?page=${ currPage-1 }">上一页</a>
	</c:if>
	<c:if test="${ currPage<=1 }">
		　　　
	</c:if>
</c:if>
<c:if test="${ cid!=null }">
	<c:if test="${ currPage>1 }">
		<a href="manage_news.php?page=${ currPage-1 }&cid=${ cid }">上一页</a>
	</c:if>
	<c:if test="${ currPage<=1 }">
		　　　
	</c:if>
</c:if>
<c:if test="${ cid==null }">
	<c:if test="${ currPage<pageCount }">
		<a href="manage_news.php?page=${ currPage+1 }">下一页</a>
	</c:if>
	<c:if test="${ currPage>=pageCount }">
		　　　
	</c:if>
</c:if>
<c:if test="${ cid!=null }">
	<c:if test="${ currPage<pageCount }">
		<a href="manage_news.php?page=${ currPage+1 }&cid=${ cid }">下一页</a>
	</c:if>
	<c:if test="${ currPage>=pageCount }">
		　　　
	</c:if>
</c:if>
<c:if test="${ cid==null }"><a href="manage_news.php?page=${ pageCount }">尾页</a></c:if>
<c:if test="${ cid!=null }"><a href="manage_news.php?page=${ pageCount }&cid=${ cid }">尾页</a></c:if>

</div>
<div class="deleteConfirm" id="deleteConfirm" style="display: none; background-color: #fff; padding: 10px; text-align: center; ">
	<p>确定要删除吗？</p>
	<a href="manage_deleteNews.php?id=" id="confirmDetele">确认</a>&nbsp;
	<a href="#" onclick="hideConfirmation()">取消</a>
</div>
</body>
</html>