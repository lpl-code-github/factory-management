







package io.factory.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.modules.sys.entity.SysUserRoleEntity;

import java.util.List;








public interface SysUserRoleService extends IService<SysUserRoleEntity> {

	void saveOrUpdate(Long userId, List<Long> roleIdList);

	


	List<Long> queryRoleIdList(Long userId);

	


	int deleteBatch(Long[] roleIds);
}
