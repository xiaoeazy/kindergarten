package cn.huan.kindergarten.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

import cn.huan.kindergarten.dto.Func;
import cn.huan.kindergarten.dto.RoleFunc;
import cn.huan.kindergarten.mapper.FuncMapper;
import cn.huan.kindergarten.service.IFuncService;

@Service
@Transactional(rollbackFor = Exception.class)
public class FuncServiceImpl extends BaseServiceImpl<Func> implements IFuncService{
	@Autowired
	private FuncMapper funcMapper;
	public List<Func> adminqueryNotHave(IRequest request,RoleFunc roleFunc){
		return funcMapper.rolequeryNotHave(roleFunc);
	}
	
	public List<Func> adminQueryHave(IRequest request,RoleFunc roleFunc){
		return funcMapper.roleQueryHave(roleFunc);
	}
}