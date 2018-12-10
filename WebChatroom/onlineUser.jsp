<%@ page import="java.util.*,java.io.*" contentType="text/html; charset=UTF-8"  %>
<%
out.print("<center><b>欢迎进入聊天室！</b></br><a class=\"targetlink\" onclick=\"document.getElementById(\'target\').value='';document.getElementById('content').focus();\">所有人</a><br/>");
FileReader in=new FileReader("users.dat");
BufferedReader br=new BufferedReader(in);
String str;
int n=0;
while((str=br.readLine()) != null ){
n++;
%><%="<a class=\"targetlink\" onclick=\"document.getElementById(\'target\').value='"+str+"';document.getElementById('content').focus();\">"+str+"</a><br>"%>
<%
}
in.close();
%>
当前在线[<span style="color: #f00;"><%=n%></span>]人</center>