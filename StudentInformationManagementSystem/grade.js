var add_grade=function() {
	document.getElementById("a_alert").innerText="";
	$.post("a_grade.jsp"+
		"?a_sno="+document.getElementById("a_sno").value+
		"&a_cno="+document.getElementById("select_courses").getElementsByTagName("select")[0].value+
		"&a_grade="+document.getElementById("a_grade").value+
		"&f=0"
		, function(data,status) {
			document.getElementById("a_alert").innerText=data;
		},"");
};

var get_courses=function() {
	$.post("getcourses.jsp" , function(data,status) {
			document.getElementById("select_courses").innerHTML=data;
			document.getElementById("select_courses_d").innerHTML=data;
			document.getElementById("select_courses_c").innerHTML=data;
		},"");
}

window.onload=get_courses;
document.getElementById("a_submit").onclick=add_grade;