<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	//insert
	try {
		String command="select count(*) from admins where username=? and password=?";
		PreparedStatement ps=conn.prepareStatement(command);
		ps.setString(1, request.getParameter("name"));
		ps.setString(2, request.getParameter("password"));
		ResultSet rs=ps.executeQuery();
		//out.println("start query<br>");
		while (rs.next()) {
			result=rs.getInt(1);
		}
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
	if (result==0) out.println("<script language=\"javascript\">alert(\"登录用户名或密码错误！\");history.go(-1);</script>");
	else out.println("<script language=\"javascript\">window.location.href=\"student.html\";</script>");
%>
</body>
</html>