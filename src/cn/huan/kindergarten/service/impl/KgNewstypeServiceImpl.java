package cn.huan.kindergarten.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgNewstypeService;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgNewstypeServiceImpl extends BaseServiceImpl<KgNewstype> implements IKgNewstypeService{
	public int adminQueryCount(IRequest request,KgNewstype record) {
		return  mapper.selectCount(record);
	}
}