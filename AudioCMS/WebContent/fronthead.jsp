<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>	
<%@ taglib prefix="s" uri="/struts-tags" %>

		<link rel="stylesheet" href="/AudioCMS/fronthead.css"/>

		<div class="top-notice">提示：推荐使用Chrome浏览器，IE9或以上浏览器，Safari浏览器，Firefox浏览器等浏览</div>
		<div class="index-logo"><a class="logo-link" href="/AudioCMS"><img src="/AudioCMS/static/index_logo.png"/></a></div>
		<div class="welcome"><a class="logo-link" href=""><img src="/AudioCMS/static/welcome.png"/></a></div>
		<div class="navigator">
		<s:if test="allCategories.size()!=0">
			<ul class="navigator-list">
				<!--
				<li><a class="list-link" href="#">最新消息</a></li>
				<li><a class="list-link" href="#">类别1</a></li>
				<li><a class="list-link" href="#">类别2</a></li>
				<li><a class="list-link" href="#">类别3</a></li>
				<li><a class="list-link" href="#">类别4</a></li>
				<li><a class="list-link" href="#">类别5</a></li>
				-->
				<li><a class="list-link" href="/AudioCMS">网站首页</a></li>
				<li><a class="list-link" href="/AudioCMS/newest_1.html">最新消息</a></li>
				<s:iterator value="allCategories" var="category">
					<s:if test="#category.id!=2">
					<li><a class="list-link" href="/AudioCMS/category_<s:property value="#category.id"/>_news_1.html"><s:property value="#category.name"/></a></li>
					</s:if>
				</s:iterator>
			</ul>
		</s:if>
		<div>
			<form action="search.action" method="post">
				<input class="searchbox" type="text" placeholder="这里可以搜索文章" name="keywords"/>
				<input type="hidden" name="pageNo" value="1"/>
				<input class="searchbutton" type="submit" value="搜"/>
			</form>
		</div>
		</div>
		<div style="text-align: center; width: 99%; border: 1px solid #88f; margin-top:5px;">
			<iframe style="height: 105px; width: 850px; overflow: hidden;" src="https://pos.baidu.com/s?hei=100&wid=800&di=u3392638&ltu=https%3A%2F%2Fblog.csdn.net%2Fliulong_%2Farticle%2Fdetails%2F62884336&ccd=24&cja=false&dc=3&dri=0&ti=%E9%A1%B9%E7%9B%AE%E4%B8%AD%E5%8A%A0%E5%85%A5%E7%99%BE%E5%BA%A6%E8%81%94%E7%9B%9F%E5%B9%BF%E5%91%8A%E3%80%82%20-%20CSDN%E5%8D%9A%E5%AE%A2&tcn=1527361648&ari=2&ps=2204x66&pcs=1349x618&chi=1&pis=-1x-1&dai=2&exps=111000&tlm=1527361647&cpl=24&ant=0&cfv=0&ltr=https%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3D5rcy87p2N12EzgOqGVDAnf_8DHTl5TQf2rroHpMpSCz_6fZtNpT5isAauKEV2RGRmoOmQY2prE2TQRzoWeqF1rU_f6C9GgN1DDhoPAK5lua%26wd%3D%26eqid%3D91e8740f0000cebe000000055b09b038&col=zh-CN&dis=0&par=1366x728&pss=1349x3339&tpr=1527361647618&psr=1366x768&drs=1&prot=2&dtm=HTML_POST&cce=true&cmi=80&cdo=-1&cec=UTF-8"></iframe>
		</div>
