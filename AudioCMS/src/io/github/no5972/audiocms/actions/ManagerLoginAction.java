package io.github.no5972.audiocms.actions;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import io.github.no5972.audiocms.dao.ManagerDao;
import io.github.no5972.models.Manager;


public class ManagerLoginAction extends ActionSupport {
	private Manager manager;
	private ManagerDao md=new ManagerDao();
	private String signStr="";
	private List<Manager> managers;
	public String login() {
		manager = md.getLogin(manager.getAccount(), manager.getPassword());
		
		if (manager==null) {
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().setAttribute("errMsg", "用户名或密码不正确，请重新输入！");
			return INPUT;
		} else {
			md.addManagerNumber(manager.getId());
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().setAttribute(LOGIN, manager.getAccount());
			request.getSession().setAttribute("login_account_of_pwdc", manager);
			return "main";
		}
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public ManagerDao getMd() {
		return md;
	}
	public void setMd(ManagerDao md) {
		this.md = md;
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
}
