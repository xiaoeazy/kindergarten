package cn.huan.kindergarten.service.impl;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import cn.huan.kindergarten.dto.KgAssessmentType;
import cn.huan.kindergarten.dto.KgQuestionsurvey;
import cn.huan.kindergarten.service.IKgQuestionsurveyService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgQuestionsurveyServiceImpl extends BaseServiceImpl<KgQuestionsurvey> implements IKgQuestionsurveyService{
	public int adminQueryCount(IRequest request,KgQuestionsurvey record) {
		return  mapper.selectCount(record);
	}
}