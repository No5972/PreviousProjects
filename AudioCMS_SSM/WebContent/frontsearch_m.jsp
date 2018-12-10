<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
	<head>
		<title>搜索结果：${ keywords } - 语音播报门户网站 AudioCMS</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
		<link rel="stylesheet" href="/AudioCMS_SSM/index_m.css"  />
		<script>
			var switch_searchbar = function() {
				if (document.getElementById("search_switch").style.display == "") {
					var tmp=document.getElementById("searchBox").value;
					document.getElementById("search_switch").style.display = "block";
					document.getElementById("searchBox").focus();
					document.getElementById("searchBox").value="";
					document.getElementById("searchBox").value=tmp;
				} else {
					document.getElementById("search_switch").style.display = "";
				}
			}
			var showPageInput1 = function() {
				document.getElementById("pageInput1").style.display = "inline-block";
				document.getElementById("currentPageHolder1").style.display = "none";
				document.getElementById("page1").value=document.getElementById("currentPage1").innerText;
				document.getElementById("page1").focus();
			}
			var hidePageInput1 = function() {
				document.getElementById("pageInput1").style.display = "none";
				document.getElementById("currentPageHolder1").style.display = "inline-block";
			}
			var showPageInput2 = function() {
				document.getElementById("pageInput2").style.display = "inline-block";
				document.getElementById("currentPageHolder2").style.display = "none";
				document.getElementById("page2").value=document.getElementById("currentPage2").innerText;
				document.getElementById("page2").focus();
			}
			var hidePageInput2 = function() {
				document.getElementById("pageInput2").style.display = "none";
				document.getElementById("currentPageHolder2").style.display = "inline-block";
			}
			var toPCpage = function() {
				var keywords = document.getElementById("categoryName").innerText;
				var pageNo = document.getElementById("currentPage1").innerText;
				window.location.href="/AudioCMS_SSM/searchnews.php?keywords="+keywords+"&pageNo="+pageNo;
			}
		</script>
	</head>
	
	<body>
		<div class="navigation">
			<div class="navigation_1">语音播报门户网站 - 首页
				<span style="float: right; background: #fff; margin-left: 0.5rem; color:#000;" onclick="switch_searchbar();">&nbsp;🔍&nbsp;</span>
				<span style="float: right; background: #fff;  color:#000;" onclick="toPCpage();">&nbsp;📺&nbsp;</span>
			</div>
			<div class="navigation_2">
				<c:if test="${ fn:length(allCategories)!=0 }">
					<a href="/AudioCMS_SSM/mobile">最新</a>&nbsp;
					<c:forEach items="${ allCategories }" var="category">
						<c:if test="${ category.id!=2 }">
							<a href="/AudioCMS_SSM/mobile?cid=${ category.id }">${ category.name }</a>&nbsp;
						</c:if>
					</c:forEach>
				</c:if>
			</div>
			<div class="navigation_search" id="search_switch">
				<form action="/AudioCMS_SSM/search_m.php?pageNo=1" style="width: 100%">
					<div style="width: 100%; background: #fff; padding: 2px;">
						<input type="text" name="keywords" id="searchBox" value="${ keywords }" style="border:0; width: 90%; outline:none; font-size: 1rem;" />
						<input type="hidden" name="pageNo" value="1"/>
						<input type="submit" value="🔍" style="width: 2rem;background: #fff; border: 0; float: right; " />
					</div>
				</form>
			</div>
		</div>
		<div class="newslist">
			搜索：<span id="categoryName">${ keywords }</span>&nbsp;&nbsp;共找到${ resultCount }条结果
			<c:if test="${ fn:length(newsList)!=0 }">
				<div class="pageswitch">
					<c:if test="${ pageNo>1 }">
						<a href="/AudioCMS_SSM/searchnews_m.php?keywords=${ keywords }&pageNo=${ pageNo-1 }"><div class="pageswitch_item">&lt;</div></a>
					</c:if>
					<c:if test="${ pageNo<=1 }">
						<div class="pageswitch_item"></div>
					</c:if>
					<div class="pageswitch_item" onclick="showPageInput1();" id="currentPageHolder1"><span id="currentPage1">${ pageNo }</span>/${ pageCount }</div>
					<div class="pageswitch_item" style="display: none;" id="pageInput1">
						<form action="/AudioCMS_SSM/searchnews_m.php?keywords=${ keywords }">
							<input type="number" id="page1" name="pageNo" style="width: 100%; border: 0; text-align: center; margin-top: 0.5rem; outline:none;" onblur="hidePageInput1();"/>
						</form>
					</div>
					<c:if test="${ pageNo<pageCount }">
						<a href="/AudioCMS_SSM/searchnews_m.php?keywords=${ keywords }&pageNo=${ pageNo+1 }"><div class="pageswitch_item">&gt;</div></a>
					</c:if>
					<c:if test="${ pageNo>=pageCount }">
						<div class="pageswitch_item"></div>
					</c:if>
				</div>
				<script>
					var categoryName = document.getElementById("categoryName").innerText;
					var stateObject = {};
					var title = "Wow Title";
					var newUrl = "/AudioCMS_SSM/searchnews_m.php?keywords="+categoryName+"&pageNo="+document.getElementById("currentPage1").innerText;
					history.pushState(stateObject,title,newUrl);
				</script>
				<c:forEach items="${ newsList }" var="result">
					<div class="newsitem">
						<a href="/AudioCMS_SSM/mobile/${ result.id }">
							<div class="newsitem_left">
								<div class="newsitem_title">
									<c:if test="${ result.title.length()>20 }">
										${ result.title.substring(0,20) }
									</c:if>
									<c:if test="${ result.title.length()<=20 }">
										${ result.title }
									</c:if>
								</div>
								<div class="newsitem_brief">
									<c:if test="${ result.content.length()>30 }">
										<c:out value="${ result.content.substring(0,30) }"></c:out>
									</c:if>
									<c:if test="${ result.content.length()<=30 }">
										<c:out value="${ result.content }"></c:out>
									</c:if>
								</div>
								<div class="newsitem_date"><fmt:formatDate value="${ result.createTime }" pattern="MM-dd"/></div>
							</div>
						</a>
						<a href="/AudioCMS_SSM/mobile/${ result.id }?isAutoPlay=1"><div class="newsitem_right">
							▶
						</div></a>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${ fn:length(newsList)==0 }">
				暂无搜索结果
			</c:if>
		</div>
		<div class="pageswitch">
			<c:if test="${ pageNo>1 }">
				<a href="/AudioCMS_SSM/searchnews_m.php?keywords=${ keywords }&pageNo=${ pageNo-1 }"><div class="pageswitch_item">&lt;</div></a>
			</c:if>
			<c:if test="${ pageNo<=1 }">
				<div class="pageswitch_item"></div>
			</c:if>
			<div class="pageswitch_item" onclick="showPageInput2();" id="currentPageHolder2"><span id="currentPage2">${ pageNo }</span>/${ pageCount }</div>
			<div class="pageswitch_item" style="display: none;" id="pageInput2">
				<form action="/AudioCMS_SSM/searchnews_m.php?keywords=${ keywords }">
					<input type="number" id="page2" name="pageNo" style="width: 100%; border: 0; text-align: center; margin-top: 0.5rem; outline:none;" onblur="hidePageInput2();"/>
				</form>
			</div>
			<c:if test="${ pageNo<pageCount }">
				<a href="/AudioCMS_SSM/searchnews_m.php?keywords=${ keywords }&pageNo=${ pageNo+1 }"><div class="pageswitch_item">&gt;</div></a>
			</c:if>
			<c:if test="${ pageNo>=pageCount }">
				<div class="pageswitch_item"></div>
			</c:if>
		</div>
		<div style="font-size: 0.5rem; text-align: center; color: #888; margin-top: 30px;">

		</div>
	</body>

</html>
