$.ajaxSetup({
  contentType: "application/x-www-form-urlencoded; charset=utf-8"
});

var query_student=function() {
	document.getElementById("output").innerHTML="";
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
};

var query_course=function() {
	document.getElementById("output").innerHTML="";
	$.post("q_course.jsp"+
		"?q_cno="+document.getElementById("qcourse_cno").value+
		"&q_cname="+document.getElementById("qcourse_cname").value+
		"&q_ccredit="+document.getElementById("qcourse_ccredit").value+
		"&q_cteacher="+document.getElementById("qcourse_cteacher").value+
		"&f=0"
		, function(data,status) {
			document.getElementById("output").innerHTML=data;
		},"");
};


var queries=function() {
	if (document.getElementById("qstudent").checked==true) query_student();
	if (document.getElementById("qcourse").checked==true) query_course();
	if (document.getElementById("qgrade").checked==true) query_grade();
}

document.getElementById("submit").onclick=queries;