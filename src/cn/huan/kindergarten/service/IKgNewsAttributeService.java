package cn.huan.kindergarten.service;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;
import com.huan.HTed.system.service.IBaseService;

import cn.huan.kindergarten.dto.KgNewsAttribute;

public interface IKgNewsAttributeService extends IBaseService<KgNewsAttribute>, ProxySelf<IKgNewsAttributeService>{
	public int adminQueryCount(IRequest request,KgNewsAttribute record);
}