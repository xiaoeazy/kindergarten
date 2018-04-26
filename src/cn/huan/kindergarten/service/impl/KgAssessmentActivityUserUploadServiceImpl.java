package cn.huan.kindergarten.service.impl;

import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.KgAssessmentActivityUserUpload;
import cn.huan.kindergarten.service.IKgAssessmentActivityUserUploadService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgAssessmentActivityUserUploadServiceImpl extends BaseServiceImpl<KgAssessmentActivityUserUpload> implements IKgAssessmentActivityUserUploadService{

}