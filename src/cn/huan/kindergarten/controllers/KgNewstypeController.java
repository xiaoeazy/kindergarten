package cn.huan.kindergarten.controllers;

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

import cn.huan.kindergarten.bean.ExtAjax;
import cn.huan.kindergarten.bean.ExtStore;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgNewstypeService;

    @Controller
    public class KgNewstypeController extends BaseController{

    @Autowired
    private IKgNewstypeService service;


    @RequestMapping(value = "/kg/newstype/query")
    @ResponseBody
    public ResponseData query(KgNewstype dto, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pageSize, HttpServletRequest request) {
        IRequest requestContext = createRequestContext(request);
        return new ResponseData(service.select(requestContext,dto,page,pageSize));
    }

    @RequestMapping(value = "/kg/newstype/submit")
    @ResponseBody
	public ResponseData update(@RequestBody List<KgNewstype> dto, BindingResult result, HttpServletRequest request){
		getValidator().validate(dto, result);
		if (result.hasErrors()) {
			ResponseData responseData = new ResponseData(false);
			responseData.setMessage(getErrorMessage(result, request));
			return responseData;
		}
        IRequest requestCtx = createRequestContext(request);
        return new ResponseData(service.batchUpdate(requestCtx, dto));
    }

    @RequestMapping(value = "/kg/newstype/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<KgNewstype> dto){
        service.batchDelete(dto);
        return new ResponseData();
    }
    
    
  //========================================后台===================================
    @RequestMapping(value = "/admin/newstype/query")
    @ResponseBody
    public ExtStore adminQuery(KgNewstype dto, @RequestParam(defaultValue = DEFAULT_PAGE) int start,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit, HttpServletRequest request) {
    	 IRequest requestContext = createRequestContext(request);
         List<KgNewstype> list = service.select(requestContext,dto,1,limit);
         return new ExtStore(start, limit, list.size(), list);
    }

    @RequestMapping(value = "/admin/newstype/submit")
    @ResponseBody
	public ExtAjax adminUpdate(@RequestBody List<KgNewstype> dto, BindingResult result, HttpServletRequest request){
    	 IRequest requestCtx = createRequestContext(request);
         List<KgNewstype> list = service.batchUpdate(requestCtx, dto);
         return new ExtAjax(true, null);
    }

    @RequestMapping(value = "/admin/newstype/remove")
    @ResponseBody
    public ExtAjax adminDelete(HttpServletRequest request,@RequestBody List<KgNewstype> dto){
    	  service.batchDelete(dto);
          return new ExtAjax(true, null);
    }
    }