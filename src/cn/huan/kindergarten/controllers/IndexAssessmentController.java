package cn.huan.kindergarten.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.attachment.exception.StoragePathNotExsitException;
import com.huan.HTed.attachment.exception.UniqueFileMutiException;
import com.huan.HTed.bean.UploadImgAjax;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.controllers.BaseController;

import cn.huan.kindergarten.bean.FileInfo;
import cn.huan.kindergarten.dto.KgAssessmentActivity;
import cn.huan.kindergarten.dto.KgAssessmentActivityUserProgress;
import cn.huan.kindergarten.dto.KgAssessmentActivityUserUpload;
import cn.huan.kindergarten.dto.KgAssessmentType;
import cn.huan.kindergarten.dto.KgConfig;
import cn.huan.kindergarten.dto.KgNewsAttribute;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IIndexAssessmentService;
import cn.huan.kindergarten.service.IKgAssessmentActivityService;
import cn.huan.kindergarten.service.IKgAssessmentActivityUserUploadService;
import cn.huan.kindergarten.service.IKgAssessmentTypeService;
import cn.huan.kindergarten.service.IKgConfigService;
import cn.huan.kindergarten.service.IKgNewsAttributeService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;

@Controller
public class IndexAssessmentController extends IndexBaseController{
	public static final String  SUSPENSION_POINTS = "...";
	
    @Autowired
    private IKgAssessmentTypeService iKgAssessmentTypeService;
    @Autowired
    private IKgAssessmentActivityService iKgAssessmentActivityService;
    @Autowired
    private IKgNewsAttributeService iKgNewsAttributeService;
    @Autowired
    private IIndexAssessmentService iIndexAssessmentService;
    @Autowired
    private IKgAssessmentActivityUserUploadService iKgAssessmentActivityUserUploadService;
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
        
        List<KgAssessmentActivityUserUpload> userUploadList = new ArrayList<KgAssessmentActivityUserUpload>();
        HttpSession session = request.getSession(false);
        if(session!=null) {
        	  Long userid = (Long)session.getAttribute(IRequest.FIELD_USER_ID);
              KgAssessmentActivityUserProgress userProgress = new KgAssessmentActivityUserProgress();
              userProgress.setUploadUserId(userid);
              userProgress.setAssessmentActivityId(id);
              userUploadList.addAll(iKgAssessmentActivityUserUploadService.loadUserUploadList(requestContext,userProgress ));
        }
      
        
        mv.addObject("assessmentType", kgNewstype);
        mv.addObject("userUploadList",userUploadList);
        loadNavigation(mv, requestContext,CH_XHGZ);
        loadAttriteAssessment(mv, requestContext,3);
        return mv;
    }
    
    
    @RequestMapping(value = "/index/assessment/upload", method = RequestMethod.POST, produces = "text/html")
    @ResponseBody
    public UploadImgAjax fileupload(HttpServletRequest request)
            throws StoragePathNotExsitException, UniqueFileMutiException, IOException, FileUploadException {
    	 HttpSession session = request.getSession(false);
         if(session==null) {
        	 throw new FileUploadException("需要登陆");
         }
    	IRequest requestContext = createRequestContext(request);
    	Long assessmentActivityId = Long.parseLong(request.getParameter("assessmentActivityId"));
    	if(assessmentActivityId==null)
    		throw new  FileUploadException("参数错误");
    	
    	List<FileInfo> list = iIndexAssessmentService.assessmentUpload(requestContext, request, assessmentActivityId);
//        return "<script>window.parent.showUploadSucessLogo()</script>";
    	return new UploadImgAjax(true,null, "");
    }
    
    
    //===================================other======================================
   

 
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