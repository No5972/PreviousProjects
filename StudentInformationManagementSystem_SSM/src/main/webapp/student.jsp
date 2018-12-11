<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>学生管理 - 学生信息管理系统</title>
<link rel="stylesheet" href="switch.css" />
<link rel="stylesheet" href="query.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var xx=0, y=0;
var newDialogX = 0, newDialogY = 0;
document.onmousedown = function (e) { 
	xx = e.view.innerWidth - e.pageX; 
	y = e.pageY; 
	newDialogX = e.view.innerWidth / 3;
	newDialogY = e.view.innerHeight / 3;
	// console.log(e); 
};

var sleep = function(d){
	  for(var t = Date.now();Date.now() - t <= d;);
}

var hideConfirmation = function () {
	document.getElementById('deleteConfirm').style.display="none";
}

var showConfirmation = function (x) {
	document.getElementById('confirmDetele').href="javascript:submitDeleteStudent("+x+")";
	document.getElementById('delete_result').innerText="确定要删除吗？";
	document.getElementById('deleteConfirm').style.display="block";
	document.getElementById('deleteConfirm').style.position="absolute";
	document.getElementById('deleteConfirm').style.border="1px solid #000";
	var e = x || window.event;
	//console.log(e);
	document.getElementById('deleteConfirm').style.right=xx-50+"px";
	document.getElementById('deleteConfirm').style.top=y-70+"px";
}

var showNewStudentDialog = function () {
	document.getElementById('add_result').innerText="";
	document.getElementById('newStudentDialog').style.display="block";
	document.getElementById('newStudentDialog').style.position="absolute";
	document.getElementById('newStudentDialog').style.border="1px solid #000";
	document.getElementById('newStudentDialog').style.left=newDialogX+"px";
	document.getElementById('newStudentDialog').style.top=newDialogY+"px";
}

var hideNewStudentDialog = function () {
	document.getElementById('newStudentDialog').style.display="none";
}

var showEditStudentDialog = function (sno) {
	document.getElementById('delete_result').innerText="";
	getStudent(sno);
	document.getElementById('editStudentDialog').style.display="block";
	document.getElementById('editStudentDialog').style.position="absolute";
	document.getElementById('editStudentDialog').style.border="1px solid #000";
	document.getElementById('editStudentDialog').style.left=newDialogX+"px";
	document.getElementById('editStudentDialog').style.top=newDialogY+"px";
}

var hideEditStudentDialog = function () {
	document.getElementById('editStudentDialog').style.display="none";
}

var submitNewStudent = function() {
	addStudent(
		document.getElementById('newStudent_sno').value,
		document.getElementById('newStudent_sname').value,
		document.getElementById('newStudent_ssex').value,
		document.getElementById('newStudent_sbirth').value,
		document.getElementById('newStudent_sclass').value,
		document.getElementById('newStudent_sdept').value
	);
	// if (document.getElementById("add_result").innerText!="添加失败！") hideNewDialog();
	sleep(100);
	query_student();
}

var submitEditStudent = function() {
	editStudent(
		document.getElementById('editStudent_sno').innerText,
		document.getElementById('editStudent_sname').value,
		document.getElementById('editStudent_ssex').value,
		document.getElementById('editStudent_sbirth').value,
		document.getElementById('editStudent_sclass').value,
		document.getElementById('editStudent_sdept').value
	);
	// if (document.getElementById("edit_result").innerText!="修改失败！") hideEditDialog();
	sleep(100);
	query_student();
}

var submitDeleteStudent = function (sno) {
	deleteStudent(sno);
	hideConfirmation();
	sleep(100);
	query_student();
}
</script>
</head>
<body>
<jsp:include page="commonheader.jsp"></jsp:include>
<br>
查询学生：<button id="new" onclick="showNewStudentDialog()">新增学生</button>
学号：<input type="text" id="qstudent_sno" style="width: 10%;" />
姓名：<input type="text" id="qstudent_sname" style="width: 10%;" />
性别：<select id="qstudent_ssex" style="width: 10%;" >
		<option value="">不限</option>
		<option>男</option>
		<option>女</option>
	</select>
出生日期：<input type="date" id="qstudent_sbirth" style="width: 10%;" />
班级：<input type="text" id="qstudent_sclass" style="width: 10%;" />
院系：<input type="text" id="qstudent_sdept" style="width: 10%;" />
<button id="submit" onclick="query_student()">查看</button>
<div id="output"></div>
<div class="deleteConfirm" id="deleteConfirm" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p id="delete_result">确定要删除吗？</p>
	<a href="javascript: void(0);" id="confirmDetele">确认</a>&nbsp;
	<a href="#" onclick="hideConfirmation()">取消</a>
</div>
<div class="newStudentDialog" id="newStudentDialog" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p><h1>新增学生</h1></p>
	<p id="add_result" style="color: red;">&nbsp;</p>
	<p>学号：<input type="text" id="newStudent_sno"/></p>
	<p>姓名：<input type="text" id="newStudent_sname"/></p>
	<p>性别：<select id="newStudent_ssex">
		<option>男</option>
		<option>女</option>
	</select></p>
	<p>出生日期：<input type="date" id="newStudent_sbirth"/></p>
	<p>班级：<input type="text" id="newStudent_sclass"/></p>
	<p>院系：<input type="text" id="newStudent_sdept"/></p>
	<button id="submitNewStudent" onclick="submitNewStudent()">确认</button>&nbsp;
	<button onclick="hideNewStudentDialog()">取消</button>
</div>
<div class="editStudentDialog" id="editStudentDialog" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p><h1>编辑学生</h1></p>
	<p id="edit_result" style="color: red;">&nbsp;</p>
	<p>学号：<span id="editStudent_sno"></span></p>
	<p>姓名：<input type="text" id="editStudent_sname"/></p>
	<p>性别：<select id="editStudent_ssex">
		<option>男</option>
		<option>女</option>
	</select></p>
	<p>出生日期：<input type="date" id="editStudent_sbirth"/></p>
	<p>班级：<input type="text" id="editStudent_sclass"/></p>
	<p>院系：<input type="text" id="editStudent_sdept"/></p>
	<button id="submitEditStudent" onclick="submitEditStudent()">确认</button>&nbsp;
	<button onclick="hideEditStudentDialog()">取消</button>
</div>
</body>
<script src="jquery-3.1.1.js"></script>
<script src="jquery-ui.min.js"></script>
<script src="query.js?ver=21"></script>
<script>
$("#newStudentDialog").draggable();
$("#editStudentDialog").draggable();
</script>
</body>
</html>