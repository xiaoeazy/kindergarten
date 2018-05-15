package cn.huan.kindergarten.service.impl;

import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.KgQuestionmainitem;
import cn.huan.kindergarten.service.IKgQuestionmainitemService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgQuestionmainitemServiceImpl extends BaseServiceImpl<KgQuestionmainitem> implements IKgQuestionmainitemService{

}