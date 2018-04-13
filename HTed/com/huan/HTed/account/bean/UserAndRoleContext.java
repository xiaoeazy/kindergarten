package com.huan.HTed.account.bean;

import java.util.List;

import com.huan.HTed.account.dto.User;
import com.huan.HTed.account.dto.UserRole;

public class UserAndRoleContext {
	private User user;
	private List<UserRole> userRoleList;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<UserRole> getUserRoleList() {
		return userRoleList;
	}
	public void setUserRoleList(List<UserRole> userRoleList) {
		this.userRoleList = userRoleList;
	}
	
}
