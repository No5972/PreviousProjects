<%@page import="java.sql.Connection"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%><% 
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
		String command="select cno, cname from c";
		PreparedStatement ps=conn.prepareStatement(command);
		//out.print(ps.toString());
		ResultSet rs=ps.executeQuery();
		out.print("<select id=\"a_courses\">");
		while (rs.next()) {
			//result=rs.getInt(1);
			out.print("<option value='");
			out.print(new String(rs.getString(1).getBytes("iso-8859-1"),"UTF-8")+"'>");
			out.print(new String(rs.getString(2).getBytes("iso-8859-1"),"UTF-8"));
			out.print("</option>");
		} 
		out.print("</select>");
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