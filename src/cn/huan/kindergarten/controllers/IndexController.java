package cn.huan.kindergarten.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.controllers.BaseController;

import cn.huan.kindergarten.dto.KgDemo;
import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.service.IKgNewsService;

@Controller
public class IndexController extends BaseController{

	@Autowired
	private IKgNewsService iKgNewsService;
	
	 @RequestMapping(value = "/index/newsList")
	    @ResponseBody
	    public ModelAndView newsList(Long typeid, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
	            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pageSize,HttpServletRequest request) {
	    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/news");
	        IRequest requestContext = createRequestContext(request);
	        KgNews news = new KgNews();
	        news.setTypeid(typeid);
	        List<KgNews> list = iKgNewsService.select(requestContext, news, page, pageSize);
	        mv.addObject("newsList", list);
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