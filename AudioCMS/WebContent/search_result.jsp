<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="news_content.css" />
<link rel="stylesheet" href="search.css" />
<title>搜索结果：<s:property value="keywords" /> - 语音播报门户网站 AudioCMS
</title>
</head>
<body>
	<jsp:include page="fronthead.jsp"></jsp:include>
	<div class="search_result_contain">
		搜索：<s:property value="keywords" />&nbsp;&nbsp;搜索到<s:property value="resultCount" />条结果<br />
		<s:if test="newsList.size()!=0">
			<div>
				<div class="pageOperation">
					<a
						href="/AudioCMS/search.action?keywords=<s:property value="keywords"/>&pageNo=1">首页</a>&nbsp;
					<s:if test="pageNo>1">
						<a
							href="/AudioCMS/search.action?keywords=<s:property value="keywords"/>&pageNo=<s:property value="pageNo-1"/>">上一页</a>
					</s:if>
					<s:else>
　　　
					</s:else>
					&nbsp;
					<s:if test="pageNo<pageCount">
						<a
							href="/AudioCMS/search.action?keywords=<s:property value="keywords"/>&pageNo=<s:property value="pageNo+1"/>">下一页</a>
					</s:if>
					<s:else>
　　　
					</s:else>
					&nbsp; <a
						href="/AudioCMS/search.action?keywords=<s:property value="keywords"/>&pageNo=<s:property value="pageCount"/>">尾页</a>&nbsp;
				</div>
				<input type="hidden" value="<s:property value="keywords"/>"
					id="categoryName" />
				<div class="pageNo">
					<form id="pageswitch" method="POST">
						第<input type="number" id="pageNo"
							max="<s:property value="pageCount"/>" min="1"
							value="<s:property value="pageNo"/>" onchange="setAction()" />/<s:property value="pageCount" />页 <input type="submit" value="切换" />
					</form>
				</div>
			</div>
			<s:iterator value="newsList" var="result">
				<div class="result_unit">
					<a href="/AudioCMS/news_<s:property value="#result.id"/>.html">
						<s:if test="#result.title.length()>40">
							<s:property value="#result.title.substring(0,40)" />
						</s:if> <s:else>
							<s:property value="#result.title" />
						</s:else>
					</a><br /> <span> <s:if test="#result.content.length()>200">
							<s:property value="#result.content.substring(0,200)" />...
						</s:if> <s:else>
							<s:property value="#result.content" />
						</s:else>
					</span><br /> <a class="tags"
						href="/AudioCMS/news_<s:property value="#result.id"/>.html">
						localhost:8080/AudioCMS/news_<s:property value="#result.id" />.html
					</a>&nbsp; <span class="tags"><s:date name="#result.createTime"
							format="yyyy-MM-dd HH:mm" /></span>
				</div>
			</s:iterator>
			<div>
				<div class="pageOperation">
					<a
						href="/AudioCMS/search.action?keywords=<s:property value="keywords"/>&pageNo=1">首页</a>&nbsp;
					<s:if test="pageNo>1">
						<a
							href="/AudioCMS/search.action?keywords=<s:property value="keywords"/>&pageNo=<s:property value="pageNo-1"/>">上一页</a>
					</s:if>
					<s:else>
　　　
					</s:else>
					&nbsp;
					<s:if test="pageNo<pageCount">
						<a
							href="/AudioCMS/search.action?keywords=<s:property value="keywords"/>&pageNo=<s:property value="pageNo+1"/>">下一页</a>
					</s:if>
					<s:else>
　　　
					</s:else>
					&nbsp; <a
						href="/AudioCMS/search.action?keywords=<s:property value="keywords"/>&pageNo=<s:property value="pageCount"/>">尾页</a>&nbsp;
				</div>
				<input type="hidden" value="<s:property value="keywords"/>"
					id="categoryName" />
				<div class="pageNo">
					<form id="pageswitch" method="POST">
						第<input type="number" id="pageNo"
							max="<s:property value="pageCount"/>" min="1"
							value="<s:property value="pageNo"/>" onchange="setAction()" />/<s:property value="pageCount" />页 <input type="submit" value="切换" />
					</form>
					<script>
						var categoryName = document
								.getElementById("categoryName").value;
						var setAction = function() {
							document.getElementById("pageswitch").action = "/AudioCMS/search.action?keywords="
									+ categoryName
									+ "&pageNo="
									+ document.getElementById("pageNo").value;
						}
						var stateObject = {};
						var title = "Wow Title";
						var newUrl = "/AudioCMS/search.action?keywords="+categoryName+"&pageNo="+document.getElementById("pageNo").value;
						history.pushState(stateObject,title,newUrl);
					</script>
				</div>
			</div>
		</s:if>
		<s:else>
			暂无搜索结果
		</s:else>
	</div>
</body>
</html>