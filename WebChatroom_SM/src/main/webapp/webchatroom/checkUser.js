/**
 * 
 */
function login() {
	var result = document.getElementById("name").value;
	$.post("login?name="+result, function(data,status) {
		if (data.success != 0) {
			document.getElementById("prompt").innerText=data.msg;
		}
		else {
			window.location.href="chatroom.html";
		}
	});
}