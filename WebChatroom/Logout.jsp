<%@ page import="java.util.*,java.io.*" %>
<%
 //取得登录的用户名
 String username = (String) session.getAttribute("userName");
 //销毁session
 // 从在线列表中删除用户名
 List<String> onlineUserList = new ArrayList();
 FileReader in=new FileReader("users.dat");
 BufferedReader br=new BufferedReader(in);
 String str;
 while((str=br.readLine()) != null ){
  onlineUserList.add(str);
 }
 in.close();
 FileWriter oup=new FileWriter("users.dat");
 for (int i=0;i<onlineUserList.size();i++) {
  if (!onlineUserList.get(i).equals(username)) {
   oup.write(onlineUserList.get(i));
   oup.write("\r\n");
  }
 }
 oup.close();
 session.invalidate();
 // 成功
 response.sendRedirect("index.html");
%>