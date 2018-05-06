
package cn.huan.kindergarten.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.controllers.BaseController;

import cn.huan.kindergarten.dto.KgConfig;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgConfigService;
import cn.huan.kindergarten.service.IKgNewsService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;

/**
 * IndexBaseController.
 */
@RestController
public class IndexBaseController extends BaseController{
	// 默认的登录页
    public static final String VIEW_LOGIN = "/index/login";
    
	public static final String  CH_INDEX = "CH_INDEX";//首页
	public static final String  CH_XHJJ = "CH_XHJJ";//协会简介
	public static final String  CH_ZXZX = "CH_ZXZX";//资讯中心
	public static final String  CH_XHGZ = "CH_XHGZ";//协会工作
	public static final String  CH_LXWM = "CH_LXWM";//联系我们
	@Autowired
	private IKgNewstypeService iKgNewstypeService;
	@Autowired
	private IKgConfigService iKgConfigService;
	@Autowired
	private IKgNewsSourceService iKgNewsSourceService;
	
	public void loadNavigation(ModelAndView mv,IRequest requestContext,String chanel  ) {
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
