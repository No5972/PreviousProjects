<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	
	<head>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
		<link rel="stylesheet" href="/AudioCMS_SSM/index_m.css"  />
		<link rel="stylesheet" href="/AudioCMS_SSM/news_m.css"  />
		<script>
			var switch_searchbar = function() {
				if (document.getElementById("search_switch").style.display == "") {
					document.getElementById("search_switch").style.display = "block";
					document.getElementById("searchBox").focus();
				} else {
					document.getElementById("search_switch").style.display = "";
				}
			}
			var showPageInput = function() {
				document.getElementById("pageInput").style.display = "inline-block";
				document.getElementById("currentPageHolder").style.display = "none";
				document.getElementById("page").value=document.getElementById("currentPage").innerText;
				document.getElementById("page").focus();
			}
			var hidePageInput = function() {
				document.getElementById("pageInput").style.display = "none";
				document.getElementById("currentPageHolder").style.display = "inline-block";
			}
			var toPCpage = function() {
				var newsId = ${ news.id };
				window.location.href="/AudioCMS_SSM/news_"+newsId+".html?pc=1";
			}
		</script>
	</head>
	
	<body>
		<div class="navigation">
			<div class="navigation_1">语音播报门户网站 - ${ cname }
				<span style="float: right; background: #fff; margin-left: 0.5rem; color:#000;" onclick="switch_searchbar();">&nbsp;🔍&nbsp;</span>
				<span style="float: right; background: #fff;  color:#000;" onclick="toPCpage();">&nbsp;📺&nbsp;</span>
			</div>
			<div class="navigation_2">
				<c:if test="${ fn:length(allCategories)!=0 }">
					<a href="/AudioCMS_SSM/mobile">最新</a>&nbsp;
					<c:forEach items="${ allCategories }" var="category">
						<c:if test="${ category.id!=2 }">
							<a href="mobile?cid=${ category.id }">${ category.name }</a>&nbsp;
						</c:if>
					</c:forEach>
				</c:if>
			</div>
			<div class="navigation_search" id="search_switch">
				<form action="searchnews_m.php?pageNo=1" style="width: 100%">
					<div style="width: 100%; background: #fff; padding: 2px;">
						<input type="text" name="keywords" id="searchBox" style="border:0; width: 90%; outline:none; font-size: 1rem;" />
						<input type="hidden" name="pageNo" value="1"/>
						<input type="submit" value="🔍" style="width: 2rem;background: #fff; border: 0; float: right;" />
					</div>
				</form>
			</div>
		</div>
		<div class="newsPage">
			<div class="title">${ news.title }</div>
			<div class="date"><fmt:formatDate value="${ news.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			<div class="audio">语音播报：<audio src="/AudioCMS_SSM/Audios/${ news.id }.mp3" controls <c:if test="${ isAutoPlay==1 }">autoplay</c:if> controlsList="nodownload"></audio></div>
			<div class="contents">${ news.content }</div>
		</div>
		<div class="newest">
			<div class="newest_title">最新消息</div>
			<div class="newest_links">
				<c:if test="${ fn:length(newestNews)!=0 }">
					<c:forEach items="${ newestNews }" var="newest">
						<a href="/AudioCMS_SSM/mobile/${ newest.id }">
							<c:if test="${ newest.title.length()>18 }">${ newest.title.substring(0,18) }</c:if>
							<c:if test="${ newest.title.length()<=18 }">${ newest.title }</c:if>
						</a>
						<a href="/AudioCMS_SSM/mobile/${ newest.id }?isAutoPlay=1" style="float:right;">
							▶
						</a><br/>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div style="font-size: 0.5rem; text-align: center; color: #888; margin-top: 30px;">

		</div>
	</body>
</html>