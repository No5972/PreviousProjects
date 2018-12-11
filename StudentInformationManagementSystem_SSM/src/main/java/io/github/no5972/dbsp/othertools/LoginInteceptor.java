package io.github.no5972.dbsp.othertools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInteceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String username =  (String)request.getSession().getAttribute("login_admin"); 
        if(username == null){
        	request.getSession().setAttribute("errMsg", "进入后台前未登录管理员账号，请先登录！");
        	response.sendRedirect("/StudentManagementSystem_SSM/loginPage.php");
        	return false;
        }
		return true;
	}

}
