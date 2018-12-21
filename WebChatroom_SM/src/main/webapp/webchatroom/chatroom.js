var read=[];

Date.prototype.Format = function (fmt) { //author: meizz
	var o = {
		"M+": this.getMonth() + 1, //月份
		"d+": this.getDate(), //日
		"h+": this.getHours(), //小时
		"m+": this.getMinutes(), //分
		"s+": this.getSeconds(), //秒
		"q+": Math.floor((this.getMonth() + 3) / 3), //季度
		"S": this.getMilliseconds() //毫秒
	};
	if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
	if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}


function refresh() {
	//$('#msgs').load('refresh.jsp');
	var messageList;
	$.ajax({
		type: "post",
		url: "getNewMessages",
		data: {
			begin: begin1
		},
		success: function (data) {
			$('#msgs').html("<font style=\"font-size: 14px;\">欢迎光临聊天室，请遵守聊天室规则，不要使用不文明用语。");
			messageList = data;
			for (var p in messageList) {
				if (messageList[p].target == document.getElementById("myname").innerText && read.indexOf(messageList[p].id)==-1) {
					read.push(messageList[p].id);
					document.getElementById("alert").play();
				}
				if (messageList[p].issystem == 1) {
					$('#msgs').html($('#msgs').html()+"<br>系统公告："
							+messageList[p].author+"走进了聊天室！（"
							+new Date(messageList[p].date).Format("yyyy-MM-dd hh:mm:ss")+"）");
				} else {
					if (messageList[p].targetid!=-1) 
						if (messageList[p].target == document.getElementById("myname").innerText) {
							$('#msgs').html($('#msgs').html()
									+"<br><span style=\"background: #f00;\">"+messageList[p].author+messageList[p].emotion+"对"+messageList[p].target
									+"说：<span style=\"color:#"+messageList[p].color+"\">"
									+messageList[p].content+"</span>（"
									+new Date(messageList[p].date).Format("yyyy-MM-dd hh:mm:ss")+"）</span>");
						} else {
							$('#msgs').html($('#msgs').html()
								+"<br>"+messageList[p].author+messageList[p].emotion+"对"+messageList[p].target
								+"说：<span style=\"color:#"+messageList[p].color+"\">"
								+messageList[p].content+"</span>（"
								+new Date(messageList[p].date).Format("yyyy-MM-dd hh:mm:ss")+"）");
						}
					else 
						$('#msgs').html($('#msgs').html()
								+"<br>"+messageList[p].author+messageList[p].emotion
								+"对所有人说：<span style=\"color:#"
								+messageList[p].color+"\">"
								+messageList[p].content+"</span>（"
								+new Date(messageList[p].date).Format("yyyy-MM-dd hh:mm:ss")+"）");
				}
			}
			$('#msgs').html($('#msgs').html()+"</font>");
		}
	});
}

function refreshList() {
	//$('#userlist').load('onlineUser.jsp');
	var userList;
	$('#userlist').html("<center><b>欢迎进入聊天室！</b></br><a class=\"targetlink\" onclick=\"document.getElementById(\'target\').value='';document.getElementById('content').focus();\">所有人</a><br/>");
	$.ajax({
		type: "post",
		url: "getOnlineUsers",
		success: function (data) {
			userList = data;
			for(var p in userList){//遍历json数组时，这么写p为索引，0,1
				$('#userlist').html($('#userlist').html()+"<a class=\"targetlink\" onclick=\"selectTarget("+userList[p].id+");document.getElementById('content').focus();\">"+userList[p].name+"</a><br>");
			}
			$('#userlist').html($('#userlist').html()+"当前在线[<span style=\"color: #f00;\">"+userList.length+"</span>]人</center>");
		}
	});
	
}

function refreshList2() {
	//$('#userlist').load('onlineUser.jsp');
	var userList;
	setInterval("refreshList2()",60000);
	$('#targetId').html("<option value=\"-1\">所有人</option>");
	$.ajax({
		type: "post",
		url: "getOnlineUsers",
		success: function (data) {
			userList = data;
			for(var p in userList){//遍历json数组时，这么写p为索引，0,1
				$('#targetId').html($('#targetId').html()+"<option value=\""+userList[p].id+"\">"+userList[p].name+"</option>");
			}
		}
	});
	
}

function getUserId (name) {
	$.ajax({
		type: "post",
		url: "getUserId",
		data: name,
		success: function (data) {
			document.getElementById("userid").value=data.msg;
		}
	});
}

function getCurrentUserName() {
	$.ajax({
		type: "post",
		url: "getCurrentUserName",
		success: function (data) {
			if (data.success!=0) {
				window.location.href="index.html";
				return;
			}
			document.getElementById("myname").innerText=data.msg;
			document.title=data.msg+" - JSP+AJAX聊天室 BY wujiuqier";
			getUserId(data.msg);
		}
	});
}

function submit1() {
//	$.post("speak"
//		, function(data,status) {
//			refresh();
//		},"");
//	alert("simulate submit");
	$.ajax({
		type: "post",
		url: "speak",
		data: {
			id: document.getElementById("userid").value,
			emotion: document.getElementById("emotion").value,
			targetId: document.getElementById("targetId").value,
			color: document.getElementById("color").value.toString().substring(1,7),
			content: document.getElementById("content").value 
		},
		success: function (data) {
			//
			refresh();
		}
	});
}

function logout() {
	$.ajax({
		type: "post",
		url: "logout",
		success: function (data) {
			window.location.href="index.html";
		}
	});
}

function selectTarget(targetId) {
	var select = document.getElementById('targetId');
	for (var i = 0; i < select.options.length; i++){  
	    if (select.options[i].value == targetId ){  
	        select.options[i].selected = true;  
	        break;  
	    }  
	}
}

var begin1 = new Date().Format("yyyy-MM-dd hh:mm:ss");
setInterval("refresh()",2000);
setInterval("refreshList()",2000);
setTimeout("refreshList2()",2000);
getCurrentUserName();
