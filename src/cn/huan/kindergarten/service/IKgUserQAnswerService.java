package cn.huan.kindergarten.service;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;
import com.huan.HTed.system.service.IBaseService;
import cn.huan.kindergarten.dto.KgUserQAnswer;

public interface IKgUserQAnswerService extends IBaseService<KgUserQAnswer>, ProxySelf<IKgUserQAnswerService>{
	public int queryCount(IRequest request,KgUserQAnswer record);
}