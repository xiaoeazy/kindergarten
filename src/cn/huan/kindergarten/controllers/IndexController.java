package cn.huan.kindergarten.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.core.IRequest;
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
	
	@RequestMapping(value = "/")
    @ResponseBody
    public ModelAndView about(HttpServletRequest request) {
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
    	 
    	 mv.addObject("downloadList",downloadList);
    	 mv.addObject("carouselList",carouselList);
    	 mv.addObject("newsList1",newsList1);
    	 mv.addObject("newsList2",newsList2);
    	 
    	 loadNavigation(mv, requestContext, CH_INDEX);
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