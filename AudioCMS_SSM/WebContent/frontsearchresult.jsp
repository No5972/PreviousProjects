<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="news_content.css" />
<link rel="stylesheet" href="search.css" />
<title>搜索结果：${ keywords } - 语音播报门户网站 AudioCMS
</title>
</head>
<body>
	<jsp:include page="fronthead.jsp"></jsp:include>
	<div class="search_result_contain">
		搜索：${ keywords }&nbsp;&nbsp;搜索到${ resultCount }条结果<br />
		<c:if test="${ fn:length(newsList)!=0 }">
			<div>
				<div class="pageOperation">
					<a
						href="/AudioCMS_SSM/searchnews.php?keywords=${ keywords }&pageNo=1">首页</a>&nbsp;
					<c:if test="${ pageNo>1 }">
						<a
							href="/AudioCMS_SSM/searchnews.php?keywords=${ keywords }&pageNo=${ pageNo-1 }">上一页</a>
					</c:if>
					<c:if test="${ pageNo<=1 }">
　　　
					</c:if>
					&nbsp;
					<c:if test="${ pageNo<pageCount }">
						<a href="/AudioCMS_SSM/searchnews.php?keywords=${ keywords }&pageNo=${ pageNo+1 }">下一页</a>
					</c:if>
					<c:if test="${ pageNo>=pageCount }">
　　　
					</c:if>
					&nbsp; <a
						href="/AudioCMS_SSM/searchnews.php?keywords=${ keywords }&pageNo=${ pageCount }">尾页</a>&nbsp;
				</div>
				<input type="hidden" value="${ keywords }"
					id="categoryName" />
				<div class="pageNo">
					<form id="pageswitch" method="POST">
						第<input type="number" id="pageNo"
							max="${ pageCount }" min="1"
							value="${ pageNo }" onchange="setAction()" />/${ pageCount }页 <input type="submit" value="切换" />
					</form>
				</div>
			</div>
			<c:forEach items="${ newsList }" var="result">
				<div class="result_unit">
					<a href="/AudioCMS_SSM/news_${ result.id }.html">
						<c:if test="${ result.title.length()>40 }">
							${ result.title.substring(0,40) }
						</c:if>
						<c:if test="${ result.title.length()<=40 }">
							${ result.title }
						</c:if>
					</a><br /><span><c:if test="${ result.content.length()>200 }">
						<c:out value="${ result.content.substring(0,200) }" escapeXml="true"></c:out>
					</c:if><c:if test="${ result.content.length()<=200 }">
						<c:out value="${ result.content }" escapeXml="true"></c:out>
					</c:if></span><br /><a class="tags" href="/AudioCMS_SSM/news_${ result.id }.html">
						localhost:8080/AudioCMS_SSM/news_${ result.id }.html
					</a> &nbsp; <span class="tags"><fmt:formatDate value="${ result.createTime }" pattern="yyyy-MM-dd HH:mm"/></span>
				</div>
			</c:forEach>
			<div>
				<div class="pageOperation">
					<c:if test="${ pageCount>1 }">
						<a href="/AudioCMS_SSM/searchnews.php?keywords=${ keywords }&pageNo=1">首页</a>&nbsp;
						<c:if test="${ pageNo>1 }">
							<a href="/AudioCMS_SSM/searchnews.php?keywords=${ keywords }&pageNo=${ pageNo-1 }">上一页</a>
						</c:if>
						<c:if test="${ pageNo<=1 }">　　　</c:if>&nbsp;
						<c:if test="${ pageNo<pageCount }">
							<a href="/AudioCMS_SSM/searchnews.php?keywords=${ keywords }&pageNo=${ pageNo+1 }">下一页</a>
						</c:if>
						<c:if test="${ pageNo>=pageCount }">　　　</c:if>&nbsp;
						<a href="/AudioCMS_SSM/searchnews.php?keywords=${ keywords }&pageNo=${ pageCount }">尾页</a>
					</c:if>
				</div>
				<input type="hidden" value="${ keywords }"
					id="categoryName" />
				<div class="pageNo">
					<form id="pageswitch" method="POST">
						第<input type="number" id="pageNo"
							max="${ pageCount }" min="1"
							value="${ pageNo }" onchange="setAction()" />/${ pageCount }页 <input type="submit" value="切换" />
					</form>
					<script>
						var categoryName = document
								.getElementById("categoryName").value;
						var setAction = function() {
							document.getElementById("pageswitch").action = "/AudioCMS_SSM/searchnews.php?keywords="
									+ categoryName
									+ "&pageNo="
									+ document.getElementById("pageNo").value;
						}
						var stateObject = {};
						var title = "Wow Title";
						var newUrl = "/AudioCMS_SSM/searchnews.php?keywords="+categoryName+"&pageNo="+document.getElementById("pageNo").value;
						history.pushState(stateObject,title,newUrl);
					</script>
				</div>
			</div>
		</c:if>
		<c:if test="${ fn:length(newsList)==0 }">
			暂无搜索结果
		</c:if>
	</div>
</body>
</html>