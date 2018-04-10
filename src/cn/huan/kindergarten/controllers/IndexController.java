package cn.huan.kindergarten.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.controllers.BaseController;

import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgNewsService;
import cn.huan.kindergarten.service.IKgNewstypeService;

@Controller
public class IndexController extends BaseController{

	@Autowired
	private IKgNewsService iKgNewsService;
	@Autowired
	private IKgNewstypeService iKgNewstypeService;
	
	 @RequestMapping(value = "/index/newsList")
	    @ResponseBody
	    public ModelAndView newsList(Long typeid, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
	            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pageSize,HttpServletRequest request) {
	    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/news");
	        IRequest requestContext = createRequestContext(request);
	        KgNews news = new KgNews();
	        news.setTypeid(typeid);
	        List<KgNews> list = iKgNewsService.select(requestContext, news, page, pageSize);
	        KgNewstype newsType = new KgNewstype();
	        newsType.setId(typeid+"");
	        KgNewstype kgNewstype = iKgNewstypeService.selectByPrimaryKey(requestContext, newsType);
	        mv.addObject("newsList", list);
	        mv.addObject("page", page);
	        mv.addObject("pagesize",12);
	        mv.addObject("kgNewstype", kgNewstype);
	        mv.addObject("typeid", typeid);
	        return mv;
	    }


    @RequestMapping(value = "/index/newsDetail")
    @ResponseBody
    public ModelAndView newsDetail(String id,HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/newsDetail");
        IRequest requestContext = createRequestContext(request);
        
        KgNews news = new KgNews();
        news.setId(id);
        KgNews newsInfo = iKgNewsService.selectByPrimaryKey(requestContext, news);
        mv.addObject("newsInfo", newsInfo);
        
        return mv;
    }

    
   
}