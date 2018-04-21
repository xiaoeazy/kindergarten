package cn.huan.kindergarten.service;

import java.util.List;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;
import com.huan.HTed.system.service.IBaseService;
import cn.huan.kindergarten.dto.KgAssessmentActivity;

public interface IKgAssessmentActivityService extends IBaseService<KgAssessmentActivity>, ProxySelf<IKgAssessmentActivityService>{

	public List<KgAssessmentActivity> selectWithOtherInfo(IRequest request, KgAssessmentActivity condition, int pageNum,int pageSize);

	public int adminQueryCount(IRequest request, KgAssessmentActivity record);

}