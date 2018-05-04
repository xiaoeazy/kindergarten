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

import cn.huan.kindergarten.dto.KgConfig;
import cn.huan.kindergarten.dto.KgIntroduction;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgConfigService;
import cn.huan.kindergarten.service.IKgIntroductionService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;

@Controller
public class IndexAboutController extends BaseController{
	@Autowired
	private IKgConfigService iKgConfigService;
	@Autowired
	private IKgNewstypeService iKgNewstypeService;
	@Autowired
	private IKgNewsSourceService iKgNewsSourceService;
	
	@Autowired
	private IKgIntroductionService iKgIntroductionService;
	
	@RequestMapping(value = "/index/about")
    @ResponseBody
    public ModelAndView about(HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/about/about");
    	 IRequest requestContext = createRequestContext(request);
    	 KgIntroduction ki = new KgIntroduction();
    	 ki.setId(1l);
    	 List<KgIntroduction> list =iKgIntroductionService.select(requestContext, ki);
    	 KgIntroduction result = list.get(0);
    	 loadNavigation(mv, requestContext, IndexController.CH_XHJJ);
    	 mv.addObject("about",result.getIntroduction());
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