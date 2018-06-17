package cn.huan.kindergarten.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.account.dto.Role;
import com.huan.HTed.account.dto.User;
import com.huan.HTed.account.dto.UserRole;
import com.huan.HTed.account.service.IRoleService;
import com.huan.HTed.account.service.IUserService;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.impl.RequestHelper;

import cn.huan.kindergarten.dto.KgAssessmentActivity;
import cn.huan.kindergarten.dto.KgCarousel;
import cn.huan.kindergarten.dto.KgDownload;
import cn.huan.kindergarten.dto.KgIntroduction;
import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.service.IKgAssessmentActivityService;
import cn.huan.kindergarten.service.IKgCarouselService;
import cn.huan.kindergarten.service.IKgDownloadService;
import cn.huan.kindergarten.service.IKgNewsService;
import cn.huan.kindergarten.utils.CommonUtil;

@Controller
public class IndexController extends IndexBaseController{
	
	
	@Autowired
	private IKgDownloadService iKgDownloadService;
	@Autowired
	private IKgCarouselService iKgCarouselService;
	@Autowired
	private IKgNewsService iKgNewsService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IKgAssessmentActivityService iKgAssessmentActivityService;
	
	@RequestMapping(value = "/")
    @ResponseBody
    public ModelAndView index(HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/index");
    	 IRequest requestContext = createRequestContext(request);
    	 KgIntroduction ki = new KgIntroduction();
    	 ki.setId(1l);
    	 
    	 KgCarousel kc = new KgCarousel();
    	 kc.setSortorder("desc");
    	 kc.setSortname("sequence");
    	 List<KgDownload> downloadList = iKgDownloadService.select(requestContext, null, 1, 4);
    	 List<KgCarousel> carouselList =iKgCarouselService.select(requestContext, kc, 1, 5);
    	
    	 List<KgNews> newsList =iKgNewsService.select(requestContext, null, 1, 13);
    	 CommonUtil.judgeNewsTitleLength(newsList,17);
    	 
//    	 List<KgNews> newsList2 =iKgNewsService.select(requestContext, null, 2, 6);
//    	 CommonUtil.judgeNewsTitleLength(newsList2,17);
    	 
    	 KgNews KgNews = new KgNews();
    	 KgNews.setIndexshow("Y");
    	 List<KgNews> newsThumbNailList =iKgNewsService.select(requestContext, KgNews, 1, 5);
    	 CommonUtil.judgeNewsTitleLength(newsThumbNailList,17);
    	 
    	 mv.addObject("downloadList",downloadList);
    	 mv.addObject("carouselList",carouselList);
    	 mv.addObject("newsList",newsList);
    	 mv.addObject("newsThumbNailList",newsThumbNailList);
    	 
    	 List<KgAssessmentActivity> assessmentList = iKgAssessmentActivityService.select(requestContext, null, 1, 10);
    	 CommonUtil.judgeAssessmentActivityTitleLength(assessmentList,22);
    	 mv.addObject("assessmentList",assessmentList);
    	 loadNavigation(mv, requestContext, CH_INDEX);
         return mv;
    }
	
	@RequestMapping(value = "/index/loginPage")
    @ResponseBody
    public ModelAndView login(HttpServletRequest request) {
    	 ModelAndView mv = new ModelAndView(getViewPath() + "/index/login");
    	 IRequest requestContext = createRequestContext(request);
    	 loadNavigation(mv, requestContext, CH_INDEX);
         return mv;
    }
	
	@RequestMapping(value = "/index/login")
	@ResponseBody
	public ModelAndView login(User dto, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(false);
		// 有session 则不再登录
		if (session != null && session.getAttribute(User.FIELD_USER_ID) != null) {
			 ModelAndView mv = new ModelAndView(REDIRECT + "/");
			return mv;
		}
		
		ModelAndView view = new ModelAndView(REDIRECT + "/");
		IRequest requestContext = createRequestContext(request);
		if(dto.getPasswordEncrypted()!=null)
			dto.setPasswordEncrypted( DigestUtils.md5Hex(dto.getPasswordEncrypted()));
		User sel = new User();
		sel.setUserName(dto.getUserName());
		User user = userService.selectOne(requestContext, sel);
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
	
    
   
}