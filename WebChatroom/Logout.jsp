<%@ page import="java.util.*,java.io.*" %>
<%
 //ȡ�õ�¼���û���
 String username = (String) session.getAttribute("userName");
 //����session
 // �������б���ɾ���û���
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
 // �ɹ�
 response.sendRedirect("index.html");
%>