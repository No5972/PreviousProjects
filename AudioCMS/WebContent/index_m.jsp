<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<head>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
		<link rel="stylesheet" href="index_m.css"  />
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
				window.location.href="/AudioCMS";
			}
		</script>
	</head>
	
	<body>
		<div class="navigation">
			<div class="navigation_1">语音播报门户网站 - <s:if test="#session.cname==null">首页</s:if>
			<s:property value="#session.cname"/>
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
		<div class="newslist">
			<s:if test="allnews.size()!=0">
				<s:iterator value="allnews" var="newslist">
					<div class="newsitem">
						<a href="mnews_<s:property value="#newslist.id"/>.do"><div class="newsitem_left">
							<div class="newsitem_title">
								<s:if test="#newslist.title.length()>20">
									<s:property value="#newslist.title.substring(0,20)"/>...
								</s:if>
								<s:else><s:property value="#newslist.title"/></s:else>
							</div>
							<div class="newsitem_brief">
								<s:if test="#newslist.content.length()>30">
									<s:property value="#newslist.content.substring(0,30)"/>...
								</s:if>
								<s:else><s:property value="#newslist.content"/></s:else>
							</div>
							<div class="newsitem_date"><s:date name="#newslist.createTime" format="MM-dd"/></div>
						</div>
						</a>
						<a href="mnews_auto_<s:property value="#newslist.id"/>.do"><div class="newsitem_right">
							▶
						</div></a>
					</div>
				</s:iterator>
			</s:if>
			<s:else>
				暂无内容
			</s:else>
			<%--<div class="newsitem">
				<a href="#"><div class="newsitem_left">
					<div class="newsitem_title">这是新闻标题</div>
					<div class="newsitem_brief">这是新闻摘要这是新闻摘要这是新闻摘要这是新闻摘要这是新闻摘要...</div>
					<div class="newsitem_date">06-08</div>
				</div>
				</a>
				<a href="#2"><div class="newsitem_right">
					▶
				</div></a>
			</div>
			--%>
		</div>
		<div class="pageswitch">
			<a href="index!mobileIndex.action?pageNo=<s:property value="pageNo-1"/>&topId=<s:property value="#session.cid"/>"><div class="pageswitch_item">&lt;</div></a>
			<div class="pageswitch_item" onclick="showPageInput();" id="currentPageHolder"><span id="currentPage"><s:property value="pageNo"/></span>/<s:property value="pageCount"/></div>
			<div class="pageswitch_item" style="display: none;" id="pageInput">
				<form action="index!mobileIndex.action?topId=0">
					<input type="number" id="page" name="pageNo" style="width: 100%; border: 0; text-align: center; margin-top: 0.5rem; outline:none;" onblur="hidePageInput();"/>
				</form>
			</div>
			<a href="index!mobileIndex.action?pageNo=<s:property value="pageNo+1"/>&topId=<s:property value="#session.cid"/>"><div class="pageswitch_item">&gt;</div></a>
		</div>
		<div style="font-size: 0.5rem; text-align: center; color: #888; margin-top: 30px;">

		</div>
	</body>

</html>