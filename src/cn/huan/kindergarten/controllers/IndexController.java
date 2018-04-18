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
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgNewsService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;

@Controller
public class IndexController extends BaseController{

	@Autowired
	private IKgNewsService iKgNewsService;
	@Autowired
	private IKgNewstypeService iKgNewstypeService;
	@Autowired
	private IKgNewsSourceService iKgNewsSourceService;
	
	@RequestMapping(value = "/index/news")
    @ResponseBody
    public ModelAndView news(HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/news/news");
        IRequest requestContext = createRequestContext(request);
        List<KgNewstype> typeList = iKgNewstypeService.selectAll(requestContext);
        for(KgNewstype kn:typeList) {
        	KgNews news = new KgNews();
        	news.setTypeid(kn.getId());
        	int count = iKgNewsService.adminQueryCount(requestContext, news);
        	kn.setCount(count);
        	List<KgNews> newsList = iKgNewsService.select(requestContext, news, 1, 6);
        	kn.setNewsList(newsList);
        }
        
        mv.addObject("typeList", typeList);
        
        List<KgNewstype> kgNewstypeList = iKgNewstypeService.selectAll(requestContext);
        List<KgNewsSource> KgNewsSourceList = iKgNewsSourceService.selectAll(requestContext);
        
        mv.addObject("kgNewstypeList", kgNewstypeList);
        mv.addObject("KgNewsSourceList", KgNewsSourceList);
       
        return mv;
    }
	
	@RequestMapping(value = "/index/newsSearch")
    @ResponseBody
    public ModelAndView newsSearch(String searchparam,String dateissuestart,String dateissueend , Long newstype,Long newssource,
    		 @RequestParam(defaultValue = DEFAULT_PAGE) int page, @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit,
    		HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/news/newsSearch");
        IRequest requestContext = createRequestContext(request);
        
        KgNews news = new KgNews();
        if(searchparam!=null&&!("").equals(searchparam)) news.setNewstitle(searchparam);
        if(newstype!=null)   news.setTypeid(newstype);
        if(newssource!=null)   news.setSourceid(newssource);
        List<KgNews> list = iKgNewsService.selectWithOtherInfo(requestContext, news, page, limit);
        int count = iKgNewsService.adminQueryCount(requestContext, news);
        int allPageNum = count%limit==0?count/limit:count/limit+1;
        if(count==0) allPageNum=1;
        
        mv.addObject("newstitle",searchparam);
        mv.addObject("newsList", list);
        mv.addObject("newsListSize", list.size());
        mv.addObject("page", page);
        mv.addObject("allPageNum",allPageNum);
        
        
        List<KgNewstype> kgNewstypeList = iKgNewstypeService.selectAll(requestContext);
        List<KgNewsSource> KgNewsSourceList = iKgNewsSourceService.selectAll(requestContext);
        
        mv.addObject("kgNewstypeList", kgNewstypeList);
        mv.addObject("KgNewsSourceList", KgNewsSourceList);
        
       
        return mv;
    }
	
	 @RequestMapping(value = "/index/newsTypeList")
	    @ResponseBody
	    public ModelAndView newsTypeList(Long typeid, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
	            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit,HttpServletRequest request) {
	    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/news/newsTypeList");
	        IRequest requestContext = createRequestContext(request);
	        KgNews news = new KgNews();
	        news.setTypeid(typeid);
	        int count = iKgNewsService.adminQueryCount(requestContext, news);
	        int allPageNum = count%limit==0?count/limit:count/limit+1;
	        if(count==0) allPageNum=1;
	        List<KgNews> list = iKgNewsService.select(requestContext, news, page, limit);
	        KgNewstype newsType = new KgNewstype();
	        newsType.setId(typeid);
	        KgNewstype kgNewstype = iKgNewstypeService.selectByPrimaryKey(requestContext, newsType);
	        mv.addObject("newsList", list);
	        mv.addObject("page", page);
	        mv.addObject("allPageNum",allPageNum);
	        mv.addObject("kgNewstype", kgNewstype);
	        mv.addObject("typeid", typeid);
	        return mv;
	    }


    @RequestMapping(value = "/index/newsDetail")
    @ResponseBody
    public ModelAndView newsDetail(Long id,HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/news/newsDetail");
        IRequest requestContext = createRequestContext(request);
        
        KgNews news = new KgNews();
        news.setId(id);
        KgNews newsInfo = iKgNewsService.selectByPrimaryKey(requestContext, news);
        mv.addObject("newsInfo", newsInfo);
        
        return mv;
    }

    
   
}