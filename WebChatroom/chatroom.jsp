<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,java.io.*,java.text.*"  %>
<%
 //在线人数显示
 request.setCharacterEncoding("UTF-8");
 //取得登录用户名
 String userName = request.getParameter("myname");
 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 session.setAttribute("userName",userName);
 session.setAttribute("lastDate",sdf.format(new Date()));
 List onlineUserList = new ArrayList();
 FileReader in=new FileReader("users.dat");
 BufferedReader br=new BufferedReader(in);
 String str;
 while((str=br.readLine()) != null ){
  onlineUserList.add(str);
 }
 in.close();
 if (userName==null) out.println("<script>alert(\"还没有登记用户名！\");window.location.href=\"index.html\";</script>");
 if (!onlineUserList.contains(userName)) {
  FileWriter oup=new FileWriter("users.dat",true);
  StringBuilder sb=new StringBuilder();
  for (int i=0;i<onlineUserList.size();i++) {
   sb.append(onlineUserList.get(i));
   sb.append("\r\n");
  }
  oup.write(userName+"\r\n");
  oup.close();
 }
%>
<html>
<head>
<meta charset="UTF-8" />
<title><% out.print(userName); %> - JSP+AJAX聊天室 BY wujiuqier</title>
<link rel="stylesheet" href="chatroom.css" />
</head>
<body>
<div class="top">
<table class="toptable" cellspacing="0">
<tr>
<td width="15%" class="topcell">
<center>
<%-- USERLIST AND ONLINE COUNT --%>
<div id="userlist"><jsp:include page="onlineUser.jsp" /></div>
</center>
</td>
<td width="80%" class="topcell">
<div class="msgbox" id="msgs">
<% out.println("<font style=\"font-size: 14px;\">欢迎光临聊天室，请遵守聊天室规则，不要使用不文明用语。</font><br/>"); %>
</div>
</td>
</tr>
</table>
</div>
<div class="bottom">
<table class="console">
<tr><td width="50%">[<span id="myname"><%= request.getParameter("myname")%></span>]对<input type="text" id="target" name="target" />表情
<select id="emotion" >
<option value="default">无</option>
<option value="微笑着">微笑着</option>
</select>说：</td>
<td width="50%">字体颜色：<input type="color" id="color" name="color" /></td>
</tr>
<tr><td width="50%" class="edit"><input type="text" id="content" name="content" /><button id="submit" onclick="submit1()">发送</button></td>
<td width="50%" class="button-right"><button id="exit" onclick="window.location.href='Logout.jsp'">退出聊天室</button></tr>
</table>
</div>
<script src="jquery-3.1.1.js"></script>
<script src="chatroom.js"></script>
</body>
</html>