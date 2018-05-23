package cn.huan.kindergarten.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.account.bean.UserAndRoleContext;
import com.huan.HTed.account.dto.User;
import com.huan.HTed.account.dto.UserRole;
import com.huan.HTed.account.service.IUserService;
import com.huan.HTed.core.IRequest;

import cn.huan.kindergarten.bean.ExtAjax;
import cn.huan.kindergarten.bean.ExtStore;
import cn.huan.kindergarten.dto.KgAssessmentActivity;
import cn.huan.kindergarten.exception.KgFileException;

@Controller
public class IndexUserController extends IndexBaseController{
	@Autowired
	private IUserService iUserService;
	
	
	@RequestMapping(value = "/index/user")
    @ResponseBody
    public ModelAndView user(HttpServletRequest request) throws KgFileException {
		 HttpSession session = request.getSession(false);
         if(session==null) {
        	 throw new KgFileException(null, "请先登陆！", null);
         }
    	 ModelAndView mv = new ModelAndView(getViewPath() + "/index/user/user");
    	 IRequest requestContext = createRequestContext(request);
    	 loadNavigation(mv, requestContext, CH_INDEX);
         return mv;
    }
	
	   @RequestMapping(value = "/index/user/submit")
	    @ResponseBody
		public ExtAjax userUpdate(@RequestBody User user,  BindingResult result, HttpServletRequest request) throws KgFileException{
		   HttpSession session = request.getSession(false);
	         if(session==null) {
	        	 throw new KgFileException(null, "请先登陆！", null);
	         }
	    	 IRequest requestCtx = createRequestContext(request);
	    	 user.setUserId(requestCtx.getUserId());
	    	 user.set__status("update");
	    
			 if(user.getPasswordEncrypted()!=null) {
				 String passwordEncrypted = DigestUtils.md5Hex(user.getPasswordEncrypted());
				 user.setPasswordEncrypted(passwordEncrypted);
			 }
			 iUserService.adminUpdate(requestCtx, user, null);
	         return new ExtAjax(true, null);
	    }
	   
	   @RequestMapping(value = "/index/userAssessment")
	    @ResponseBody
	    public ModelAndView userAssessment(HttpServletRequest request) throws KgFileException {
			 HttpSession session = request.getSession(false);
	         if(session==null) {
	        	 throw new KgFileException(null, "请先登陆！", null);
	         }
	    	 ModelAndView mv = new ModelAndView(getViewPath() + "/index/user/userAssessment");
	    	 IRequest requestContext = createRequestContext(request);
	    	 loadNavigation(mv, requestContext, CH_INDEX);
	         return mv;
	    }
	   
	   @RequestMapping(value = "/index/userAssessment/userAssessmentInfo")
	    @ResponseBody
	    public ExtAjax  userAssessmentInfo(HttpServletRequest request) throws KgFileException {
//			 HttpSession session = request.getSession(false);
//	         if(session==null) {
//	        	 throw new KgFileException(null, "请先登陆！", null);
//	         }
//	    	 IRequest requestContext = createRequestContext(request);
//	    	 
//	    	 
//	         return mv;
		   return null;
	    }
	   
	    @RequestMapping(value = "/index/userAssessment/assessmentInfo")
	    @ResponseBody
	    public ExtStore assessmentInfo(KgAssessmentActivity dto, @RequestParam(defaultValue = DEFAULT_PAGE) int page,int start,
	        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit, HttpServletRequest request) {
//	    	 HttpSession session = request.getSession(false);
//	         if(session==null) {
//	        	 throw new KgFileException(null, "请先登陆！", null);
//	         }
//	    	 IRequest requestContext = createRequestContext(request);
//	    	 
//	    	 List<KgAssessmentActivity> list = service.selectWithOtherInfo(requestContext,dto,page,limit);
//	    	 int count = service.adminQueryCount(requestContext, dto);
//	    	 return new ExtStore(start, limit, count, list);
	    	return null;
	    }


}