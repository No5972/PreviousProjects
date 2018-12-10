<%@ page import="java.io.*,java.util.*,java.text.*" contentType="text/html; charset=gbk" %><%
 int i=0;
 session.getAttribute("lastmsg");
 session.getAttribute("lastDate");
 out.println("<font style=\"font-size: 14px;\">欢迎光临聊天室，请遵守聊天室规则，不要使用不文明用语。</font><br/>");
 String fileName="msgs\\0.txt";
 File file=new File(fileName);
 while (file.exists()) {
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  //Date current=sdf.parse((String)session.getAttribute("lastDate"));
  //if ((new Date(file.lastModified())).after(current)) {
   String str;
   FileReader in=new FileReader(file);
   BufferedReader bin=new BufferedReader(in);
   str=bin.readLine();
   if (str.equals("Y")) {
    out.print("系统公告：<span style=\"color: #aaa;\">");
    while ((str=bin.readLine())!=null) out.println(str);
    out.print("</span><br/>");
   } else {
    String sender;
    String emotion;
    String target;
    String color;
    String content;
    sender=bin.readLine(); //username
    emotion=bin.readLine();
    target=bin.readLine();
    color=bin.readLine();
    if (sender.equals((String)session.getAttribute("userName"))
     ||target.equals("")
     ||target.equals((String)session.getAttribute("userName"))) {
     //同一机器开多个浏览器窗口session会发生冲突，导致另一个窗口也显示单个用户目标发送消息，这个暂时无法解决。
     //多个机器连接该服务器可以实现指定用户发送。
     out.print("<b style=\"color: #00f;\">"+sender+"</b>");
     if (!emotion.equals("default")) out.print("<span style=\"color: #f00;\">"+emotion+"</span>");
     if (target.equals("")) {
      target="所有人";
     }
     out.print("对<span style=\"color: #0a0;\">["+target+"]</span>说：");
     out.print("<span style=\"color: "+color+";\">");
     while ((str=bin.readLine())!=null) out.print(str);
     out.print("</span>（"+sdf.format(new Date(file.lastModified()))+"）");
     out.print("<br/>");
    }
   //}
  }
  in.close();
   i++;
   fileName="msgs\\"+i+".txt";
   file=new File(fileName);
 }
%>