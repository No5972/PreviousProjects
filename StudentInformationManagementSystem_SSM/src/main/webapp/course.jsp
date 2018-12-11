<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>课程管理 - 学生信息管理系统</title>
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
	document.getElementById('confirmDetele').href="javascript:submitDeleteCourse("+x+")";
	document.getElementById('delete_result').innerText="确定要删除吗？";
	document.getElementById('deleteConfirm').style.display="block";
	document.getElementById('deleteConfirm').style.position="absolute";
	document.getElementById('deleteConfirm').style.border="1px solid #000";
	var e = x || window.event;
	//console.log(e);
	document.getElementById('deleteConfirm').style.right=xx-50+"px";
	document.getElementById('deleteConfirm').style.top=y-70+"px";
}

var showNewCourseDialog = function () {
	document.getElementById('add_result').innerText="";
	document.getElementById('newCourseDialog').style.display="block";
	document.getElementById('newCourseDialog').style.position="absolute";
	document.getElementById('newCourseDialog').style.border="1px solid #000";
	document.getElementById('newCourseDialog').style.left=newDialogX+"px";
	document.getElementById('newCourseDialog').style.top=newDialogY+"px";
}

var hideNewCourseDialog = function () {
	document.getElementById('newCourseDialog').style.display="none";
}

var showEditCourseDialog = function (cno) {
	getCourse(cno);
	document.getElementById('edit_result').innerText="";
	document.getElementById('editCourseDialog').style.display="block";
	document.getElementById('editCourseDialog').style.position="absolute";
	document.getElementById('editCourseDialog').style.border="1px solid #000";
	document.getElementById('editCourseDialog').style.left=newDialogX+"px";
	document.getElementById('editCourseDialog').style.top=newDialogY+"px";
}

var hideEditCourseDialog = function () {
	document.getElementById('editCourseDialog').style.display="none";
}

var submitNewCourse = function() {
	addCourse(
		document.getElementById('newCourse_cno').value,
		document.getElementById('newCourse_cname').value,
		document.getElementById('newCourse_ccredit').value,
		document.getElementById('newCourse_cteacher').value
	);
	// if (document.getElementById("add_result").innerText!="添加失败！") hideNewCourseDialog();
	sleep(100);
	query_course();
}

var submitEditCourse = function() {
	editCourse(
		document.getElementById('editCourse_cno').value,
		document.getElementById('editCourse_newCno').value,
		document.getElementById('editCourse_cname').value,
		document.getElementById('editCourse_ccredit').value,
		document.getElementById('editCourse_cteacher').value
	);
	// if (document.getElementById("edit_result").innerText!="修改失败！") hideEditCourseDialog();
	sleep(100);
	query_course();
}

var submitDeleteCourse = function (cno) {
	deleteCourse(cno);
	hideConfirmation();
	sleep(100);
	query_course();
}
</script>
</head>
<body>
<jsp:include page="commonheader.jsp"></jsp:include>
<br>
查询课程：<button id="newCourse" onclick="showNewCourseDialog()">新增课程</button>
课程号　：<input type="text" id="qcourse_cno" style="width: 10%;" />
课程名　：<input type="text" id="qcourse_cname" style="width: 10%;" />
学分　　：<input type="number" id="qcourse_ccredit" step="0.1" style="width: 10%;" />
任课教师：<input type="text" id="qcourse_cteacher" style="width: 10%;" />
<button id="submit" onclick="query_course()">查看</button>
<div id="output"></div>
<div class="deleteConfirm" id="deleteConfirm" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p id="delete_result">确定要删除吗？</p>
	<a href="javascript: void(0);" id="confirmDetele">确认</a>&nbsp;
	<a href="#" onclick="hideConfirmation()">取消</a>
</div>
<div class="newCourseDialog" id="newCourseDialog" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p><h1>新增课程</h1></p>
	<p id="add_result" style="color: red;">&nbsp;</p>
	<p>课程号：<input type="text" id="newCourse_cno"/></p>
	<p>课程名：<input type="text" id="newCourse_cname"/></p>
	<p>学分：<input type="text" id="newCourse_ccredit"/></p>
	<p>任课教师：<input type="text" id="newCourse_cteacher"/></p>
	<button id="submitNewCourse" onclick="submitNewCourse()">确认</button>&nbsp;
	<button onclick="hideNewCourseDialog()">取消</button>
</div>
<div class="editCourseDialog" id="editCourseDialog" style="display: none; background-color: #fff; padding: 10px; text-align: center;">
	<p><h1>编辑课程</h1></p>
	<p id="edit_result" style="color: red;">&nbsp;</p>
	<input type="hidden" id="editCourse_cno"/>
	<p>课程号：<input type="text" id="editCourse_newCno"/></p>
	<p>课程名：<input type="text" id="editCourse_cname"/></p>
	<p>学分：<input type="text" id="editCourse_ccredit"/></p>
	<p>任课教师：<input type="text" id="editCourse_cteacher"/></p>
	<button id="submitEditCourse" onclick="submitEditCourse()">确认</button>&nbsp;
	<button onclick="hideEditCourseDialog()">取消</button>
</div>
</body>
<script src="jquery-3.1.1.js"></script>
<script src="jquery-ui.min.js"></script>
<script src="query.js?ver=14"></script>
<script>
$("#newCourseDialog").draggable();
$("#editCourseDialog").draggable();
</script>
</body>
</html>