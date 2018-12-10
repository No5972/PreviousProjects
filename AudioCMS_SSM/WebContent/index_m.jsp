<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
	
	<head>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
		<link rel="stylesheet" href="/AudioCMS_SSM/index_m.css"  />
		<title>
			<c:if test="${ cname!=null }">${ cname } - 语音播报门户网站</c:if>
			<c:if test="${ cname==null }">首页 - 语音播报门户网站</c:if>
		</title>
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
				window.location.href="/AudioCMS_SSM/?pc";
			}
		</script>
	</head>
	
	<body>
		<div class="navigation">
			<div class="navigation_1">语音播报门户网站 - <c:if test="${ cname==null }">首页</c:if>
			${ cname }
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
		<div class="newslist">
			<c:if test="${ fn:length(allnews)!=0 }">
				<c:forEach items="${ allnews }" var="newslist">
					<div class="newsitem">
						<a href="/AudioCMS_SSM/mobile/${ newslist.id }"><div class="newsitem_left">
							<div class="newsitem_title">
								<c:if test="${ newslist.title.length()>20 }">
									${ newslist.title.substring(0,20) }
								</c:if>
								<c:if test="${ newslist.title.length()<=20 }">
									${ newslist.title }
								</c:if>
							</div>
							<div class="newsitem_brief">
								<c:if test="${ newslist.content.length()>30 }">
									<c:out value="${ newslist.content.substring(0,30) }" escapeXml="true"></c:out> 
								</c:if>
								<c:if test="${ newslist.content.length()<=30 }">
									<c:out value="${ newslist.content }" escapeXml="true"></c:out> 
								</c:if>
							</div>
							<div class="newsitem-date">
								<fmt:formatDate value="${ newslist.createTime }" pattern="MM-dd"/>
							</div></div>
						</a>
						<a href="/AudioCMS_SSM/mobile/${ newslist.id }?isAutoPlay=1"><div class="newsitem_right">
							▶
						</div></a>
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${ fn:length(allnews)==0 }">
				暂无内容
			</c:if>
		</div>
		<div class="pageswitch">
			<c:if test="${ cname==null }">
				<c:if test="${ pageNo>1 }">
					<a href="/AudioCMS_SSM/mobile?pageNo=${ pageNo-1 }&cid=${ cid }"><div class="pageswitch_item">&lt;</div></a>
				</c:if>
				<c:if test="${ pageNo<=1 }">
					<div class="pageswitch_item"></div>
				</c:if>
			</c:if>
			<c:if test="${ cname!=null }">
				<c:if test="${ pageNo>1 }">
					<a href="/AudioCMS_SSM/mobile?pageNo=${ pageNo-1 }"><div class="pageswitch_item">&lt;</div></a>
				</c:if>
				<c:if test="${ pageNo<=1 }">
					<div class="pageswitch_item"></div>
				</c:if>
			</c:if>
			<div class="pageswitch_item" onclick="showPageInput();" id="currentPageHolder"><span id="currentPage">${ pageNo }</span>/${ pageCount }</div>
			<c:if test="${ cname==null }">
				<div class="pageswitch_item" style="display: none;" id="pageInput">
					<form action="/AudioCMS_SSM/mobile">
						<input type="number" id="page" name="pageNo" style="width: 100%; border: 0; text-align: center; margin-top: 0.5rem; outline:none;" onblur="hidePageInput();"/>
					</form>
				</div>
			</c:if>
			<c:if test="${ cname!=null }">
				<div class="pageswitch_item" style="display: none;" id="pageInput">
					<form action="mobile?cid=${ cid }">
						<input type="number" id="page" name="pageNo" style="width: 100%; border: 0; text-align: center; margin-top: 0.5rem; outline:none;" onblur="hidePageInput();"/>
					</form>
				</div>
			</c:if>
			<c:if test="${ cname==null }">
				<c:if test="${ pageNo<pageCount }">
					<a href="/AudioCMS_SSM/mobile?pageNo=${ pageNo+1 }"><div class="pageswitch_item">&gt;</div></a>
				</c:if>
				<c:if test="${ pageNo>=pageCount }">
					<div class="pageswitch_item"></div>
				</c:if>
			</c:if>
			<c:if test="${ cname!=null }">
				<c:if test="${ pageNo<pageCount }">
					<a href="/AudioCMS_SSM/mobile?pageNo=${ pageNo+1 }&cid=${ cid }"><div class="pageswitch_item">&gt;</div></a>
				</c:if>
				<c:if test="${ pageNo>=pageCount }">
					<div class="pageswitch_item"></div>
				</c:if>
			</c:if>
		</div>
		<div style="font-size: 0.5rem; text-align: center; color: #888; margin-top: 30px;">
		</div>
	</body>

</html>