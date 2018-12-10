$.ajaxSetup({
  contentType: "application/x-www-form-urlencoded; charset=utf-8"
});

var arrayToTable = function (newarray) {
	var tbody = "";
	var head = "";
	for (var i = 0; i < newarray.length; i++) {
		if (head == "") {
			if (newarray[i].cno!=undefined && newarray[i].sno==undefined) {
				head += "<th>" + "课程编号" + "</th>";
				head += "<th>" + "课程名称" + "</th>";
				head += "<th>" + "学分" + "</th>";
				head += "<th>" + "代课教师" + "</th>";
				head += "<th>" + "操作" + "</th>";
				head = "<tr>" + head + "</tr>";
			}
			if (newarray[i].sno!=undefined && newarray[i].cno==undefined) {
				head += "<th>" + "学号" + "</th>";
				head += "<th>" + "姓名" + "</th>";
				head += "<th>" + "性别" + "</th>";
				head += "<th>" + "出生日期" + "</th>";
				head += "<th>" + "班级" + "</th>";
				head += "<th>" + "院系" + "</th>";
				head += "<th>" + "操作" + "</th>";
				head = "<tr>" + head + "</tr>";
			}
			if (newarray[i].sno!=undefined && newarray[i].cno!=undefined) {
				head += "<th>" + "学号" + "</th>";
				head += "<th>" + "课程号" + "</th>";
				head += "<th>" + "姓名" + "</th>";
				head += "<th>" + "课程名" + "</th>";
				head += "<th>" + "成绩" + "</th>";
				head += "<th>" + "操作" + "</th>";
				head = "<tr>" + head + "</tr>";
			}
		}
		var tds = "";
		for ( var key in newarray[i]) {
			tds += "<td>" + newarray[i][key] + "</td>";
		}
		if (newarray[i].cno!=undefined && newarray[i].sno==undefined) {
			tds += "<td style='text-align: center;'><a href=\"#\" onclick=\"showEditCourseDialog("+ newarray[i].cno + ")\">编辑</a>"
				+ "&nbsp;<a href=\"#\" onclick = \"showConfirmation(" + newarray[i].cno + ")\">删除</a>";
		}
		if (newarray[i].sno!=undefined && newarray[i].cno==undefined) {
			tds += "<td style='text-align: center;'><a href=\"#\" onclick=\"showEditStudentDialog("+ newarray[i].sno + ")\">编辑</a>"
				+ "&nbsp;<a href=\"#\" onclick = \"showConfirmation(" + newarray[i].sno + ")\">删除</a>";
		}
		if (newarray[i].sno!=undefined && newarray[i].cno!=undefined) {
			tds += "<td style='text-align: center;'><a href=\"#\" onclick=\"showEditGradeDialog("+ newarray[i].sno + ","+ newarray[i].cno + ")\">编辑</a>"
				+ "&nbsp;<a href=\"#\" onclick = \"showConfirmation(" + newarray[i].sno+ "," + newarray[i].cno + ")\">删除</a>";
		}
		tbody += "<tr>" + tds + "</tr>"
	}
	return "<table>" + head + tbody + "</table>";
}

var query_student=function() {
	document.getElementById("output").innerHTML="正在查询…";
	/*
	$.post("q_student.jsp"+
		"?q_sno="+document.getElementById("qstudent_sno").value+
		"&q_sname="+document.getElementById("qstudent_sname").value+
		"&q_sbirth="+document.getElementById("qstudent_sbirth").value+
		"&q_ssex="+document.getElementById("qstudent_ssex").value+
		"&q_sclass="+document.getElementById("qstudent_sclass").value+
		"&q_sdept="+document.getElementById("qstudent_sdept").value+
		"&f=0"
		, function(data,status) {
			document.getElementById("output").innerHTML=data;
		},"");
	*/
	$.ajax({
		type:"POST",
		url:"q_student.php",
		data:
		{
			q_sno : document.getElementById("qstudent_sno").value ,
			q_sname : document.getElementById("qstudent_sname").value,
			q_sbirth : document.getElementById("qstudent_sbirth").value,
			q_ssex : document.getElementById("qstudent_ssex").value,
			q_sclass : document.getElementById("qstudent_sclass").value,
			q_sdept : document.getElementById("qstudent_sdept").value
		}, 
		success:function(data,status) {
			document.getElementById("output").innerHTML=arrayToTable(data);
		}
	});
};

