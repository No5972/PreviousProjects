<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息管理系统</title>
</head>
<body>
	<center>
		欢迎进入学生信息管理系统<br>
		<h1>登录</h1>
		<hr>
		<form action="login.php" method="POST">
			<p>
				用户名：<input type="text" name="username" length=12 />
			</p>
			<p>
				密码 ：<input type="password" name="password" length=16 />
			</p>
			<p>
				<input type="submit" value="登录" />
			</p>
		</form>
	</center>
	</body>
</html>