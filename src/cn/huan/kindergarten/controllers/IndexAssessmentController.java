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

import cn.huan.kindergarten.dto.KgAssessmentActivity;
import cn.huan.kindergarten.dto.KgAssessmentType;
import cn.huan.kindergarten.dto.KgConfig;
import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.dto.KgNewsAttribute;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgAssessmentActivityService;
import cn.huan.kindergarten.service.IKgAssessmentTypeService;
import cn.huan.kindergarten.service.IKgConfigService;
import cn.huan.kindergarten.service.IKgNewsAttributeService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;

@Controller
public class IndexAssessmentController extends BaseController{
	public static final String  CH_INDEX = "CH_INDEX";//首页
	public static final String  CH_XHJJ = "CH_XHJJ";//协会简介
	public static final String  CH_ZXZX = "CH_ZXZX";//资讯中心
	public static final String  CH_XHGZ = "CH_XHGZ";//协会工作
	public static final String  CH_LXWM = "CH_LXWM";//联系我们
	public static final String  SUSPENSION_POINTS = "...";
	
    @Autowired
    private IKgNewstypeService iKgNewstypeService;
    @Autowired
    private IKgNewsSourceService iKgNewsSourceService;
    @Autowired
    private IKgConfigService iKgConfigService;
    @Autowired
    private IKgAssessmentTypeService iKgAssessmentTypeService;
    @Autowired
    private IKgAssessmentActivityService iKgAssessmentActivityService;
    @Autowired
    private IKgNewsAttributeService iKgNewsAttributeService;
    //======================================评估========================================
    @RequestMapping(value = "/index/assessmentTypeList")
    @ResponseBody
    public ModelAndView assessmentTypeList(Long typeid, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit,HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/assessment/assessmentTypeList");
        IRequest requestContext = createRequestContext(request);
        
       
        List<KgAssessmentType> typeList = iKgAssessmentTypeService.selectAll(requestContext);
        if(typeid==null) {
        	if(typeList.size()!=0)
        		typeid=typeList.get(0).getId();
        }
        	
        KgAssessmentActivity kaa = new KgAssessmentActivity();
        kaa.setAssessmentTypeId(typeid);
        
        KgAssessmentType kat = new KgAssessmentType();
        kat.setId(typeid);
        KgAssessmentType assessmentType = iKgAssessmentTypeService.selectByPrimaryKey(requestContext, kat);
        List<KgAssessmentActivity> activityList = iKgAssessmentActivityService.select(requestContext, kaa);
      
        int count = iKgAssessmentActivityService.adminQueryCount(requestContext, kaa);
        int allPageNum = count%limit==0?count/limit:count/limit+1;
        if(count==0) allPageNum=1;
       
        mv.addObject("typeList", typeList);
        mv.addObject("assessmentType",assessmentType);
        mv.addObject("activityList", activityList);
        mv.addObject("page", page);
        mv.addObject("allPageNum",allPageNum);
        mv.addObject("typeid", typeid);
        
        
        loadNavigation(mv, requestContext,CH_XHGZ);
        return mv;
    }

    
    @RequestMapping(value = "/index/assessmentDetail")
    @ResponseBody
    public ModelAndView assessmentDetail(Long id, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit,HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/assessment/assessmentDetail");
        IRequest requestContext = createRequestContext(request);
        KgAssessmentActivity k = new KgAssessmentActivity();
        k.setId(id);
        KgAssessmentActivity kaa = iKgAssessmentActivityService.selectByPrimaryKey(requestContext, k);
        mv.addObject("assessmentInfo", kaa);
        
        KgAssessmentType requestKT = new KgAssessmentType();
        requestKT.setId(kaa.getAssessmentTypeId());
        KgAssessmentType kgNewstype = iKgAssessmentTypeService.selectByPrimaryKey(requestContext, requestKT);
        
        mv.addObject("assessmentType", kgNewstype);
        loadNavigation(mv, requestContext,CH_ZXZX);
        loadAttriteAssessment(mv, requestContext,3);
        return mv;
    }
    
    //===================================other======================================
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

 
    private void judgeTitleLength(List<KgAssessmentActivity> assessmentActivityList) {
    	for(KgAssessmentActivity kg :assessmentActivityList) {
    		String title =kg.getAssessmentActivityName();
    		if(title.length()>17) {
    			title=kg.getAssessmentActivityName().substring(0, 17)+SUSPENSION_POINTS;
    			kg.setAssessmentActivityName(title);
    		}else {
    			kg.setAssessmentActivityName(title);
    		}
    	}
    }
    
    private void loadAttriteAssessment(ModelAndView mv,IRequest requestContext,int attributeSize) {
	 	List<KgNewsAttribute> rightAttributeList =  iKgNewsAttributeService.select(requestContext, null, 1, attributeSize);
        for(KgNewsAttribute ka :rightAttributeList){
        	KgAssessmentActivity kn = new KgAssessmentActivity();
        	kn.setAttributeid(ka.getId()+"");
        	List<KgAssessmentActivity> assessmentActivityList=iKgAssessmentActivityService.selectWithOtherInfo(requestContext, kn, 1, 5);
        	judgeTitleLength(assessmentActivityList);
        	ka.setAssessmentActivityList(assessmentActivityList);
        	
        }
        mv.addObject("rightAttributeList",rightAttributeList);
}
   
}