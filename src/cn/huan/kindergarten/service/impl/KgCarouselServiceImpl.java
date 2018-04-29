package cn.huan.kindergarten.service.impl;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import cn.huan.kindergarten.dto.KgAssessmentType;
import cn.huan.kindergarten.dto.KgCarousel;
import cn.huan.kindergarten.service.IKgCarouselService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgCarouselServiceImpl extends BaseServiceImpl<KgCarousel> implements IKgCarouselService{
	@Override
	public int adminQueryCount(IRequest request,KgCarousel record) {
		return  mapper.selectCount(record);
	}
}