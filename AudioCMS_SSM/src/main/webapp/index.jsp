<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="index.css"/>
<title>语音播报门户网站 AudioCMS</title>
</head>
<body>
<jsp:include page="fronthead.jsp"></jsp:include>
		<div class="h2-left"><p>　　这个是把原来的语音播报门户网站用SSM框架重新搭建，操作界面不变，功能不变，部分细节会有细微的优化。</p></div>
		<div class="h2-right">
			<div class="h3-1 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS_SSM/newest_1.html">最新消息</a>
				</div>
				<div class="headline-wrap">
					<a href="/AudioCMS_SSM/news_${ headlineNews.id }.html">
						<c:if test="${ headlineNews.title.length()>15 }">
							<c:out value="${ headlineNews.title.substring(0,15) }" escapeXml="true">无</c:out>
						</c:if>
						<c:if test="${ headlineNews.title.length()<=15 }">
							<c:out value="${ headlineNews.title }" escapeXml="true">无</c:out>
						</c:if>
					</a>
					<p class="headline-content">
						<c:if test="${ headlineNews.content.length()>35 }">
							<c:out value="${ headlineNews.content.substring(0,35) }" escapeXml="true">无</c:out>
						</c:if>
						<c:if test="${ headlineNews.content.length()<=35 }">
							<c:out value="${ headlineNews.content }" escapeXml="true">无</c:out>
						</c:if>
					</p>
				</div>
				<ul>
				<c:if test="${ fn:length(newestNews)!=0 }">
					<c:forEach items="${ newestNews }" var="newest">
						<li><div class="newsitem"><a href="/AudioCMS_SSM/news_${ newest.id }.html">
							<c:if test="${ newest.title.length()>24 }">
								<c:out value="${ newest.title.substring(0,24) }">无</c:out>
							</c:if>
							<c:if test="${ newest.title.length()<=24 }">
								<c:out value="${ newest.title }">无</c:out>
							</c:if>
						</a></div><div class="newsitem-date">
							<span><fmt:formatDate value="${ newest.createTime }" pattern="MM-dd"/></span>
						</div></li>
					</c:forEach>
				</c:if><c:if test="${ fn:length(newestNews)==0 }">暂无内容</c:if>
				</ul>
			</div>
			<div class="h3-2 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS_SSM/category_5/newslist_1.html">生活</a>
				</div>
				<ul>
				<c:if test="${ fn:length(newsList1)!=0 }">
					<c:forEach items="${ newsList1 }" var="list1">
						<li><div class="newsitem"><a href="/AudioCMS_SSM/news_${ list1.id }.html">
							<c:if test="${ list1.title.length()>24 }">
								<c:out value="${ list1.title.substring(0,24) }">无</c:out>
							</c:if>
							<c:if test="${ list1.title.length()<=24 }">
								<c:out value="${ list1.title }">无</c:out>
							</c:if>
						</a></div><div class="newsitem-date">
							<span><fmt:formatDate value="${ list1.createTime }" pattern="MM-dd"/></span>
						</div></li>
					</c:forEach>
				</c:if><c:if test="${ fn:length(newestNews)==0 }">暂无内容</c:if>
				</ul>
			</div>
			<div class="h3-3 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS_SSM/category_4/newslist_1.html">IT</a>
				</div>
				<ul>
				<c:if test="${ fn:length(newsList2)!=0 }">
					<c:forEach items="${ newsList2 }" var="list2">
						<li><div class="newsitem"><a href="/AudioCMS_SSM/news_${ list2.id }.html">
							<c:if test="${ list2.title.length()>24 }">
								<c:out value="${ list2.title.substring(0,24) }">无</c:out>
							</c:if>
							<c:if test="${ list2.title.length()<=24 }">
								<c:out value="${ list2.title }">无</c:out>
							</c:if>
						</a></div><div class="newsitem-date">
							<span><fmt:formatDate value="${ list2.createTime }" pattern="MM-dd"/></span>
						</div></li>
					</c:forEach>
				</c:if><c:if test="${ fn:length(newestNews)==0 }">暂无内容</c:if>
				</ul>
			</div>
			<div class="h3-4 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS_SSM/category_3/newslist_1.html">校园</a>
				</div>
				<ul>
				<c:if test="${ fn:length(newsList3)!=0 }">
					<c:forEach items="${ newsList3 }" var="list3">
						<li><div class="newsitem"><a href="/AudioCMS_SSM/news_${ list3.id }.html">
							<c:if test="${ list3.title.length()>24 }">
								<c:out value="${ list3.title.substring(0,24) }">无</c:out>
							</c:if>
							<c:if test="${ list3.title.length()<=24 }">
								<c:out value="${ list3.title }">无</c:out>
							</c:if>
						</a></div><div class="newsitem-date">
							<span><fmt:formatDate value="${ list3.createTime }" pattern="MM-dd"/></span>
						</div></li>
					</c:forEach>
				</c:if><c:if test="${ fn:length(newestNews)==0 }">暂无内容</c:if>
				</ul>
			</div>
			<div class="h3-5 newsblock">
				<div class="newsblock-title">
					<a href="#">广而告之</a>
				</div>
				<iframe style="height: 150px; width: 98%; overflow: hidden;" src="https://pos.baidu.com/s?hei=150&wid=300&di=u3392638&ltu=https%3A%2F%2Fblog.csdn.net%2Fliulong_%2Farticle%2Fdetails%2F62884336&ccd=24&cja=false&dc=3&dri=0&ti=%E9%A1%B9%E7%9B%AE%E4%B8%AD%E5%8A%A0%E5%85%A5%E7%99%BE%E5%BA%A6%E8%81%94%E7%9B%9F%E5%B9%BF%E5%91%8A%E3%80%82%20-%20CSDN%E5%8D%9A%E5%AE%A2&tcn=1527361648&ari=2&ps=2204x66&pcs=1349x618&chi=1&pis=-1x-1&dai=2&exps=111000&tlm=1527361647&cpl=24&ant=0&cfv=0&ltr=https%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3D5rcy87p2N12EzgOqGVDAnf_8DHTl5TQf2rroHpMpSCz_6fZtNpT5isAauKEV2RGRmoOmQY2prE2TQRzoWeqF1rU_f6C9GgN1DDhoPAK5lua%26wd%3D%26eqid%3D91e8740f0000cebe000000055b09b038&col=zh-CN&dis=0&par=1366x728&pss=1349x3339&tpr=1527361647618&psr=1366x768&drs=1&prot=2&dtm=HTML_POST&cce=true&cmi=80&cdo=-1&cec=UTF-8"></iframe>
				<!--  
				<ul>
				<s:if test="newestNews.size()!=0">
					<s:iterator value="newsList4" var="list4">
						<li><div class="newsitem"><a href="#">
							<s:if test="#list4.title.length()>24"><s:property value="#list4.title.substring(0,24)"/></s:if>
							<s:else><s:property value="#list4.title"/></s:else>
						</a></div><div class="newsitem-date">
							<span><s:date name="#list4.createTime" format="MM-dd"/></span>
						</div></li>
					</s:iterator>
					
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
				-->
			</div>
			<div class="h3-6 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS_SSM/category_1/newslist_1.html">其他</a>
				</div>
				<ul>
				<c:if test="${ fn:length(newsList5)!=0 }">
					<c:forEach items="${ newsList5 }" var="list5">
						<li><div class="newsitem"><a href="/AudioCMS_SSM/news_${ list5.id }.html">
							<c:if test="${ list5.title.length()>24 }">
								<c:out value="${ list5.title.substring(0,24) }">无</c:out>
							</c:if>
							<c:if test="${ list5.title.length()<=24 }">
								<c:out value="${ list5.title }">无</c:out>
							</c:if>
						</a></div><div class="newsitem-date">
							<span><fmt:formatDate value="${ list5.createTime }" pattern="MM-dd"/></span>
						</div></li>
					</c:forEach>
				</c:if><c:if test="${ fn:length(newestNews)==0 }">暂无内容</c:if>
				</ul>
			</div>
		</div>
		<div class="h2-down">
			<a href="login.do">管理后台登录</a> <a href="#">站长统计</a>
		</div>
</body>
</html>