package com.huan.HTed.account.service;

import java.util.List;

import com.huan.HTed.account.dto.Role;
import com.huan.HTed.account.dto.UserRole;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;
import com.huan.HTed.system.service.IBaseService;

public interface IRoleService extends IBaseService<Role>, ProxySelf<IRoleService>{
	public List<Role> adminqueryNotHave(IRequest request,UserRole userRole);
	
	public List<Role> adminQueryHave(IRequest request,UserRole userRole);
	
	public int adminQueryCount(IRequest request,Role record);
	
	public void adminDelete(IRequest request, List<Role> dto) ;
}