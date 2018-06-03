package com.huan.HTed.account.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huan.HTed.account.dto.Role;
import com.huan.HTed.account.dto.User;
import com.huan.HTed.account.dto.UserRole;
import com.huan.HTed.account.mapper.UserMapper;
import com.huan.HTed.account.service.IUserRoleService;
import com.huan.HTed.account.service.IUserService;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.dto.DTOStatus;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService{
	@Autowired
	private IUserRoleService userRoleService;
	@Autowired
	private UserMapper userMapper;
	
	public void adminUpdate(IRequest request ,User user,List<UserRole> userRole) {
		 List<User> list = new ArrayList<User>();
		 list.add(user);
		 batchUpdate(request, list);
		 
		 UserRole dr = new UserRole(); //这里先删除原先的角色 在添加新的
		 dr.setUserId(list.get(0).getUserId());
		 if(userRole!=null) {
			 List<UserRole> orignalRole = userRoleService.select(request, dr);
			 for(UserRole ur :orignalRole) {
				 ur.set__status(DTOStatus.DELETE);
			 }
			 userRoleService.batchUpdate(request, orignalRole);
		
			 for(UserRole ur :userRole) {
				 ur.setUserId(list.get(0).getUserId());
				 ur.set__status(DTOStatus.ADD);
			 }
			 userRoleService.batchUpdate(request, userRole);
		 }
	}
	
	public void adminDelete(IRequest request ,List<User> list) {
		 batchDelete(list);
		 for(User user :list) {
			 UserRole dr = new UserRole(); //这里先删除原先的角色 在添加新的
			 dr.setUserId(user.getUserId());
			 List<UserRole> orignalUserRole = userRoleService.select(request, dr);
			 for(UserRole ur :orignalUserRole) {
				 ur.set__status(DTOStatus.DELETE);
			 }
			 userRoleService.batchUpdate(request, orignalUserRole);
		 }
	}
	
	public int adminQueryCount(IRequest request,User record) {
		return  mapper.selectCount(record);
	}
	
	@Override
	public User selectOne(IRequest request,User record) {
		if(record.getUserName()!=null)
			return mapper.selectOne(record);
		return null;
	}
	
	@Override
	public List<User> selectWithRole(IRequest request,Role dto) {
		
		return userMapper.selectWithRole(dto);
	}
	@Override
	public int adminQueryCountWithRole(IRequest request,Role dto) {
		return  userMapper.adminQueryCountWithRole(dto);
	}
	
}