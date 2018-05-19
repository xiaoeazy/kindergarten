package cn.huan.kindergarten.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.Md5Crypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.account.bean.UserAndRoleContext;
import com.huan.HTed.account.dto.Role;
import com.huan.HTed.account.dto.User;
import com.huan.HTed.account.dto.UserRole;
import com.huan.HTed.account.service.IRoleService;
import com.huan.HTed.account.service.IUserService;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.impl.RequestHelper;
import com.huan.HTed.system.controllers.BaseController;

import cn.huan.kindergarten.bean.ExtAjax;

@Controller
public class AdminController extends BaseController {
	
	// 默认的登录页
    public static final String VIEW_LOGIN = "/admin/login";
 // 默认的登录页
    private static final String VIEW_MAIN = "/admin/main";
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;

	@RequestMapping(value = "/admin/login")
	@ResponseBody
	public ModelAndView login(User dto, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(false);
		// 有session 则不再登录
		if (session != null && session.getAttribute(User.FIELD_USER_ID) != null) {
			ModelAndView mv = indexView(request, response);
			return mv;
		}
		
		ModelAndView view = new ModelAndView(getViewPath() + VIEW_MAIN);
		IRequest requestContext = createRequestContext(request);
		if(dto.getPasswordEncrypted()!=null)
			dto.setPasswordEncrypted( DigestUtils.md5Hex(dto.getPasswordEncrypted()));
		User user = userService.selectOne(requestContext, dto);
		if (user == null) {
			view.setViewName(VIEW_LOGIN);
			if(dto.getUserName()!=null)
				view.addObject("message", "用户名或密码错误！");
		} else {
			session = request.getSession();
			session.setAttribute(IRequest.FIELD_USER_ID, user.getUserId());
			session.setAttribute("userRealName", user.getRealName());
			setRoleInfo(request, session, user);
		}
		return view;
	}

	private ModelAndView indexView(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			// 获取user
			Long userId = (Long) session.getAttribute(User.FIELD_USER_ID);
			if (userId != null) {
					
			} else {
				return new ModelAndView(REDIRECT + VIEW_LOGIN);
			}
		}

//		String sysTitle = sysConfigManager.getSysTitle();
		ModelAndView mav = new ModelAndView(REDIRECT + VIEW_MAIN);
//		mav.addObject("SYS_TITLE", sysTitle);
		return mav;
	}
	
	@RequestMapping(value = "/admin/main")
	@ResponseBody
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView(getViewPath() + VIEW_MAIN);
		return view;
	}

	private void setRoleInfo(HttpServletRequest request, HttpSession session, User user) {
		UserRole ur = new UserRole();
		ur.setUserId(user.getUserId());
		List<Role> roles = roleService.adminQueryHave(RequestHelper.createServiceRequest(request), ur);
		if (roles.isEmpty()) {
			request.setAttribute("code", "NO_ROLE");
			throw new RuntimeException(new Exception("该用户不存在角色"));
		}
		List<Long> roleIds = new ArrayList<Long>();
		for (Role role : roles) {
			roleIds.add(role.getRoleId());
		}
		Long[] ids = roleIds.toArray(new Long[roleIds.size()]);

		session.setAttribute(IRequest.FIELD_ALL_ROLE_ID, ids);
		session.setAttribute(IRequest.FIELD_ROLE_ID, roles.get(0).getRoleId());
	}
	
	@RequestMapping(value = "/admin/logout")
	@ResponseBody
	public ModelAndView loginout(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(false);
		if(session!=null)
			session.invalidate();
		ModelAndView view = new ModelAndView(getViewPath() + VIEW_LOGIN);
		return view;
	}
	
	
    @RequestMapping(value = "/admin/updateCurrentUser")
    @ResponseBody
	public ExtAjax updateCurrentUser(User dto ,  BindingResult result, HttpServletRequest request){
    	 IRequest requestCtx = createRequestContext(request);
    	 String message = "";
		 if(dto.getPasswordEncrypted()!=null) {
			 String passwordEncrypted = DigestUtils.md5Hex(dto.getPasswordEncrypted());
			 dto.setPasswordEncrypted(passwordEncrypted);
			 User user = userService.selectOne(requestCtx, dto);
			 if(user!=null) {
				 String newPasswordEncrypted = DigestUtils.md5Hex(dto.getNewPasswordEncrypted());
				 dto.setPasswordEncrypted(newPasswordEncrypted);
				 userService.updateByPrimaryKey(requestCtx, user);
			 }else {
				 message = "原密码不正确";
			 }
		 }
         return new ExtAjax(false, message);
    }
	


}