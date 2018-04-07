package cn.huan.kindergarten.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.controllers.BaseController;

@Controller
public class IndexController extends BaseController{


	 @RequestMapping(value = "/index/newsList")
	    @ResponseBody
	    public ModelAndView newsList(HttpServletRequest request) {
	    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/news");
	        IRequest requestContext = createRequestContext(request);
	        return mv;
	    }


    @RequestMapping(value = "/index/newsDetail")
    @ResponseBody
    public ModelAndView newsDetail(HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/newsDetail");
        IRequest requestContext = createRequestContext(request);
        return mv;
    }

    
   
}