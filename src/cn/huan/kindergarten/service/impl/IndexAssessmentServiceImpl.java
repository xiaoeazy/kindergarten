package cn.huan.kindergarten.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huan.HTed.attachment.exception.StoragePathNotExsitException;
import com.huan.HTed.attachment.exception.UniqueFileMutiException;
import com.huan.HTed.core.IRequest;

import cn.huan.kindergarten.bean.FileInfo;
import cn.huan.kindergarten.dto.KgAssessmentActivityUserProgress;
import cn.huan.kindergarten.dto.KgAssessmentActivityUserUpload;
import cn.huan.kindergarten.service.IIndexAssessmentService;
import cn.huan.kindergarten.service.IKgAssessmentActivityUserProgressService;
import cn.huan.kindergarten.service.IKgAssessmentActivityUserUploadService;

@Service
@Transactional(rollbackFor = Exception.class)
public class IndexAssessmentServiceImpl  implements IIndexAssessmentService{
	 @Autowired
	 private IKgAssessmentActivityUserProgressService iKgAssessmentActivityUserProgressService;
	 @Autowired
	 private IKgAssessmentActivityUserUploadService iKgAssessmentActivityUserUploadService;

	 
	 public List<FileInfo> assessmentUpload(IRequest requestContext,HttpServletRequest request,Long assessmentActivityId) 
			 throws StoragePathNotExsitException, UniqueFileMutiException, IOException, FileUploadException  {
			String fileResourcesPath="/resources/upload/assessment";
	    	String file_path=request.getServletContext().getRealPath("/") + fileResourcesPath;
	        File dir=new File(file_path);
	        if(!dir.exists())
	            dir.mkdir();
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        List<FileItem> items = upload.parseRequest(request);
	        
	        List<FileInfo>  allFilePath = new ArrayList<FileInfo>();
	        for (FileItem fi : items) {
	            if (fi.isFormField()) {
	                fi.getFieldName();
	                fi.getString();
	            } else {
	            	
	            	String imgName = fi.getName();
	                File tempFile = new File(file_path+'/'+imgName);
	                if (imgName == null) {
	                	throw new RuntimeException("无文件");
	                } 
	                try (InputStream is = fi.getInputStream(); OutputStream os = new FileOutputStream(tempFile)) {
	                    IOUtils.copyLarge(is, os);
	                }
	                allFilePath.add(new FileInfo(imgName,fileResourcesPath+"/"+imgName));
	            }
	        }
	        //更新
	        Long userid = (Long)request.getSession().getAttribute(IRequest.FIELD_USER_ID);
	        KgAssessmentActivityUserProgress kaup = new KgAssessmentActivityUserProgress();
	        kaup.setAssessmentActivityId(assessmentActivityId);
	        kaup.setUploadUserId(userid);
	        KgAssessmentActivityUserProgress insertBean=iKgAssessmentActivityUserProgressService.insert(requestContext, kaup);
	        for(FileInfo fi :allFilePath) {
        	    KgAssessmentActivityUserUpload kauu = new KgAssessmentActivityUserUpload();
  	        	kauu.setUploadUserId(userid);
  	        	kauu.setProgressId(insertBean.getId());
  	        	kauu.setFileName(fi.getFileName());
  	        	kauu.setFilePath(fi.getFilePath());
  	        	iKgAssessmentActivityUserUploadService.insert(requestContext, kauu);
	        }
	        return allFilePath;
	      
	 }
}