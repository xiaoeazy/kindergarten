package cn.huan.kindergarten.controllers;

import org.springframework.stereotype.Controller;
import com.huan.HTed.system.controllers.BaseController;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.dto.ResponseData;

import cn.huan.kindergarten.bean.ExtAjax;
import cn.huan.kindergarten.bean.ExtStore;
import cn.huan.kindergarten.dto.KgAssessmentActivity;
import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.service.IKgAssessmentActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import org.springframework.validation.BindingResult;
import java.util.List;

    @Controller
    public class KgAssessmentActivityController extends BaseController{

    @Autowired
    private IKgAssessmentActivityService service;


    @RequestMapping(value = "/kg/assessment/activity/query")
    @ResponseBody
    public ResponseData query(KgAssessmentActivity dto, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pageSize, HttpServletRequest request) {
        IRequest requestContext = createRequestContext(request);
        return new ResponseData(service.select(requestContext,dto,page,pageSize));
    }

    @RequestMapping(value = "/kg/assessment/activity/submit")
    @ResponseBody
	public ResponseData update(@RequestBody List<KgAssessmentActivity> dto, BindingResult result, HttpServletRequest request){
		getValidator().validate(dto, result);
		if (result.hasErrors()) {
			ResponseData responseData = new ResponseData(false);
			responseData.setMessage(getErrorMessage(result, request));
			return responseData;
		}
        IRequest requestCtx = createRequestContext(request);
        return new ResponseData(service.batchUpdate(requestCtx, dto));
    }

    @RequestMapping(value = "/kg/assessment/activity/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<KgAssessmentActivity> dto){
        service.batchDelete(dto);
        return new ResponseData();
    }
    
    // ========================================后台===================================
    @RequestMapping(value = "/admin/assessment/activity/query")
    @ResponseBody
    public ExtStore adminQuery(KgAssessmentActivity dto, @RequestParam(defaultValue = DEFAULT_PAGE) int page,int start,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit, HttpServletRequest request) {
    	 IRequest requestContext = createRequestContext(request);
//         List<KgNews> list = service.select(requestContext,dto,1,limit);
    	 List<KgAssessmentActivity> list = service.selectWithOtherInfo(requestContext,dto,page,limit);
    	 int count = service.adminQueryCount(requestContext, dto);
    	 return new ExtStore(start, limit, count, list);
    }
    
    @RequestMapping(value = "/admin/assessment/activity/queryAll")
    @ResponseBody
    public ExtStore adminQueryAll(KgAssessmentActivity dto,HttpServletRequest request) {
    	 IRequest requestContext = createRequestContext(request);
    	 List<KgAssessmentActivity> list = service.selectWithOtherInfo(requestContext,dto,null,null);
    	 int count = service.adminQueryCount(requestContext, dto);
    	 return new ExtStore(null, null, count, list);
    }

    @RequestMapping(value = "/admin/assessment/activity/submit")
    @ResponseBody
	public ExtAjax adminUpdate(@RequestBody List<KgAssessmentActivity> dto, BindingResult result, HttpServletRequest request){
		
    	 IRequest requestCtx = createRequestContext(request);
         List<KgAssessmentActivity> list = service.batchUpdate(requestCtx, dto);
         return new ExtAjax(true, null);
    }

    @RequestMapping(value = "/admin/assessment/activity/remove")
    @ResponseBody
    public ExtAjax adminDelete(HttpServletRequest request,@RequestBody List<KgAssessmentActivity> dto){
        service.batchDelete(dto);
        return new ExtAjax(true, null);
    }
    
    
    }