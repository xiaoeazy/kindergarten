package cn.huan.kindergarten.controllers;

import org.springframework.stereotype.Controller;
import com.huan.HTed.system.controllers.BaseController;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.dto.ResponseData;
import cn.huan.kindergarten.dto.KgAssessmentActivityUserUpload;
import cn.huan.kindergarten.service.IKgAssessmentActivityUserUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import org.springframework.validation.BindingResult;
import java.util.List;

    @Controller
    public class KgAssessmentActivityUserUploadController extends BaseController{

    @Autowired
    private IKgAssessmentActivityUserUploadService service;


    @RequestMapping(value = "/kg/assessment/activity/user/upload/query")
    @ResponseBody
    public ResponseData query(KgAssessmentActivityUserUpload dto, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pageSize, HttpServletRequest request) {
        IRequest requestContext = createRequestContext(request);
        return new ResponseData(service.select(requestContext,dto,page,pageSize));
    }

    @RequestMapping(value = "/kg/assessment/activity/user/upload/submit")
    @ResponseBody
	public ResponseData update(@RequestBody List<KgAssessmentActivityUserUpload> dto, BindingResult result, HttpServletRequest request){
		getValidator().validate(dto, result);
		if (result.hasErrors()) {
			ResponseData responseData = new ResponseData(false);
			responseData.setMessage(getErrorMessage(result, request));
			return responseData;
		}
        IRequest requestCtx = createRequestContext(request);
        return new ResponseData(service.batchUpdate(requestCtx, dto));
    }

    @RequestMapping(value = "/kg/assessment/activity/user/upload/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<KgAssessmentActivityUserUpload> dto){
        service.batchDelete(dto);
        return new ResponseData();
    }
    }