var getStudent = function(sno) {
	document.getElementById("edit_result").innerHTML="正在查询…";
	document.getElementById("editStudent_sno").value="";
	document.getElementById("editStudent_sname").value="";
	document.getElementById("editStudent_ssex").value="";
	document.getElementById("editStudent_sbirth").value="";
	document.getElementById("editStudent_sclass").value="";
	document.getElementById("editStudent_sdept").value="";
	$.ajax({
		type:"POST",
		url:"get_student.php",
		data:
		{
			q_sno : sno
		}, 
		success:function(data,status) {
			document.getElementById("edit_result").innerHTML="&nbsp;";
			document.getElementById("editStudent_sno").innerText=data.sno;
			document.getElementById("editStudent_sname").value=data.sname;
			document.getElementById("editStudent_ssex").value=data.ssex;
			document.getElementById("editStudent_sbirth").value=data.sbirth;
			document.getElementById("editStudent_sclass").value=data.sclass;
			document.getElementById("editStudent_sdept").value=data.sdept;
		}	
	});
};

var addStudent = function (sno, sname, ssex, sbirth, sclass, sdept) {
	document.getElementById("add_result").innerHTML="正在添加…";
	$.ajax({
		type:"POST",
		url:"add_student.php",
		data:
		{
			a_sno : sno,
			a_sname : sname,
			a_ssex : ssex,
			a_sbirth : sbirth,
			a_sclass : sclass,
			a_sdept : sdept
		}, 
		success:function(data,status) {
			document.getElementById("add_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideNewStudentDialog();
			else document.getElementById("add_result").innerHTML="添加失败！";
			console.log(data);
		}	
	});
};

var editStudent = function(sno, sname, ssex, sbirth, sclass, sdept) {
	document.getElementById("add_result").innerHTML="正在添加…";
	$.ajax({
		type:"POST",
		url:"edit_student.php",
		data:
		{
			sno : sno,
			sname : sname,
			ssex : ssex,
			sbirth : sbirth,
			sclass : sclass,
			sdept : sdept
		}, 
		success:function(data,status) {
			document.getElementById("edit_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideEditStudentDialog();
			else document.getElementById("edit_result").innerHTML="修改失败！";
			console.log(data);
		}	
	});
};

var deleteStudent = function(sno) {
	document.getElementById("add_result").innerHTML="正在添加…";
	$.ajax({
		type:"POST",
		url:"delete_student.php",
		data:
		{
			sno : sno
		}, 
		success:function(data,status) {
			document.getElementById("delete_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideConfirmation();
			else document.getElementById("delete_result").innerHTML="删除失败！";
			console.log(data);
		}	
	});
};

var query_course=function() {
	document.getElementById("output").innerHTML="正在查询…";
	$.ajax({
		type:"POST",
		url:"q_course.php",
		data:
		{
			q_cno : document.getElementById("qcourse_cno").value ,
			q_cname : document.getElementById("qcourse_cname").value,
			q_ccredit : document.getElementById("qcourse_ccredit").value,
			q_cteacher : document.getElementById("qcourse_cteacher").value
		}, 
		success:function(data,status) {
			document.getElementById("output").innerHTML=arrayToTable(data);
		}	
	});
};



var getCourse = function(cno) {
	document.getElementById("edit_result").innerHTML="正在查询…";
	document.getElementById("editCourse_cname").value="";
	document.getElementById("editCourse_ccredit").value="";
	document.getElementById("editCourse_cteacher").value="";
	$.ajax({
		type:"POST",
		url:"get_course.php",
		data:
		{
			q_cno : cno
		}, 
		success:function(data,status) {
			document.getElementById("edit_result").innerHTML="&nbsp;";
			document.getElementById("editCourse_cno").value=data.cno;
			document.getElementById("editCourse_newCno").value=data.cno;
			document.getElementById("editCourse_cname").value=data.cname;
			document.getElementById("editCourse_ccredit").value=data.ccredit;
			document.getElementById("editCourse_cteacher").value=data.cteacher;
		}	
	});
};

var addCourse = function(cno, cname, ccredit, cteacher) {
	document.getElementById("add_result").innerHTML="正在添加…";
	$.ajax({
		type:"POST",
		url:"add_course.php",
		data:
		{
			a_cno : cno,
			a_cname : cname,
			a_ccredit : ccredit,
			a_cteacher : cteacher
		}, 
		success:function(data,status) {
			document.getElementById("add_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideNewCourseDialog();
			else document.getElementById("add_result").innerHTML="添加失败！";
			console.log(data);
		}	
	});
};

var editCourse = function (cno, newCno, cname, ccredit, cteacher) {
	document.getElementById("edit_result").innerHTML="正在操作…";
	$.ajax({
		type:"POST",
		url:"edit_course.php",
		data:
		{
			cno : cno,
			newCno: newCno,
			cname : cname,
			ccredit : ccredit,
			cteacher : cteacher
		}, 
		success:function(data,status) {
			document.getElementById("edit_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideEditCourseDialog();
			else document.getElementById("edit_result").innerHTML="修改失败！";
			
			console.log(data);
		}	
	});
}

var deleteCourse = function (cno) {
	$.ajax({
		type:"POST",
		url:"delete_course.php",
		data:
		{
			cno : cno
		}, 
		success:function(data,status) {
			document.getElementById("delete_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideConfirmation();
			else document.getElementById("delete_result").innerHTML="删除失败！";
			console.log(data);
		}	
	});
}

var query_grade = function() {
	document.getElementById("output").innerHTML="正在查询…";
	$.ajax({
		type:"POST",
		url:"q_grade.php",
		data:
		{
			q_sname : document.getElementById("qgrade_sname").value ,
			q_cname : document.getElementById("qgrade_cname").value,
			q_low : document.getElementById("qgrade_low").value,
			q_high : document.getElementById("qgrade_high").value
		}, 
		success:function(data,status) {
			document.getElementById("output").innerHTML=arrayToTable(data);
		}
	});
};

var getGrade = function(sno, cno) {
	document.getElementById("edit_result").innerHTML="正在查询…";
	document.getElementById("editGrade_sno").innerText="";
	document.getElementById("editGrade_sname").innerText="";
	document.getElementById("editGrade_cno").innerText="";
	document.getElementById("editGrade_cname").innerText="";
	document.getElementById("editGrade_grade").value="";
	$.ajax({
		type:"POST",
		url:"get_course.php",
		data:
		{
			q_cno : cno
		}, 
		success:function(data,status) {
			document.getElementById("editGrade_cno").innerText=data.cno;
			document.getElementById("editGrade_cname").innerText=data.cname;
		}	
	});
	$.ajax({
		type:"POST",
		url:"get_student.php",
		data:
		{
			q_sno : sno
		}, 
		success:function(data,status) {
			document.getElementById("editGrade_sno").innerText=data.sno;
			document.getElementById("editGrade_sname").innerText=data.sname;
		}	
	});
	$.ajax({
		type:"POST",
		url:"get_grade.php",
		data:
		{
			q_sno : sno,
			q_cno : cno
		}, 
		success:function(data,status) {
			document.getElementById("edit_result").innerHTML="&nbsp;";
			document.getElementById("editGrade_grade").value=data.grade;
		}	
	});
};

var getStudent_edit = function(sno) {
	document.getElementById("newGrade_sname").innerHTML="正在查询…";
	$.ajax({
		type:"POST",
		url:"get_student.php",
		data:
		{
			q_sno : sno
		}, 
		success:function(data,status) {
			document.getElementById("newGrade_sname").innerText=data.sname;
		}	
	});
};

var getCourse_edit = function(cno) {
	document.getElementById("newGrade_cname").innerHTML="正在查询…";
	$.ajax({
		type:"POST",
		url:"get_course.php",
		data:
		{
			q_cno : cno
		}, 
		success:function(data,status) {
			document.getElementById("newGrade_cname").innerText=data.cname;
		}	
	});
};

var editGrade = function(sno, cno, grade) {
	document.getElementById("edit_result").innerHTML="正在操作…";
	$.ajax({
		type:"POST",
		url:"edit_grade.php",
		data:
		{
			sno : sno,
			cno : cno,
			grade : grade
		}, 
		success:function(data,status) {
			document.getElementById("edit_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideEditGradeDialog();
			else document.getElementById("edit_result").innerHTML="修改失败！";
			
			console.log(data);
		}	
	});
};

var addGrade = function(sno, cno, grade) {
	document.getElementById("add_result").innerHTML="正在添加…";
	$.ajax({
		type:"POST",
		url:"add_grade.php",
		data:
		{
			a_sno : sno,
			a_cno : cno,
			a_grade : grade
		}, 
		success:function(data,status) {
			document.getElementById("add_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideNewGradeDialog();
			else document.getElementById("add_result").innerHTML="添加失败！";
			console.log(data);
		}	
	});
};

var deleteGrade = function (sno, cno) {
	$.ajax({
		type:"POST",
		url:"delete_grade.php",
		data:
		{
			sno : sno,
			cno : cno
		}, 
		success:function(data,status) {
			document.getElementById("delete_result").innerHTML="&nbsp;";
			if (data.isSuccess!=-1) hideConfirmation();
			else document.getElementById("delete_result").innerHTML="删除失败！";
			console.log(data);
		}	
	});
}

var queries=function() {
	if (document.getElementById("qstudent").checked==true) query_student();
	if (document.getElementById("qcourse").checked==true) query_course();
	if (document.getElementById("qgrade").checked==true) query_grade();
}

// document.getElementById("submit").onclick=queries;