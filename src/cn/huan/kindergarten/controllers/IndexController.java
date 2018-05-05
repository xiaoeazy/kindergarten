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
import com.huan.HTed.system.controllers.BaseController;

import cn.huan.kindergarten.dto.KgCarousel;
import cn.huan.kindergarten.dto.KgConfig;
import cn.huan.kindergarten.dto.KgDownload;
import cn.huan.kindergarten.dto.KgIntroduction;
import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgCarouselService;
import cn.huan.kindergarten.service.IKgConfigService;
import cn.huan.kindergarten.service.IKgDownloadService;
import cn.huan.kindergarten.service.IKgNewsService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;
import cn.huan.kindergarten.utils.CommonUtil;

@Controller
public class IndexController extends BaseController{
	
	// 默认的登录页
    private static final String VIEW_LOGIN = "/index/login";
    
	public static final String  CH_INDEX = "CH_INDEX";//首页
	public static final String  CH_XHJJ = "CH_XHJJ";//协会简介
	public static final String  CH_ZXZX = "CH_ZXZX";//资讯中心
	public static final String  CH_XHGZ = "CH_XHGZ";//协会工作
	public static final String  CH_LXWM = "CH_LXWM";//联系我们
	@Autowired
	private IKgConfigService iKgConfigService;
	@Autowired
	private IKgNewstypeService iKgNewstypeService;
	@Autowired
	private IKgNewsSourceService iKgNewsSourceService;
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
	
	@RequestMapping(value = "/")
    @ResponseBody
    public ModelAndView index(HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/index");
    	 IRequest requestContext = createRequestContext(request);
    	 KgIntroduction ki = new KgIntroduction();
    	 ki.setId(1l);
    	 List<KgDownload> downloadList = iKgDownloadService.select(requestContext, null, 1, 4);
    	 List<KgCarousel> carouselList =iKgCarouselService.select(requestContext, null, 1, 5);
    	
    	 List<KgNews> newsList1 =iKgNewsService.select(requestContext, null, 1, 7);
    	 CommonUtil.judgeTitleLength(newsList1);
    	 
    	 List<KgNews> newsList2 =iKgNewsService.select(requestContext, null, 2, 6);
    	 CommonUtil.judgeTitleLength(newsList2);
    	 
    	 KgNews KgNews = new KgNews();
    	 KgNews.setIndexshow("Y");
    	 List<KgNews> newsThumbNailList =iKgNewsService.select(requestContext, KgNews, 1, 5);
    	 CommonUtil.judgeTitleLength(newsThumbNailList);
    	 
    	 mv.addObject("downloadList",downloadList);
    	 mv.addObject("carouselList",carouselList);
    	 mv.addObject("newsList1",newsList1);
    	 mv.addObject("newsList2",newsList2);
    	 mv.addObject("newsThumbNailList",newsThumbNailList);
    	 
    	 loadNavigation(mv, requestContext, CH_INDEX);
         return mv;
    }
	
	@RequestMapping(value = "/index/login")
    @ResponseBody
    public ModelAndView login(HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/login");
    	 IRequest requestContext = createRequestContext(request);
    	 loadNavigation(mv, requestContext, CH_INDEX);
         return mv;
    }
	
	@RequestMapping(value = "/index/tologin")
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
	
    private void loadNavigation(ModelAndView mv,IRequest requestContext,String chanel  ) {
  	  List<KgNewstype> kgNewstypeList = iKgNewstypeService.selectAll(requestContext);
        List<KgNewsSource> KgNewsSourceList = iKgNewsSourceService.selectAll(requestContext);
        
        mv.addObject("kgNewstypeList", kgNewstypeList);
        mv.addObject("KgNewsSourceList", KgNewsSourceList);
        mv.addObject("chanel", chanel);
        
        List<KgConfig> kgConfigList= iKgConfigService.selectAll(requestContext);
        for(KgConfig cf:kgConfigList) {
      	  if(("copyright").equals(cf.getSyskey())) {
      		  mv.addObject("copyright", cf.getSysvalue());continue;
      	  }
      	  if(("ICPlicense").equals(cf.getSyskey())) {
      		  mv.addObject("ICPlicense", cf.getSysvalue());continue;
      	  }
      	  if(("keyword").equals(cf.getSyskey())) {
      		  mv.addObject("keyword", cf.getSysvalue());continue;
      	  }
      	  if(("webdesc").equals(cf.getSyskey())) {
      		  mv.addObject("webdesc", cf.getSysvalue());continue;
      	  }
        }
  }
   
}