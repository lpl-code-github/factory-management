







package io.factory.modules.sys.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.factory.common.utils.Constant;
import io.factory.common.utils.MapUtils;
import io.factory.modules.sys.dao.SysMenuDao;
import io.factory.modules.sys.entity.SysMenuEntity;
import io.factory.modules.sys.service.SysMenuService;
import io.factory.modules.sys.service.SysRoleMenuService;
import io.factory.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;


@Service("sysMenuService")
public class SysMenuServiceImpl extends ServiceImpl<SysMenuDao, SysMenuEntity> implements SysMenuService {
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleMenuService sysRoleMenuService;

	@Override
	public List<SysMenuEntity> queryListParentId(Long parentId, List<Long> menuIdList) {
		List<SysMenuEntity> menuList = queryListParentId(parentId);
		if(menuIdList == null){
			return menuList;
		}

		List<SysMenuEntity> userMenuList = new ArrayList<>();
		for(SysMenuEntity menu : menuList){
			if(menuIdList.contains(menu.getMenuId())){
				userMenuList.add(menu);
			}
		}
		return userMenuList;
	}

	@Override
	public List<SysMenuEntity> queryListParentId(Long parentId) {
		return baseMapper.queryListParentId(parentId);
	}

	@Override
	public List<SysMenuEntity> queryNotButtonList() {
		return baseMapper.queryNotButtonList();
	}

	@Override
	public List<SysMenuEntity> getUserMenuList(Long userId) {
		
		if(userId == Constant.SUPER_ADMIN){
			return getMenuList(null);
		}

		
		List<Long> menuIdList = sysUserService.queryAllMenuId(userId);
		return getMenuList(menuIdList);
	}

	




	private List<SysMenuEntity> getMenuList(List<Long> menuIdList) {
		
		List<SysMenuEntity> menus = this.baseMapper.selectList(new QueryWrapper<SysMenuEntity>()
				.in(Objects.nonNull(menuIdList), "menu_id", menuIdList).in("type", 0, 1));
		
		Collections.sort(menus);

		
		HashMap<Long, SysMenuEntity> menuMap = new HashMap<>(12);
		for (SysMenuEntity s : menus) {
			menuMap.put(s.getMenuId(), s);
		}
		
		Iterator<SysMenuEntity> iterator = menus.iterator();
		while (iterator.hasNext()) {
			SysMenuEntity menu = iterator.next();
			SysMenuEntity parent = menuMap.get(menu.getParentId());
			if (Objects.nonNull(parent)) {
				parent.getList().add(menu);
				
				iterator.remove();
			}
		}

		return menus;
	}

	@Override
	public void delete(Long menuId){
		
		this.removeById(menuId);
		
		sysRoleMenuService.removeByMap(new MapUtils().put("menu_id", menuId));
	}

	


	private List<SysMenuEntity> getAllMenuList(List<Long> menuIdList){
		
		List<SysMenuEntity> menuList = queryListParentId(0L, menuIdList);
		
		getMenuTreeList(menuList, menuIdList);

		return menuList;
	}

	


	private List<SysMenuEntity> getMenuTreeList(List<SysMenuEntity> menuList, List<Long> menuIdList){
		List<SysMenuEntity> subMenuList = new ArrayList<SysMenuEntity>();

		for(SysMenuEntity entity : menuList){
			
			if(entity.getType() == Constant.MenuType.CATALOG.getValue()){
				entity.setList(getMenuTreeList(queryListParentId(entity.getMenuId(), menuIdList), menuIdList));
			}
			subMenuList.add(entity);
		}

		return subMenuList;
	}
}
