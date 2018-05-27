package cn.huan.kindergarten.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.controllers.BaseController;
import com.huan.HTed.system.dto.ResponseData;

import cn.huan.kindergarten.bean.ChartItemA;
import cn.huan.kindergarten.dto.KgQuestionAnswer;
import cn.huan.kindergarten.dto.KgUserQAnswer;
import cn.huan.kindergarten.service.IKgQuestionAnswerService;
import cn.huan.kindergarten.service.IKgUserQAnswerService;

    @Controller
    public class KgQuestionAnswerController extends BaseController{

    @Autowired
    private IKgQuestionAnswerService service;
    
    @Autowired
    private IKgUserQAnswerService qService;


    @RequestMapping(value = "/kg/question/answer/query")
    @ResponseBody
    public ResponseData query(KgQuestionAnswer dto, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pageSize, HttpServletRequest request) {
        IRequest requestContext = createRequestContext(request);
        return new ResponseData(service.select(requestContext,dto,page,pageSize));
    }

    @RequestMapping(value = "/kg/question/answer/submit")
    @ResponseBody
	public ResponseData update(@RequestBody List<KgQuestionAnswer> dto, BindingResult result, HttpServletRequest request){
		getValidator().validate(dto, result);
		if (result.hasErrors()) {
			ResponseData responseData = new ResponseData(false);
			responseData.setMessage(getErrorMessage(result, request));
			return responseData;
		}
        IRequest requestCtx = createRequestContext(request);
        return new ResponseData(service.batchUpdate(requestCtx, dto));
    }

    @RequestMapping(value = "/kg/question/answer/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<KgQuestionAnswer> dto){
        service.batchDelete(dto);
        return new ResponseData();
    }
//========================================后台===================================
    @RequestMapping(value = "/admin/question/answer/query")
    @ResponseBody
    public List<ChartItemA> adminQuery(KgQuestionAnswer dto, HttpServletRequest request) {
    	 IRequest requestContext = createRequestContext(request);
         List<KgQuestionAnswer> list = service.select(requestContext, dto);
         List<ChartItemA> tlist = new ArrayList<ChartItemA>();
         double allSize = 0;
         for(KgQuestionAnswer ka :list) {
        	 ChartItemA tb = new ChartItemA();
        	 tb.setName(ka.getName());
        	 tb.setId(ka.getId());
        	 
        	 KgUserQAnswer qa = new KgUserQAnswer();
        	 qa.setAid(ka.getId());
        	 List<KgUserQAnswer> uqa = qService.select(requestContext, qa);
        	 if(uqa.size()>0) {
        		 tb.setSize(uqa.size());
        		 allSize+=uqa.size();
        	 }
        	 tlist.add(tb);
         }
         for(ChartItemA ka:tlist) {
        	 double percent = ka.getSize()/allSize;
        	 ka.setPercent(percent);
         }
         return tlist;
    }
    }