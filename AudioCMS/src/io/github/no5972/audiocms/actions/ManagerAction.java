package io.github.no5972.audiocms.actions;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import io.github.no5972.audiocms.dao.ManagerDao;
import io.github.no5972.models.Manager;

public class ManagerAction extends ActionSupport {
	private Manager manager;
	private ManagerDao md=new ManagerDao();
	private String signStr="";
	private String oldPassword;
	private String newpwd;
	private List<Manager> managers;
	public String exit() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute(LOGIN);
		request.getSession().removeAttribute("errMsg");
		ServletActionContext.getResponse().sendRedirect("/AudioCMS");
		return LOGIN;
	}
	public String changePassword() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("errMsg_pass");
		return "updatePwd";
	}
	public String updatePassword() {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (!manager.getPassword().equals(newpwd)) {
			request.getSession().setAttribute("errMsg_pass", "两次输入新密码不一致，请重新输入！");
			return ERROR;
		}
		if (md.validatePassword((String) request.getSession().getAttribute(LOGIN), oldPassword)) {
			md.updatePassword(manager);
			((Manager)request.getSession().getAttribute("login_account_of_pwdc")).setPassword(manager.getPassword());
			return "showLogin";
		} else {
			request.getSession().setAttribute("errMsg_pass", "原密码错误，请重新输入！");
			return ERROR; 
		}
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public String getSignStr() {
		return signStr;
	}
	public void setSignStr(String signStr) {
		this.signStr = signStr;
	}
	public List<Manager> getManagers() {
		return managers;
	}
	public void setManagers(List<Manager> managers) {
		this.managers = managers;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
}
