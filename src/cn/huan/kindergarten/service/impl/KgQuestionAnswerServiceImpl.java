package cn.huan.kindergarten.service.impl;

import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.KgQuestionAnswer;
import cn.huan.kindergarten.service.IKgQuestionAnswerService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgQuestionAnswerServiceImpl extends BaseServiceImpl<KgQuestionAnswer> implements IKgQuestionAnswerService{

}