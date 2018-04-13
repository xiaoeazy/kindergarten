package com.huan.HTed.account.service;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;
import com.huan.HTed.system.service.IBaseService;

import java.util.List;

import com.huan.HTed.account.dto.User;
import com.huan.HTed.account.dto.UserRole;

public interface IUserService extends IBaseService<User>, ProxySelf<IUserService>{
	public void adminUpdate(IRequest request ,User user,List<UserRole>  userRoleList);
	public void adminDelete(IRequest request ,List<User> list);
	public int adminQueryCount(IRequest request,User record);
}