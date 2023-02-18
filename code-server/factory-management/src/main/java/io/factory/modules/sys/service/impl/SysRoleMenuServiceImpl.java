







package io.factory.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.factory.modules.sys.dao.SysRoleMenuDao;
import io.factory.modules.sys.entity.SysRoleMenuEntity;
import io.factory.modules.sys.service.SysRoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;








@Service("sysRoleMenuService")
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuDao, SysRoleMenuEntity> implements SysRoleMenuService {

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void saveOrUpdate(Long roleId, List<Long> menuIdList) {
		
		deleteBatch(new Long[]{roleId});

		if(menuIdList.size() == 0){
			return ;
		}

		
		for(Long menuId : menuIdList){
			SysRoleMenuEntity sysRoleMenuEntity = new SysRoleMenuEntity();
			sysRoleMenuEntity.setMenuId(menuId);
			sysRoleMenuEntity.setRoleId(roleId);

			this.save(sysRoleMenuEntity);
		}
	}

	@Override
	public List<Long> queryMenuIdList(Long roleId) {
		return baseMapper.queryMenuIdList(roleId);
	}

	@Override
	public int deleteBatch(Long[] roleIds){
		return baseMapper.deleteBatch(roleIds);
	}

}
