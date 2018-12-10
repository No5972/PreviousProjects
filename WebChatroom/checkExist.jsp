<%@ page import="java.util.*;java.io.*" contentType="text/html; charset=GBK"  %><%
List userlist=new ArrayList();
FileReader in=new FileReader("users.dat");
BufferedReader br=new BufferedReader(in);
String str;
int n;
while((str=br.readLine()) != null ){
userlist.add(str);
}
in.close();
String userName=request.getParameter("username");
out.print(onlist.contains(userName));
%>