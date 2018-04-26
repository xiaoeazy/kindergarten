package cn.huan.kindergarten.service.impl;

import com.github.pagehelper.PageHelper;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.KgAssessmentActivity;
import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.mapper.KgAssessmentActivityMapper;
import cn.huan.kindergarten.mapper.KgNewsMapper;
import cn.huan.kindergarten.service.IKgAssessmentActivityService;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgAssessmentActivityServiceImpl extends BaseServiceImpl<KgAssessmentActivity> implements IKgAssessmentActivityService{
	@Autowired
	private KgAssessmentActivityMapper kgAssessmentActivityMapper;

	@Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<KgAssessmentActivity> selectWithOtherInfo(IRequest request,  KgAssessmentActivity condition ,int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return kgAssessmentActivityMapper.selectWithOtherInfo( condition);
    }
	
	@Override
	public int adminQueryCount(IRequest request,KgAssessmentActivity record) {
		return  kgAssessmentActivityMapper.adminQueryCount(record);
	}
}