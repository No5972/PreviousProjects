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
 String emotion=request.getParameter("emotion");
 String target=request.getParameter("target");
 String color=request.getParameter("color");
 String myname=request.getParameter("myname");
 file.createNewFile();

 FileOutputStream oup=new FileOutputStream(file);
 OutputStreamWriter writer=new OutputStreamWriter(oup,"gbk");
 writer.append("N\r\n");

 writer.append(new String(request.getParameter("thename").getBytes("ISO-8859-1"),"UTF-8")+"\r\n");
 writer.append(new String(request.getParameter("emotion").getBytes("ISO-8859-1"),"UTF-8")+"\r\n");
 writer.append(new String(request.getParameter("target").getBytes("ISO-8859-1"),"UTF-8")+"\r\n");
 writer.append(new String(request.getParameter("color"))+"\r\n");
 writer.append(new String(request.getParameter("myname").getBytes("ISO-8859-1"),"UTF-8")+"\r\n"); 
 writer.close();

 /*
$.ajax({
    type: 'post',
    url: 'aaa/bbb.do',
    contentType: 'application/json;charset=utf-8',
    data: '{"name": "uname", "age": 18}',
    success: function (data) { //·µ»Øjson½á¹û
        alert(data);
    }
});
  */
 oup.close();
%><%out.print(true);%>