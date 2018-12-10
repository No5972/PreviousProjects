<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<head>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
		<link rel="stylesheet" href="index_m.css"  />
		<link rel="stylesheet" href="news_m.css"  />
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
				var newsId = <s:property value="news.id"/>;
				window.location.href="/AudioCMS/news_"+newsId+".html";
			}
		</script>
	</head>
	
	<body>
		<div class="navigation">
			<div class="navigation_1">语音播报门户网站 - <s:property value="#session.cname"/>
				<span style="float: right; background: #fff; margin-left: 0.5rem; color:#000;" onclick="switch_searchbar();">&nbsp;🔍&nbsp;</span>
				<span style="float: right; background: #fff;  color:#000;" onclick="toPCpage();">&nbsp;📺&nbsp;</span>
			</div>
			<div class="navigation_2">
				<s:if test="allCategories.size()!=0">
					<a href="/AudioCMS/mobile">最新</a>&nbsp;
					<s:iterator value="allCategories" var="category">
						<s:if test="#category.id!=2">
							<a href="mobile_<s:property value="#category.id"/>.do"><s:property value="#category.name"/></a>&nbsp;
						</s:if>
					</s:iterator>
				</s:if>
			</div>
			<div class="navigation_search" id="search_switch">
				<form action="search!mSearch.action?pageNo=1" style="width: 100%">
					<div style="width: 100%; background: #fff; padding: 2px;">
						<input type="text" name="keywords" id="searchBox" style="border:0; width: 90%; outline:none; font-size: 1rem;" />
						<input type="hidden" name="pageNo" value="1"/>
						<input type="submit" value="🔍" style="width: 2rem;background: #fff; border: 0; float: right;" />
					</div>
				</form>
			</div>
		</div>
		<div class="newsPage">
			<div class="title"><s:property value="news.title" /></div>
			<div class="date"><s:date name="news.createTime" format="yyyy-MM-dd HH:mm:ss" /></div>
			<div class="audio">语音播报：<audio src="Audios/<s:property value="news.id"/>.mp3" controls <s:if test="isAutoPlay==1">autoplay</s:if> controlsList="nodownload"/></div>
			<div class="contents"><s:property value="news.content" escape="false" /></div>
		</div>
		<div class="newest">
			<div class="newest_title">最新消息</div>
			<div class="newest_links">
				<s:if test="newestNews.size()!=0">
				<s:iterator value="newestNews" var="newest">
					<a href="mnews_<s:property value="#newest.id"/>.do">
						<s:if test="#newest.title.length()>18"><s:property value="#newest.title.substring(0,18)"/>...</s:if>
						<s:else><s:property value="#newest.title"/></s:else>
					</a>
					<a href="mnews_auto_<s:property value="#newest.id"/>.do" style="float:right;">
						▶
					</a>
					<br/>
				</s:iterator>
				</s:if>
			</div>
		</div>
		<div style="font-size: 0.5rem; text-align: center; color: #888; margin-top: 30px;">

		</div>
	</body>
</html>