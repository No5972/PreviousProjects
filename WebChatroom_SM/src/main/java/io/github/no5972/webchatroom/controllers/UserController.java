package io.github.no5972.webchatroom.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import io.github.no5972.webchatroom.models.OperationResult;
import io.github.no5972.webchatroom.models.User;
import io.github.no5972.webchatroom.services.UserService;

@RestController
@RequestMapping("/webchatroom")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public @ResponseBody OperationResult login(String name) {
		OperationResult result = OperationResult.getInstance();
		if (name==null) {
			result.setSuccess(-1);
			result.setMsg("用户名不能为空");
			return result;
		}
		if (!userService.login(name)) {
			result.setSuccess(-2);
			result.setMsg("用户名已存在，请尝试其他用户名");
			return result;
		}
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().setAttribute("username", name);
		request.getSession().setAttribute("userid", userService.getUserId(name).getId());
		return result;
	}
	
	@RequestMapping("/checkLogin")
	public @ResponseBody OperationResult checkLogin() {
		OperationResult result = OperationResult.getInstance();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		if (request.getSession().getAttribute("username")==null) {
			result.setSuccess(-1);
			result.setMsg("用户未登录");
		}
		return result;
	}
	
	@RequestMapping("/getCurrentUserName")
	public @ResponseBody OperationResult getCurrentUserName() {
		OperationResult result = OperationResult.getInstance();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		if (request.getSession().getAttribute("username")==null) {
			result.setSuccess(-1);
			result.setMsg("用户未登录");
			return result;
		}
		result.setMsg((String) request.getSession().getAttribute("username"));
		return result;
	}
	
	@RequestMapping("/getUserId")
	public @ResponseBody OperationResult getUserId(String name) {
		OperationResult result = OperationResult.getInstance();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		if (request.getSession().getAttribute("username")==null) {
			result.setSuccess(-1);
			result.setMsg("用户未登录");
			return result;
		}
		//result.setMsg(String.valueOf(userService.getUserId(name).getId()));
		result.setMsg(String.valueOf(request.getSession().getAttribute("userid")));
		return result;
	}
	
	@RequestMapping("/logout")
	public @ResponseBody OperationResult logout() {
		OperationResult result = OperationResult.getInstance();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		if (request.getSession().getAttribute("username")==null) {
			result.setSuccess(-1);
			result.setMsg("登录状态超时已失效");
			return result;
		}
		userService.logout((int) request.getSession().getAttribute("userid"));
		request.getSession().removeAttribute("username");
		request.getSession().removeAttribute("userid");
		return result;
	}
	
	@RequestMapping("/getOnlineUsers")
	public @ResponseBody List<User> getOnlineUsers() {
		return userService.getAllUsers();
	}
}
