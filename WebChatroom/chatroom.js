function refresh() {
	$('#msgs').load('refresh.jsp');
}

function refreshList() {
	$('#userlist').load('onlineUser.jsp');
}
	

function submit1() {
	$.post("submit.jsp"+
		"?myname="+document.getElementById("content").value+ //contents
		"&emotion="+document.getElementById("emotion").value+
		"&target="+document.getElementById("target").value+
		"&color="+document.getElementById("color").value.toString().substring(1,7)+
		"&thename="+document.getElementById("myname").innerText+ //myname
		"&f=0"
		, function(data,status) {
			refresh();
		},"");
}

function notice() {
	$.post("loginNotice.jsp"+"?thename="+document.getElementById("myname").innerText
		, function(data,status) {
			refresh();
		},"");
}

setInterval("refresh()",2000);
setInterval("refreshList()",2000);
notice();
document.getElementById("submit").onclick=function() {submit1()};