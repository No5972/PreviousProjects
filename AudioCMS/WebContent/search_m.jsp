<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<head>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
		<link rel="stylesheet" href="index_m.css"  />
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
				window.location.href="/AudioCMS/search.action?keywords="+keywords+"&pageNo="+pageNo;
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
						<input type="text" name="keywords" id="searchBox" value="<s:property value="#session.keywords"/>" style="border:0; width: 90%; outline:none; font-size: 1rem;" />
						<input type="hidden" name="pageNo" value="1"/>
						<input type="submit" value="🔍" style="width: 2rem;background: #fff; border: 0; float: right; " />
					</div>
				</form>
			</div>
		</div>
		<div class="newslist">
			搜索：<span id="categoryName"><s:property value="#session.keywords"/></span>&nbsp;&nbsp;共找到<s:property value="resultCount" />条结果
			<s:if test="newsList.size()!=0">
			<div class="pageswitch">
				<a href="search!mSearch.action?keywords=<s:property value="#session.keywords"/>&pageNo=<s:property value="pageNo-1"/>"><div class="pageswitch_item">&lt;</div></a>
				<div class="pageswitch_item" onclick="showPageInput1();" id="currentPageHolder1"><span id="currentPage1"><s:property value="pageNo"/></span>/<s:property value="pageCount"/></div>
				<div class="pageswitch_item" style="display: none;" id="pageInput1">
					<form action="search!mSearch.action?keywords=<s:property value="#session.keywords"/>">
						<input type="number" id="page1" name="pageNo" style="width: 100%; border: 0; text-align: center; margin-top: 0.5rem; outline:none;" onblur="hidePageInput1();"/>
					</form>
				</div>
				<a href="search!mSearch.action?keywords=<s:property value="#session.keywords"/>&pageNo=<s:property value="pageNo+1"/>"><div class="pageswitch_item">&gt;</div></a>
			</div>
			<script>
				var categoryName = document.getElementById("categoryName").innerText;
				var stateObject = {};
				var title = "Wow Title";
				var newUrl = "/AudioCMS/search!mSearch.action?keywords="+categoryName+"&pageNo="+document.getElementById("currentPage1").innerText;
				history.pushState(stateObject,title,newUrl);
			</script>
			<s:iterator value="newsList" var="result">
				<div class="newsitem">
					<a href="mnews_<s:property value="#result.id"/>.do"><div class="newsitem_left">
						<div class="newsitem_title">
							<s:if test="#result.title.length()>20">
								<s:property value="#result.title.substring(0,20)"/>...
							</s:if>
							<s:else><s:property value="#result.title"/></s:else>
						</div>
						<div class="newsitem_brief">
							<s:if test="#result.content.length()>30">
								<s:property value="#result.content.substring(0,30)"/>...
							</s:if>
							<s:else><s:property value="#result.content"/></s:else>
						</div>
						<div class="newsitem_date"><s:date name="#result.createTime" format="MM-dd"/></div>
					</div>
					</a>
					<a href="mnews_auto_<s:property value="#result.id"/>.do"><div class="newsitem_right">
						▶
					</div></a>
				</div>
			</s:iterator>
			</s:if>
			<s:else>
				暂无搜索结果
			</s:else>
		</div>
		<div class="pageswitch">
			<a href="search!mSearch.action?keywords=<s:property value="#session.keywords"/>&pageNo=<s:property value="pageNo-1"/>"><div class="pageswitch_item">&lt;</div></a>
			<div class="pageswitch_item" onclick="showPageInput2();" id="currentPageHolder2"><span id="currentPage2"><s:property value="pageNo"/></span>/<s:property value="pageCount"/></div>
			<div class="pageswitch_item" style="display: none;" id="pageInput2">
				<form action="search!mSearch.action?keywords=<s:property value="#session.keywords"/>">
					<input type="number" id="page2" name="pageNo" style="width: 100%; border: 0; text-align: center; margin-top: 0.5rem; outline:none;" onblur="hidePageInput2();"/>
				</form>
			</div>
			<a href="search!mSearch.action?keywords=<s:property value="#session.keywords"/>&pageNo=<s:property value="pageNo+1"/>"><div class="pageswitch_item">&gt;</div></a>
		</div>
		<div style="font-size: 0.5rem; text-align: center; color: #888; margin-top: 30px;">

		</div>
	</body>

</html>
</body>
</html>