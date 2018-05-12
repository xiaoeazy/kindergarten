package cn.huan.kindergarten.mapper;

import java.util.List;

import com.huan.HTed.account.dto.UserRole;
import com.huan.HTed.mybatis.common.Mapper;

import cn.huan.kindergarten.dto.Func;
import cn.huan.kindergarten.dto.RoleFunc;

public interface FuncMapper extends Mapper<Func>{
	public List<Func> rolequeryNotHave(RoleFunc roleFunc);
	
	public List<Func> roleQueryHave(RoleFunc roleFunc);
}