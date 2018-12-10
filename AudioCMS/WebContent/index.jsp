<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="index.css"/>
<title>语音播报门户网站 AudioCMS</title>
</head>
<body>
<jsp:include page="fronthead.jsp"></jsp:include>
		<div class="h2-left"><p>　　语音播报门户网站马上就要做好了！现在正在设计前台的内容。后台已经全部搭好了！前台其实工作量很少，主要就是这个排版。基本上后台和前台的工作量也就是个七三开吧大概。排版搞好了，基本也就完事啦！嘎嘎~</p></div>
		<div class="h2-right">
			<div class="h3-1 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS/newest_1.html">最新消息</a>
				</div>
				<div class="headline-wrap">
					<a href="/AudioCMS/news_<s:property value="headlineNews.id"/>.html">
						<s:if test="headlineNews.title.length()>15">
							<s:property value="headlineNews.title.substring(0,15)"/>
						</s:if>
						<s:else>
							<s:property value="headlineNews.title"/>
						</s:else>
					</a>
					<p class="headline-content">
						<s:if test="headlineNews.content.length()>35">
							<s:property value="headlineNews.content.substring(0,35)"/>
						</s:if>
						<s:else>
							<s:property value="headlineNews.title"/>
						</s:else>
					</p>
				</div>
				<ul>
				<s:if test="newestNews.size()!=0">
					<s:iterator value="newestNews" var="newest">
						<li><div class="newsitem"><a href="/AudioCMS/news_<s:property value="#newest.id"/>.html">
							<s:if test="#newest.title.length()>24"><s:property value="#newest.title.substring(0,24)"/></s:if>
							<s:else><s:property value="#newest.title"/></s:else>
						</a></div><div class="newsitem-date">
							<span><s:date name="#newest.createTime" format="MM-dd"/></span>
						</div></li>
					</s:iterator>
					<!-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					-->
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
			</div>
			<div class="h3-2 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS/category_5_news_1.html">生活</a>
				</div>
				<ul>
				<s:if test="newsList1.size()!=0">
					<s:iterator value="newsList1" var="list1">
						<li><div class="newsitem"><a href="/AudioCMS/news_<s:property value="#list1.id"/>.html">
							<s:if test="#list1.title.length()>24"><s:property value="#list1.title.substring(0,24)"/></s:if>
							<s:else><s:property value="#list1.title"/></s:else>
						</a></div><div class="newsitem-date">
							<span><s:date name="#list1.createTime" format="MM-dd"/></span>
						</div></li>
					</s:iterator>
					<!-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					-->
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
			</div>
			<div class="h3-3 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS/category_4_news_1.html">IT</a>
				</div>
				<ul>
				<s:if test="newsList2.size()!=0">
					<s:iterator value="newsList2" var="list2">
						<li><div class="newsitem"><a href="/AudioCMS/news_<s:property value="#list2.id"/>.html">
							<s:if test="#list2.title.length()>24"><s:property value="#list2.title.substring(0,24)"/></s:if>
							<s:else><s:property value="#list2.title"/></s:else>
						</a></div><div class="newsitem-date">
							<span><s:date name="#list2.createTime" format="MM-dd"/></span>
						</div></li>
					</s:iterator>
					<!-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					-->
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
			</div>
			<div class="h3-4 newsblock">
				<div class="newsblock-title">
					<a href="/AudioCMS/category_3_news_1.html">校园</a>
				</div>
				<ul>
				<s:if test="newsList3.size()!=0">
					<s:iterator value="newsList3" var="list3">
						<li><div class="newsitem"><a href="/AudioCMS/news_<s:property value="#list3.id"/>.html">
							<s:if test="#list3.title.length()>24"><s:property value="#list3.title.substring(0,24)"/></s:if>
							<s:else><s:property value="#list3.title"/></s:else>
						</a></div><div class="newsitem-date">
							<span><s:date name="#list3.createTime" format="MM-dd"/></span>
						</div></li>
					</s:iterator>
					<!-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					-->
				</s:if><s:else><center>暂无内容</center></s:else>
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
					<a href="/AudioCMS/category_1_news_1.html">其他</a>
				</div>
				<ul>
				<s:if test="newsList5.size()!=0">
					<s:iterator value="newsList5" var="list5">
						<li><div class="newsitem"><a href="/AudioCMS/news_<s:property value="#list5.id"/>.html">
							<s:if test="#list5.title.length()>24"><s:property value="#list5.title.substring(0,24)"/></s:if>
							<s:else><s:property value="#list5.title"/></s:else>
						</a></div><div class="newsitem-date">
							<span><s:date name="#list5.createTime" format="MM-dd"/></span>
						</div></li>
					</s:iterator>
					<!-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					-->
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
			</div>
		</div>
		<div class="h2-down">
			<a href="login.jsp">管理后台登录</a> <a href="#">站长统计</a>
		</div>
</body>
</html>