<%@ page contentType="text/html; charset=UTF-8" import="java.io.*" %><%
 int i=0;
 String fileName="msgs/0.txt";
 request.setCharacterEncoding("gbk");
 File file=new File(fileName);
 File fileDir=new File("msgs");
 if (!(fileDir.exists()&&fileDir.isDirectory())) fileDir.mkdir();
 while (file.exists()) {
  i++;
  fileName="msgs/"+i+".txt";
  file=new File(fileName);
 }
 String thename=request.getParameter("thename");
 file.createNewFile();
 FileOutputStream oup=new FileOutputStream(file);
 OutputStreamWriter writer=new OutputStreamWriter(oup,"gbk");
 writer.append("Y\r\n");
 writer.append(new String(request.getParameter("thename").getBytes("ISO-8859-1"),"UTF-8"));
 writer.append("走进了聊天室！"+"\r\n");
 writer.close();
 oup.close();
%><%out.print(true);%>