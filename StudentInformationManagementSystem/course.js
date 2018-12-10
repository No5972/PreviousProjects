var add_course=function() {
	document.getElementById("a_alert").innerText="";
	$.post("a_course.jsp"+
		"?a_cno="+document.getElementById("a_cno").value+
		"&a_cname="+document.getElementById("a_cname").value+
		"&a_ccredit="+document.getElementById("a_ccredit").value+
		"&a_cteacher="+document.getElementById("a_cteacher").value+
		"&f=0"
		, function(data,status) {
			document.getElementById("a_alert").innerText=data;
		},"");
};


document.getElementById("a_submit").onclick=add_course;