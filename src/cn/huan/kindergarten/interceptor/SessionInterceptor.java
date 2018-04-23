package cn.huan.kindergarten.interceptor;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.huan.HTed.core.IRequest;

public class SessionInterceptor extends HandlerInterceptorAdapter{
	 @Override
	    public boolean preHandle(HttpServletRequest request,
	            HttpServletResponse response, Object handler) throws Exception {

		 	HttpSession session = request.getSession();
		    if (session.getAttribute(IRequest.FIELD_USER_ID) != null) {
		        return true;
		    }
		    // 如果是ajax请求，请求头会有x-requested-with
		    String requestWith = request.getHeader("x-requested-with");
		    if (requestWith != null && requestWith.equalsIgnoreCase("XMLHttpRequest")){
		        ServletOutputStream out = response.getOutputStream();
		        out.print("unlogin");//返回给前端页面的未登陆标识
		        out.flush();
		        out.close();
		    } else {
		    	String contextName =  request.getContextPath();
		        response.sendRedirect(contextName+"/admin/login");
		    }
		    return false;
	    }
}
