<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="news_content.css" />
</head>
<title>${ news.title } - 语音播报门户网站 AudioCMS </title>
<body>
	<jsp:include page="fronthead.jsp"></jsp:include>
	<div class="h1">
		<div class="h2-left">
			<div class="path">
				<a href="/AudioCMS_SSM">首页</a> &gt; <a href="/AudioCMS_SSM/category_${ news.cid }/newslist_1.html">${ cname }</a> &gt; ${ news.title }
			</div>
			<div class="content">
				<p class="content_title">
					${ news.title }
				</p>
				<p class="news_time">
					时间：
					<fmt:formatDate value="${ news.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
				</p>
				<p class="">
					语音播报：
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
						codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
						width="290" height="24">
						<param name="movie"
							value='Audios/dew_large.swf?soundFile=Audios/${ news.id }.mp3&amp;bg=0xCDDFF3&amp;leftbg=0x357DCE&amp;lefticon=0xF2F2F2&amp;rightbg=0x357DCE&amp;rightbghover=0x4499EE&amp;righticon=0xF2F2F2&amp;righticonhover=0xFFFFFF&amp;text=0x357DCE&amp;slider=0x357DCE&amp;track=0xFFFFFF&amp;border=0xFFFFFF&amp;loader=0x8EC2F4'>
						<param name="quality" value="high">
						<param value="transparent" name="wmode">
						<embed
							src='Audios/dew_large.swf?soundFile=Audios/${ news.id }.mp3&amp;bg=0xCDDFF3&amp;leftbg=0x357DCE&amp;lefticon=0xF2F2F2&amp;rightbg=0x357DCE&amp;rightbghover=0x4499EE&amp;righticon=0xF2F2F2&amp;righticonhover=0xFFFFFF&amp;text=0x357DCE&amp;slider=0x357DCE&amp;track=0xFFFFFF&amp;border=0xFFFFFF&amp;loader=0x8EC2F4'
							quality="high"
							pluginspage="http://www.macromedia.com/go/getflashplayer"
							type="application/x-shockwave-flash" width="290" height="24">
					</object>
				</p>
				<div>
					${ news.content }
				</div>
			</div>
		</div>
		<div class="h2-right">
			<div class="listblock">
				<div class="listblock-title">
					<a href="/AudioCMS_SSM/newest_1.html">最新消息</a>
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
						<div class="listblock">
				<div class="listblock-title">
					<a href="#">广而告之</a>
				</div>
				<iframe style="height: 150px; width: 98%; overflow: hidden;" src="https://pos.baidu.com/s?hei=150&wid=300&di=u3392638&ltu=https%3A%2F%2Fblog.csdn.net%2Fliulong_%2Farticle%2Fdetails%2F62884336&ccd=24&cja=false&dc=3&dri=0&ti=%E9%A1%B9%E7%9B%AE%E4%B8%AD%E5%8A%A0%E5%85%A5%E7%99%BE%E5%BA%A6%E8%81%94%E7%9B%9F%E5%B9%BF%E5%91%8A%E3%80%82%20-%20CSDN%E5%8D%9A%E5%AE%A2&tcn=1527361648&ari=2&ps=2204x66&pcs=1349x618&chi=1&pis=-1x-1&dai=2&exps=111000&tlm=1527361647&cpl=24&ant=0&cfv=0&ltr=https%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3D5rcy87p2N12EzgOqGVDAnf_8DHTl5TQf2rroHpMpSCz_6fZtNpT5isAauKEV2RGRmoOmQY2prE2TQRzoWeqF1rU_f6C9GgN1DDhoPAK5lua%26wd%3D%26eqid%3D91e8740f0000cebe000000055b09b038&col=zh-CN&dis=0&par=1366x728&pss=1349x3339&tpr=1527361647618&psr=1366x768&drs=1&prot=2&dtm=HTML_POST&cce=true&cmi=80&cdo=-1&cec=UTF-8"></iframe>
			</div>
			<div class="listblock">
				<div class="listblock-title">
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
			<div class="listblock">
				<div class="listblock-title">
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
			<div class="listblock">
				<div class="listblock-title">
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
			<div class="listblock">
				<div class="listblock-title">
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
	</div>
	<div class="h1-down">
		<a href="login.do">管理后台登录</a> <a href="#">站长统计</a>
	</div>
</body>
</html>