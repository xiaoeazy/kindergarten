package cn.huan.kindergarten.service.impl;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import cn.huan.kindergarten.dto.KgAssessmentType;
import cn.huan.kindergarten.dto.KgDownload;
import cn.huan.kindergarten.service.IKgDownloadService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgDownloadServiceImpl extends BaseServiceImpl<KgDownload> implements IKgDownloadService{
	@Override
	public int adminQueryCount(IRequest request,KgDownload record) {
		return  mapper.selectCount(record);
	}
}