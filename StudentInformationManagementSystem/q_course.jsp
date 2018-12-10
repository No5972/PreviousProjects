<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<% 
	Connection conn;
	Statement stmt;
	int result=-1;
	//get driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("driver success");
	} catch (ClassNotFoundException e) {
		System.out.println("driver fail");
		e.printStackTrace();
	}
	//connect
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/DBSP", "root", "*********");
	try {
		
		stmt=conn.createStatement();
		System.out.println("connection success");
	} catch (SQLException e) {
		System.out.println("driver fail");
		e.printStackTrace();
	}
	try {
		String command="select * from c where cno like ? and cname like ? and ccredit like ? and cteacher like ?";
		PreparedStatement ps=conn.prepareStatement(command);
		ps.setString(1, "%"+request.getParameter("q_cno")+"%");
		ps.setString(2, "%"+request.getParameter("q_cname")+"%");
		ps.setString(3, "%"+request.getParameter("q_ccredit")+"%");
		ps.setString(4, "%"+request.getParameter("q_cteacher")+"%");
		//out.print(ps.toString());
		ResultSet rs=ps.executeQuery();
		rs.last();
		out.print("查询到"+rs.getRow()+"条记录<br>");
		rs.beforeFirst();
		out.print("<table cellspacing=\"0\" style=\"width: 100%; \"><thead><tr><td>课程号</td><td>课程名</td><td>学分</td><td>任课教师</td></tr></thead><tbody>");
		while (rs.next()) {
			//result=rs.getInt(1);
			out.print("<tr>");
			out.print("<td>"+new String(rs.getString(1).getBytes("iso-8859-1"),"UTF-8")+"</td>");
			out.print("<td>"+new String(rs.getString(2).getBytes("iso-8859-1"),"UTF-8")+"</td>");
			out.print("<td>"+rs.getString(3)+"</td>");
			out.print("<td>"+new String(rs.getString(4).getBytes("iso-8859-1"),"UTF-8")+"</td>");
			out.print("</tr>");
		} 
		out.print("</tbody></table>");
	} catch (Exception e) {
		System.out.println("login fail");
		e.printStackTrace();
	} finally {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	if (result==0) out.println("数据库连接错误");
%>
</body>
</html>