var add_student=function() {
	document.getElementById("a_alert").innerText="";
	$.post("a_student.jsp"+
		"?a_sno="+document.getElementById("a_sno").value+
		"&a_sname="+document.getElementById("a_sname").value+
		"&a_sbirth="+document.getElementById("a_sbirth").value+
		"&a_ssex="+document.getElementById("a_ssex").value+
		"&a_sclass="+document.getElementById("a_sclass").value+
		"&a_ssdept="+document.getElementById("a_sdept").value+
		"&f=0"
		, function(data,status) {
			document.getElementById("a_alert").innerText=data;
		},"");
};


document.getElementById("a_submit").onclick=add_student;