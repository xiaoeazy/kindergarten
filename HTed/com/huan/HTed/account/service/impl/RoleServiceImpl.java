package com.huan.HTed.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huan.HTed.account.dto.Role;
import com.huan.HTed.account.dto.UserRole;
import com.huan.HTed.account.mapper.RoleMapper;
import com.huan.HTed.account.service.IRoleService;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl extends BaseServiceImpl<Role> implements IRoleService{
	@Autowired
    protected RoleMapper roleMapper;
	
	public List<Role> adminqueryNotHave(IRequest request,UserRole userRole){
		return roleMapper.adminqueryNotHave(userRole);
	}
	
	public List<Role> adminQueryHave(IRequest request,UserRole userRole){
		return roleMapper.adminQueryHave(userRole);
	}
}