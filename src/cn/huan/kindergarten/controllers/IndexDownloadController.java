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
import cn.huan.kindergarten.dto.KgDownload;
import cn.huan.kindergarten.dto.KgIntroduction;
import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgConfigService;
import cn.huan.kindergarten.service.IKgDownloadService;
import cn.huan.kindergarten.service.IKgIntroductionService;
import cn.huan.kindergarten.service.IKgNewsAttributeService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;

@Controller
public class IndexDownloadController extends BaseController{
	@Autowired
	private IKgConfigService iKgConfigService;
	@Autowired
	private IKgNewstypeService iKgNewstypeService;
	@Autowired
	private IKgNewsSourceService iKgNewsSourceService;
	
	@Autowired
	private IKgDownloadService iKgDownloadService;
	@Autowired
	private IKgNewsAttributeService iKgNewsAttributeService;
	
	@RequestMapping(value = "/index/download")
    @ResponseBody
    public ModelAndView download( @RequestParam(defaultValue = DEFAULT_PAGE) int page,@RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit,
    		HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/about/about");
    	 IRequest requestContext = createRequestContext(request);
    	 List<KgDownload> list =iKgDownloadService.select(requestContext, null, page, limit);
    	 int count = iKgDownloadService.adminQueryCount(requestContext, null);
    	 int allPageNum = count%limit==0?count/limit:count/limit+1;
	     if(count==0) allPageNum=1;
    	 loadNavigation(mv, requestContext, IndexNewsController.CH_XHJJ);
    	 mv.addObject("downloadList",list);
    	 mv.addObject("page", page);
         mv.addObject("allPageNum",allPageNum);
         
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