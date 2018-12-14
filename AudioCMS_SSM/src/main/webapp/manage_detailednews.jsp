<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="command" class="io.github.no5972.audiocms.models.News"
	scope="request"></jsp:useBean>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>文章详情</title>
<link rel="stylesheet" href="switch.css" />
<link rel="stylesheet" href="manage_content.css" />
</head>
<body>
	<jsp:include page="manage_menu.jsp"></jsp:include>
	<div class="manage_content">
		<a href="manage_news.php?cid=${ news.cid }">返回类别：${ currCategoryName }</a><br />
		<a href="manage_updatenewsinput.php?id=${ news.id }">编辑</a> &nbsp;
		<c:if test="${ news.isHeadline() }">
			<b>已是头条</b>
		</c:if>
		<c:if test="${ !news.isHeadline() }">
			<a href="manage_setheadline.php?id=${ news.id }&from=detailed">设为头条</a>
		</c:if>
		<table style="width: 100%;">
			<tr>
				<td style="width: 50%;"><b>文章标题：${ news.title }</b><br /></td>
				<td style="width: 50%; text-align: right;"><b>发布时间：</b>
				<fmt:formatDate value='${ news.createTime }'
						pattern='yyyy-MM-dd HH:mm:ss' /><br /></td>
			</tr>
		</table>
		<b>语音播报：</b>
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
		<br /> <b>文章内容：</b><br /> ${ news.content }
	</div>
</body>
</html>