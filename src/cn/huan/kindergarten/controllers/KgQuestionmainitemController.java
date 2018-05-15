package cn.huan.kindergarten.controllers;

import org.springframework.stereotype.Controller;
import com.huan.HTed.system.controllers.BaseController;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.dto.ResponseData;
import cn.huan.kindergarten.dto.KgQuestionmainitem;
import cn.huan.kindergarten.service.IKgQuestionmainitemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import org.springframework.validation.BindingResult;
import java.util.List;

    @Controller
    public class KgQuestionmainitemController extends BaseController{

    @Autowired
    private IKgQuestionmainitemService service;


    @RequestMapping(value = "/kg/questionmainitem/query")
    @ResponseBody
    public ResponseData query(KgQuestionmainitem dto, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pageSize, HttpServletRequest request) {
        IRequest requestContext = createRequestContext(request);
        return new ResponseData(service.select(requestContext,dto,page,pageSize));
    }

    @RequestMapping(value = "/kg/questionmainitem/submit")
    @ResponseBody
	public ResponseData update(@RequestBody List<KgQuestionmainitem> dto, BindingResult result, HttpServletRequest request){
		getValidator().validate(dto, result);
		if (result.hasErrors()) {
			ResponseData responseData = new ResponseData(false);
			responseData.setMessage(getErrorMessage(result, request));
			return responseData;
		}
        IRequest requestCtx = createRequestContext(request);
        return new ResponseData(service.batchUpdate(requestCtx, dto));
    }

    @RequestMapping(value = "/kg/questionmainitem/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<KgQuestionmainitem> dto){
        service.batchDelete(dto);
        return new ResponseData();
    }
    }