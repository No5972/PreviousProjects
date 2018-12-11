package io.github.no5972.dbsp.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import io.github.no5972.dbsp.models.Admin;
import io.github.no5972.dbsp.models.OperationResult;
import io.github.no5972.dbsp.services.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/loginPage.php")
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping("/login.php")
	public String login(String username, String password, ModelMap model) {
		Admin ifValid = adminService.getLogin(username, password);
		if (ifValid!=null) {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			request.getSession().setAttribute("login_admin", ifValid.getUsername());
			request.removeAttribute("errMsg");
			return "redirect_to_main";
		} else {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			request.getSession().setAttribute("errMsg", "用户名或密码不正确，请重新输入！");
			return "login";
		}
	}
	
	@RequestMapping("/manage_changePassword.php")
	public String updatePasswordInput(ModelMap model) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		model.addAttribute("username", request.getSession().getAttribute("login_admin"));
		return "password";
	}
	
	@RequestMapping("/updatePassword.php")
	public @ResponseBody OperationResult updatePassword(String username, String oldPwd, String newPwd) {
		OperationResult result = new OperationResult();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		if (!username.equals(request.getSession().getAttribute("login_admin"))) {
			result.setIsSuccess(-1);
			result.setErrText("Error: Not current user");
			return result;
		}
		Admin ifValid = adminService.getLogin(username, oldPwd);
		if (ifValid==null) {
			result.setIsSuccess(-2);
			result.setErrText("Error: Old password wrong");
			return result;
		}
		try {
			adminService.changePassword(username, newPwd);
			result.setIsSuccess(0);
			result.setErrText("success");
			return result; 
		} catch (Exception e) {
			result.setIsSuccess(-3);
			result.setErrText(e.getMessage());
			e.printStackTrace();
			return result; 
		}
	}
	
	@RequestMapping("/manage_main.php")
	public String manageMain() {
		return "main";
	}
	
	@RequestMapping("/manage_exit.php")
	public String manageExit() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute("login_admin");
		return "redirect_to_login";
	}
}
