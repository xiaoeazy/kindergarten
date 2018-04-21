package cn.huan.kindergarten.mapper;

import java.util.List;

import com.huan.HTed.mybatis.common.Mapper;

import cn.huan.kindergarten.dto.KgAssessmentActivity;

public interface KgAssessmentActivityMapper extends Mapper<KgAssessmentActivity>{
	public List<KgAssessmentActivity> selectWithOtherInfo( KgAssessmentActivity condition);
	
	public Integer adminQueryCount( KgAssessmentActivity condition);
}