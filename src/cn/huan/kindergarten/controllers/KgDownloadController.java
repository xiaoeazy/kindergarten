package cn.huan.kindergarten.controllers;

import org.springframework.stereotype.Controller;
import com.huan.HTed.system.controllers.BaseController;
import com.huan.HTed.bean.UploadImgAjax;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.dto.ResponseData;

import cn.huan.kindergarten.bean.ExtAjax;
import cn.huan.kindergarten.bean.ExtStore;
import cn.huan.kindergarten.dto.KgAssessmentType;
import cn.huan.kindergarten.dto.KgDownload;
import cn.huan.kindergarten.service.IKgDownloadService;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import org.springframework.validation.BindingResult;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

    @Controller
    public class KgDownloadController extends BaseController{

    @Autowired
    private IKgDownloadService service;


    @RequestMapping(value = "/kg/download/query")
    @ResponseBody
    public ResponseData query(KgDownload dto, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pageSize, HttpServletRequest request) {
        IRequest requestContext = createRequestContext(request);
        return new ResponseData(service.select(requestContext,dto,page,pageSize));
    }

    @RequestMapping(value = "/kg/download/submit")
    @ResponseBody
	public ResponseData update(@RequestBody List<KgDownload> dto, BindingResult result, HttpServletRequest request){
		getValidator().validate(dto, result);
		if (result.hasErrors()) {
			ResponseData responseData = new ResponseData(false);
			responseData.setMessage(getErrorMessage(result, request));
			return responseData;
		}
        IRequest requestCtx = createRequestContext(request);
        return new ResponseData(service.batchUpdate(requestCtx, dto));
    }

    @RequestMapping(value = "/kg/download/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<KgDownload> dto){
        service.batchDelete(dto);
        return new ResponseData();
    }
    
  //========================================后台===================================
    @RequestMapping(value = "/admin/download/query")
    @ResponseBody
    public ExtStore adminQuery(KgDownload dto, @RequestParam(defaultValue = DEFAULT_PAGE)int page,int start,
        @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit, HttpServletRequest request) {
    	 IRequest requestContext = createRequestContext(request);
         List<KgDownload> list = service.select(requestContext,dto,page,limit);
         int count = service.adminQueryCount(requestContext, null);
         return new ExtStore(start, limit, count, list);
    }
    
    @RequestMapping(value = "/admin/download/queryAll")
    @ResponseBody
    public ExtStore adminQueryAll(KgDownload dto, HttpServletRequest request) {
    	 IRequest requestContext = createRequestContext(request);
         List<KgDownload> list = service.select(requestContext,dto);
         int count = service.adminQueryCount(requestContext, null);
         return new ExtStore(null, null, count, list);
    }

    @RequestMapping(value = "/admin/download/submit")
    @ResponseBody
	public ExtAjax adminUpdate(String summary, HttpServletRequest request) throws FileUploadException, IOException{
    	  IRequest requestCtx = createRequestContext(request);
    	  DiskFileItemFactory factory = new DiskFileItemFactory();
          ServletFileUpload upload = new ServletFileUpload(factory);
          List<FileItem> items = upload.parseRequest(request);
          String file_path = request.getServletContext().getRealPath("/") + "/resources/upload/download";
          File dir=new File(file_path);
          if(!dir.exists())
              dir.mkdir();
          
          String imgName= "";
          for (FileItem fi : items) {
              if (fi.isFormField()) {
                  fi.getFieldName();
                  fi.getString();
              } else {
//                  String imgName = fi.getName();//
              	 imgName = fi.getName();
                  File tempFile = new File(file_path+'/'+imgName);
                  if (imgName == null) {
//                      return "<script>window.parent.showUploadError('NO_FILE')</script>";
                  	 return new ExtAjax(false, "没有文件");
                  } else {
                      int idx = imgName.lastIndexOf(".");
                      if (idx != -1) {
                      } else {
                      	return new ExtAjax(false, "文件没有后缀");
                      }
                  }
                  try (InputStream is = fi.getInputStream(); OutputStream os = new FileOutputStream(tempFile)) {
                      IOUtils.copyLarge(is, os);
                  }

              }
          }
    	 String fileTitle = imgName.substring(0,imgName.lastIndexOf(".")-1);
		 KgDownload  dto  = new KgDownload();
		 dto.setFileTitle(fileTitle);
		 dto.setFilePath("/resources/upload/download"+imgName);
		 dto.setSummary(summary);
		 List<KgDownload> update = new ArrayList<KgDownload>();
		 update.add(dto);
         List<KgDownload> list = service.batchUpdate(requestCtx, update);
         return new ExtAjax(true, null);
    }

    @RequestMapping(value = "/admin/download/remove")
    @ResponseBody
    public ExtAjax adminDelete(HttpServletRequest request,@RequestBody List<KgDownload> dto){
    	  service.batchDelete(dto);
          return new ExtAjax(true, null);
    }
    }