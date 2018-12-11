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

var showConfirmation = function (sno, cno) {
	document.getElementById('confirmDetele').href="javascript:submitDeleteGrade("+sno+","+cno+")";
	document.getElementById('delete_result').innerText="确定要删除吗？";
	document.getElementById('deleteConfirm').style.display="block";
	document.getElementById('deleteConfirm').style.position="absolute";
	document.getElementById('deleteConfirm').style.border="1px solid #000";
	document.getElementById('deleteConfirm').style.right=xx-50+"px";
	document.getElementById('deleteConfirm').style.top=y-70+"px";
}

var showNewGradeDialog = function () {
	document.getElementById('add_result').innerText="";
	document.getElementById('newGradeDialog').style.display="block";
	document.getElementById('newGradeDialog').style.position="absolute";
	document.getElementById('newGradeDialog').style.border="1px solid #000";
	document.getElementById('newGradeDialog').style.left=newDialogX+"px";
	document.getElementById('newGradeDialog').style.top=newDialogY+"px";
}

var hideNewGradeDialog = function () {
	document.getElementById('newGradeDialog').style.display="none";
}

var showEditGradeDialog = function (sno, cno) {
	document.getElementById('delete_result').innerText="";
	getGrade(sno, cno);
	document.getElementById('editGradeDialog').style.display="block";
	document.getElementById('editGradeDialog').style.position="absolute";
	document.getElementById('editGradeDialog').style.border="1px solid #000";
	document.getElementById('editGradeDialog').style.left=newDialogX+"px";
	document.getElementById('editGradeDialog').style.top=newDialogY+"px";
}

var hideEditGradeDialog = function () {
	document.getElementById('editGradeDialog').style.display="none";
}

var submitNewGrade = function() {
	addGrade(
		document.getElementById('newGrade_sno').value,
		document.getElementById('newGrade_cno').value,
		document.getElementById('newGrade_grade').value
	);
	// if (document.getElementById("add_result").innerText!="添加失败！") hideNewDialog();
	sleep(100);
	query_grade();
}

var submitEditGrade = function() {
	editGrade(
		document.getElementById('editGrade_sno').innerText,
		document.getElementById('editGrade_cno').innerText,
		document.getElementById('editGrade_grade').value
	);
	// if (document.getElementById("edit_result").innerText!="修改失败！") hideEditDialog();
	sleep(100);
	query_grade();
}

var submitDeleteGrade = function (sno, cno) {
	deleteGrade(sno, cno);
	hideConfirmation();
	sleep(100);
	query_grade();
}
</script>
</head>
<body>
<jsp:include page="commonheader.jsp"></jsp:include>
<br>
查询成绩：<button id="new" onclick="showNewGradeDialog()">新增成绩</button>
姓名　：<input type="text" id="qgrade_sname" style="width: 10%;" />
课程名：<input type="text" id="qgrade_cname" style="width: 10%;" />
最低分：<input type="number" id="qgrade_low" style="width: 10%;" />
最高分：<input type="number" id="qgrade_high" style="width: 10%;" />
<button id="submit" onclick="query_grade()">查看</button>
<div id="output"></div>
<div class="deleteConfirm" id="deleteConfirm" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p id="delete_result">确定要删除吗？</p>
	<a href="javascript: void(0);" id="confirmDetele">确认</a>&nbsp;
	<a href="#" onclick="hideConfirmation()">取消</a>
</div>
<div class="newGradeDialog" id="newGradeDialog" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p><h1>新增成绩</h1></p>
	<p id="add_result" style="color: red;">&nbsp;</p>
	<p>学号　：<input type="text" id="newGrade_sno" onblur="getStudent_edit(document.getElementById('newGrade_sno').value)"/></p>
	<p>姓名　：<span id="newGrade_sname"></span></p>
	<p>课程号：<input type="text" id="newGrade_cno" onblur="getCourse_edit(document.getElementById('newGrade_cno').value)"/></p>
	<p>课程名：<span id="newGrade_cname"></span></p>
	<p>分数　：<input type="text" id="newGrade_grade"/></p>
	<button id="submitNewGrade" onclick="submitNewGrade()">确认</button>&nbsp;
	<button onclick="hideNewGradeDialog()">取消</button>
</div>
<div class="editGradeDialog" id="editGradeDialog" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p><h1>编辑成绩</h1></p>
	<p id="edit_result" style="color: red;">&nbsp;</p>
	<p>学号　：<span id="editGrade_sno"></span></p>
	<p>姓名　：<span id="editGrade_sname"></span></p>
	<p>课程号：<span id="editGrade_cno"></span></p>
	<p>课程名：<span id="editGrade_cname"></span></p>
	<p>分数　：<input type="text" id="editGrade_grade"/></p>
	<button id="submitEditGrade" onclick="submitEditGrade()">确认</button>&nbsp;
	<button onclick="hideEditGradeDialog()">取消</button>
</div>
</body>
<script src="jquery-3.1.1.js"></script>
<script src="jquery-ui.min.js"></script>
<script src="query.js?ver=29"></script>
<script>
$("#newGradeDialog").draggable();
$("#editGradeDialog").draggable();
</script>
</body>
</html>