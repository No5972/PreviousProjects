<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/AudioCMS/fronthead.css"/>
<link rel="stylesheet" href="/AudioCMS/news_content.css"/>
<link rel="stylesheet" href="/AudioCMS/newslist.css"/>
<title><s:property value="#session.cname"/> - 语音播报门户网站 AudioCMS</title>
</head>
<body>
	<jsp:include page="fronthead.jsp"></jsp:include>
		<div class="h1">
		<div class="h2-left">
				<div class="path"><a href="/AudioCMS">首页</a> &gt; <s:property value="#session.cname"/></div>
				<div class="list">
				<s:if test="cnews.size()!=0">
					<ul>
						<s:iterator value="cnews" var="cn">
							<li>
								<div class="newsitem"><a href="/AudioCMS/news_<s:property value="#cn.id"/>.html">
									<s:if test="#cn.title.length()>40">
										<s:property value="#cn.title.substring(0,40)"/>
									</s:if>
									<s:else><s:property value="#cn.title"/></s:else>
								</a></div>
								<div class="newsitem-date"><span><s:date name="#cn.createTime" format="yyyy-MM-dd"/></span></div>
							</li>
						</s:iterator>
						<%-- <li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
						--%>
					</ul>
				</s:if><s:else><center>暂无内容</center></s:else>
				</div>
				<div>
					<div class="pageOperation">
						<a href="/AudioCMS/category_<s:property value="cid"/>_news_1.html">首页</a>&nbsp;
						<s:if test="pageNo>1">
						<a href="/AudioCMS/category_<s:property value="cid"/>_news_<s:property value="pageNo-1"/>.html">上一页</a>
						</s:if><s:else>
						　　　
						</s:else>
						&nbsp;
						<s:if test="pageNo<pageCount">
						<a href="/AudioCMS/category_<s:property value="cid"/>_news_<s:property value="pageNo+1"/>.html">下一页</a>
						</s:if><s:else>
						　　　
						</s:else>
						&nbsp;
						<a href="/AudioCMS/category_<s:property value="cid"/>_news_<s:property value="pageCount"/>.html">尾页</a>&nbsp;
					</div>
					<div class="pageNo">
					<form id="pageswitch" method="POST">
						第<input type="number" id="pageNo" max="<s:property value="pageCount"/>" min="1"
							value="<s:property value="pageNo"/>" onchange="setAction()"/>/<s:property value="pageCount"/>页
						<input type="submit" value="切换"/>
					</form>
					<script>
					var setAction = function() {
						document.getElementById("pageswitch").action="/AudioCMS/category_<s:property value="cid" />_news_"+document.getElementById("pageNo").value+".html";
					}
					</script>
					</div>
				</div>
			</div>
		<div class="h2-right">
			<div class="listblock">
				<div class="listblock-title">
					<a href="/AudioCMS/newest_1.html">最新消息</a>
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
					<%-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					--%>
				</s:if><s:else><center>暂无内容</center></s:else>
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
					<%-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					--%>
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
			</div>
			<div class="listblock">
				<div class="listblock-title">
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
					<%-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					--%>
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
			</div>
			<div class="listblock">
				<div class="listblock-title">
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
					<%-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					--%>
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
			</div>
			<div class="listblock">
				<div class="listblock-title">
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
					<%-- 
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					<li><div class="newsitem"><a href="#">这是一条消息这是一条消息</a></div><div class="newsitem-date"><span>01-01</span></div></li>
					--%>
				</s:if><s:else><center>暂无内容</center></s:else>
				</ul>
			</div>
		</div>
	</div>
	<div class="h1-down">
		<a href="login.jsp">管理后台登录</a> <a href="#">站长统计</a>
	</div>
</body>
</html>