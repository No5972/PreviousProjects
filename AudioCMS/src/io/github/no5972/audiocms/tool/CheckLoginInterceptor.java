package io.github.no5972.audiocms.tool;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckLoginInterceptor extends AbstractInterceptor {

	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		String managerLoginName = (String) request.getSession().getAttribute(Action.LOGIN);
		
		if (managerLoginName!=null) {
			return invocation.invoke();
		} else {
			request.getSession().setAttribute("errMsg", "进入后台前未登录管理员账号，请先登录！");
			return Action.LOGIN;
		}
	}

	
}
