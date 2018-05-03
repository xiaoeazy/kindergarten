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

import cn.huan.kindergarten.dto.KgConfig;
import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.dto.KgNewsAttribute;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgConfigService;
import cn.huan.kindergarten.service.IKgNewsAttributeService;
import cn.huan.kindergarten.service.IKgNewsService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;
import cn.huan.kindergarten.utils.CommonUtil;

@Controller
public class IndexNewsController extends BaseController{
	public static final String  CH_INDEX = "CH_INDEX";//首页
	public static final String  CH_XHJJ = "CH_XHJJ";//协会简介
	public static final String  CH_ZXZX = "CH_ZXZX";//资讯中心
	public static final String  CH_XHGZ = "CH_XHGZ";//协会工作
	public static final String  CH_LXWM = "CH_LXWM";//联系我们
	
	@Autowired
	private IKgNewsService iKgNewsService;
	@Autowired
	private IKgNewstypeService iKgNewstypeService;
	@Autowired
	private IKgNewsSourceService iKgNewsSourceService;
	@Autowired
	private IKgConfigService iKgConfigService;
	@Autowired
	private IKgNewsAttributeService iKgNewsAttributeService;
	
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
        	List<KgNews> newsList = iKgNewsService.selectWithOtherInfo(requestContext, news, 1, 6);
        	kn.setNewsList(newsList);
        }
        
        mv.addObject("typeList", typeList);
        loadNavigation(mv, requestContext,CH_ZXZX);
        iKgNewsAttributeService.loadAttriteNews(mv, requestContext,2);
       
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
        
        
        loadNavigation(mv, requestContext,CH_ZXZX);
        
       
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
	        List<KgNews> list = iKgNewsService.selectWithOtherInfo(requestContext, news, page, limit);
	        KgNewstype newsType = new KgNewstype();
	        newsType.setId(typeid);
	        KgNewstype kgNewstype = iKgNewstypeService.selectByPrimaryKey(requestContext, newsType);
	        mv.addObject("newsList", list);
	        mv.addObject("page", page);
	        mv.addObject("allPageNum",allPageNum);
	        mv.addObject("kgNewstype", kgNewstype);
	        mv.addObject("typeid", typeid);
	        
	        loadNavigation(mv, requestContext,CH_ZXZX);
	        iKgNewsAttributeService.loadAttriteNews(mv, requestContext,3);
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
        
        KgNewstype newsType = new KgNewstype();
        newsType.setId(newsInfo.getTypeid());
        KgNewstype kgNewstype = iKgNewstypeService.selectByPrimaryKey(requestContext, newsType);
        
        mv.addObject("kgNewstype", kgNewstype);
        loadNavigation(mv, requestContext,CH_ZXZX);
        iKgNewsAttributeService.loadAttriteNews(mv, requestContext,3);
        return mv;
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