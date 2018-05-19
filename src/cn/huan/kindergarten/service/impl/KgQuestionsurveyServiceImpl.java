package cn.huan.kindergarten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

import cn.huan.kindergarten.dto.KgQuestionAnswer;
import cn.huan.kindergarten.dto.KgQuestionmainitem;
import cn.huan.kindergarten.dto.KgQuestionsurvey;
import cn.huan.kindergarten.service.IKgQuestionAnswerService;
import cn.huan.kindergarten.service.IKgQuestionmainitemService;
import cn.huan.kindergarten.service.IKgQuestionsurveyService;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgQuestionsurveyServiceImpl extends BaseServiceImpl<KgQuestionsurvey> implements IKgQuestionsurveyService{
	@Autowired
	private IKgQuestionmainitemService  iKgQuestionmainitemService;
	@Autowired
	private IKgQuestionAnswerService iKgQuestionAnswerService;
	
	public int adminQueryCount(IRequest request,KgQuestionsurvey record) {
		return  mapper.selectCount(record);
	}
	
	public void addKgQuestionsurvey(IRequest request,KgQuestionsurvey record) {
		record.set__status("add");
		KgQuestionsurvey sqs = self().insert(request, record);
		for(KgQuestionmainitem ki :sqs.getQuestionItems()) {
			ki.setSid(sqs.getId());
			ki.set__status("add");
			KgQuestionmainitem kii = iKgQuestionmainitemService.insert(request, ki);
			for(KgQuestionAnswer kqa :ki.getqListItems()) {
				kqa.setQid(kii.getId());
				kqa.set__status("add");
			}
			iKgQuestionAnswerService.batchUpdate(request, ki.getqListItems());
		}
	}
}