package cn.huan.kindergarten.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;

import com.huan.HTed.attachment.exception.StoragePathNotExsitException;
import com.huan.HTed.attachment.exception.UniqueFileMutiException;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;

import cn.huan.kindergarten.bean.FileInfo;

public interface IIndexAssessmentService extends  ProxySelf<IIndexAssessmentService>{
	public List<FileInfo> assessmentUpload(IRequest requestContext,HttpServletRequest request,Long assessmentActivityId) throws StoragePathNotExsitException, UniqueFileMutiException, IOException, FileUploadException ;

}