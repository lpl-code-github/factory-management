







package io.factory.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.factory.modules.sys.entity.SysRoleMenuEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;






@Mapper
public interface SysRoleMenuDao extends BaseMapper<SysRoleMenuEntity> {

	


	List<Long> queryMenuIdList(Long roleId);

	


	int deleteBatch(Long[] roleIds);
}
