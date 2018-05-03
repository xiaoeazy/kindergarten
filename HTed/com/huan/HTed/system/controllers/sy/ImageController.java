package com.huan.HTed.system.controllers.sy;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huan.HTed.attachment.exception.StoragePathNotExsitException;
import com.huan.HTed.attachment.exception.UniqueFileMutiException;
import com.huan.HTed.bean.UploadImgAjax;

@Controller
public class ImageController {
	private final String CAROUSEL_PAGE="carousel";
	private final String DOWNLOAD_PAGE="download";
	private final String NEWS_PAGE="news";
	/**
     * 图片上传提交页面.
     * 
     * @param request
     *            HttpServletRequest
     * @return Map 返回结果对象
     * @throws StoragePathNotExsitException
     *             存储路径不存在异常
     * @throws UniqueFileMutiException
     *             附件不唯一异常
     * @throws IOException
     * @throws FileUploadException
     */
    @RequestMapping(value = "/sys/config/upload", method = RequestMethod.POST, produces = "text/html")
    @ResponseBody
    public UploadImgAjax upload(HttpServletRequest request)
            throws StoragePathNotExsitException, UniqueFileMutiException, IOException, FileUploadException {
    	String type = request.getParameter("type");
    	String fileResourcesPath="";
    	if(type.equals(CAROUSEL_PAGE)) {
    		fileResourcesPath= "/resources/upload/carousel";
    	}else {
    		fileResourcesPath= "/resources/upload";
    	}
    	String file_path=request.getServletContext().getRealPath("/")+fileResourcesPath;
        File dir=new File(file_path);
        if(!dir.exists())
            dir.mkdir();
      
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        String imgName ="";
        for (FileItem fi : items) {
            if (fi.isFormField()) {
                fi.getFieldName();
                fi.getString();
            } else {
            	
//                String imgName = fi.getName();//
            	imgName = fi.getName();
                File tempFile = new File(file_path+'/'+imgName);
                if (imgName == null) {
//                    return "<script>window.parent.showUploadError('NO_FILE')</script>";
                	return new UploadImgAjax(false, "NO_FILE",null);
                } else {
                    int idx = imgName.lastIndexOf(".");
                    if (idx != -1) {
                        String ext = imgName.substring(idx + 1).toUpperCase();
                        ext = ext.toLowerCase();
                        if (!ext.equals("jpg") && !ext.equals("png") && !ext.equals("jpeg") && !ext.equals("gif")) {
                            // 错误信息
//                            return "<script>window.parent.showUploadError('FILE_TYPE_ERROR')</script>";
                        	return new UploadImgAjax(false, "FILE_TYPE_ERROR",null);
                        }
                    } else {
                        // 文件类型错误
//                        return "<script>window.parent.showUploadError('FILE_NO_SUFFIX')</script>";
                    	return new UploadImgAjax(false, "FILE_NO_SUFFIX",null);
                    }
                }
                try (InputStream is = fi.getInputStream(); OutputStream os = new FileOutputStream(tempFile)) {
                    IOUtils.copyLarge(is, os);
                }

            }
        }
//        return "<script>window.parent.showUploadSucessLogo()</script>";
    	return new UploadImgAjax(true,null, fileResourcesPath+"/"+imgName);
    }
    
    
    @RequestMapping(value = "/sys/config/file/upload", method = RequestMethod.POST, produces = "text/html")
    @ResponseBody
    public UploadImgAjax fileupload(HttpServletRequest request)
            throws StoragePathNotExsitException, UniqueFileMutiException, IOException, FileUploadException {
    	String type = request.getParameter("type");
    	String fileResourcesPath="";
    	 if(type.equals(DOWNLOAD_PAGE)){
    		 fileResourcesPath="/resources/upload/download";
    	}
    	String file_path=request.getServletContext().getRealPath("/") + fileResourcesPath;
        File dir=new File(file_path);
        if(!dir.exists())
            dir.mkdir();
      
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        String imgName ="";
        for (FileItem fi : items) {
            if (fi.isFormField()) {
                fi.getFieldName();
                fi.getString();
            } else {
            	
//                String imgName = fi.getName();//
            	imgName = fi.getName();
                File tempFile = new File(file_path+'/'+imgName);
                if (imgName == null) {
//                    return "<script>window.parent.showUploadError('NO_FILE')</script>";
                	return new UploadImgAjax(false, "NO_FILE",null);
                } else {
                    int idx = imgName.lastIndexOf(".");
                    if (idx != -1) {
                    } else {
                        // 文件类型错误
//                        return "<script>window.parent.showUploadError('FILE_NO_SUFFIX')</script>";
                    	return new UploadImgAjax(false, "FILE_NO_SUFFIX",null);
                    }
                }
                try (InputStream is = fi.getInputStream(); OutputStream os = new FileOutputStream(tempFile)) {
                    IOUtils.copyLarge(is, os);
                }

            }
        }
//        return "<script>window.parent.showUploadSucessLogo()</script>";
    	return new UploadImgAjax(true,null, fileResourcesPath+"/"+imgName);
    }
}
