package cn.huan.kindergarten.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

import cn.huan.kindergarten.dto.KgNewsAttribute;
import cn.huan.kindergarten.service.IKgNewsAttributeService;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgNewsAttributeServiceImpl extends BaseServiceImpl<KgNewsAttribute> implements IKgNewsAttributeService{
	public int adminQueryCount(IRequest request,KgNewsAttribute record) {
		return  mapper.selectCount(record);
	}
}