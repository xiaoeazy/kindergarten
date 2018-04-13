package com.huan.HTed.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huan.HTed.account.dto.Role;
import com.huan.HTed.account.dto.User;
import com.huan.HTed.account.dto.UserRole;
import com.huan.HTed.account.mapper.RoleMapper;
import com.huan.HTed.account.service.IRoleService;
import com.huan.HTed.account.service.IUserRoleService;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.dto.DTOStatus;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl extends BaseServiceImpl<Role> implements IRoleService{
	@Autowired
	private IUserRoleService userRoleService;
	@Autowired
    protected RoleMapper roleMapper;
	
	public List<Role> adminqueryNotHave(IRequest request,UserRole userRole){
		return roleMapper.adminqueryNotHave(userRole);
	}
	
	public List<Role> adminQueryHave(IRequest request,UserRole userRole){
		return roleMapper.adminQueryHave(userRole);
	}
	
	public int adminQueryCount(IRequest request,Role record) {
		return  mapper.selectCount(record);
	}
	
	public void adminDelete(IRequest request, List<Role> dto) {
		batchDelete(dto);
		for(Role role :dto) {
			 UserRole dr = new UserRole(); //这里先删除原先的角色 在添加新的
			 dr.setRoleId(role.getRoleId());
			 List<UserRole> orignalUserRole = userRoleService.select(request, dr);
			 for(UserRole ur :orignalUserRole) {
				 ur.set__status(DTOStatus.DELETE);
			 }
			 userRoleService.batchUpdate(request, orignalUserRole);
		}
	}
}