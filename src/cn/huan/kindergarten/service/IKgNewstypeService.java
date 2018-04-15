package cn.huan.kindergarten.service;

import com.huan.HTed.account.dto.Role;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;
import com.huan.HTed.system.service.IBaseService;
import cn.huan.kindergarten.dto.KgNewstype;

public interface IKgNewstypeService extends IBaseService<KgNewstype>, ProxySelf<IKgNewstypeService>{
	public int adminQueryCount(IRequest request,KgNewstype record);
}