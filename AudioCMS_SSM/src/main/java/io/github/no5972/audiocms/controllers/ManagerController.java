package io.github.no5972.audiocms.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import io.github.no5972.audiocms.models.Manager;
import io.github.no5972.audiocms.services.ManagerService;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/loginSubmit.php")
	public String login(@ModelAttribute("SpringWeb")Manager manager, ModelMap model) {
		System.out.println(manager.getAccount() + manager.getPassword());
		Manager ifValid = managerService.checkLogin(manager.getAccount(), manager.getPassword());
		if (ifValid == null) {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			request.getSession().setAttribute("errMsg", "用户名或密码不正确，请重新输入！");
			return "login";
		} else {
//			md.addManagerNumber(manager.getId());
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			request.getSession().setAttribute("login_account", manager.getAccount());
			request.getSession().setAttribute("login_account_of_pwdc", manager);
			request.removeAttribute("errMsg");
			managerService.addLoginCount(ifValid.getId());
			return "redirect_to_main";
		}
	}
	@RequestMapping("/manage_main.php")
	public String manage_main() {
		return "manage_main";
	}
	@RequestMapping("/manage_exit.php")
	public String logout() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute("login_account");
		request.getSession().removeAttribute("errMsg");
//		ServletActionContext.getResponse().sendRedirect("/AudioCMS");
		return "redirect_to_login";
	}
	@RequestMapping("/login.php") 
	public String redirectToLogout() {
		return "login";
	}
/* 拦截器跳转
 *                     String username =  (String)request.getSession().getAttribute("user"); 
                    if(username == null){
                            log.info("Interceptor：跳转到login页面！");
                            request.getRequestDispatcher("/page/index.jsp").forward(request, response);
 * */
	@RequestMapping("/manage_changepasswordinput.php")
	public String changePasswordInput(ModelMap model) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		model.addAttribute("manager_id", managerService.getManagerId((String) request.getSession().getAttribute("login_account")));
		return "manage_changepasswordinput";
	}
	
	@RequestMapping("/manage_changepassword.php")
	public String changePassword(Integer id, String oldPassword, String newPassword, String confirmPassword, ModelMap model) {
		if (!newPassword.equals(confirmPassword)) {
			model.addAttribute("errMsg_pass", "两次输入新密码不一致，请重新输入！");
			return changePasswordInput(model);
		}
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		Manager ifValid = managerService.checkLogin((String) request.getSession().getAttribute("login_account"), oldPassword);
		if (ifValid==null) {
			model.addAttribute("errMsg_pass", "原密码错误，请重新输入！");
			return changePasswordInput(model);
		}
		// 防止篡改表单
		System.out.println(managerService.getManagerAccount(id));
		System.out.println(request.getSession().getAttribute("login_account"));
		if (!managerService.getManagerAccount(id).equals(request.getSession().getAttribute("login_account"))) {
			model.addAttribute("errMsg_pass", "修改密码的用户不正确，请重新输入！");
			return changePasswordInput(model);
		}
		managerService.changePassword(id, newPassword);
		return "manage_main";
	}
}
