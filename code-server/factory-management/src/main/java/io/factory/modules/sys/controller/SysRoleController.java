







package io.factory.modules.sys.controller;

import io.factory.common.utils.Constant;
import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import io.factory.common.annotation.SysLog;
import io.factory.common.validator.ValidatorUtils;
import io.factory.modules.sys.entity.SysRoleEntity;
import io.factory.modules.sys.service.SysRoleMenuService;
import io.factory.modules.sys.service.SysRoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;






@RestController
@RequestMapping("/sys/role")
public class SysRoleController extends AbstractController {
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysRoleMenuService sysRoleMenuService;

	


	@GetMapping("/list")
	@RequiresPermissions("sys:role:list")
	public R list(@RequestParam Map<String, Object> params){
		
		if(getUserId() != Constant.SUPER_ADMIN){
			params.put("createUserId", getUserId());
		}

		PageUtils page = sysRoleService.queryPage(params);

		return R.ok().put("page", page);
	}

	


	@GetMapping("/select")
	@RequiresPermissions("sys:role:select")
	public R select(){
		Map<String, Object> map = new HashMap<>();

		
		if(getUserId() != Constant.SUPER_ADMIN){
			map.put("create_user_id", getUserId());
		}
		List<SysRoleEntity> list = (List<SysRoleEntity>) sysRoleService.listByMap(map);

		return R.ok().put("list", list);
	}

	


	@GetMapping("/info/{roleId}")
	@RequiresPermissions("sys:role:info")
	public R info(@PathVariable("roleId") Long roleId){
		SysRoleEntity role = sysRoleService.getById(roleId);

		
		List<Long> menuIdList = sysRoleMenuService.queryMenuIdList(roleId);
		role.setMenuIdList(menuIdList);

		return R.ok().put("role", role);
	}

	


	@SysLog("保存角色")
	@PostMapping("/save")
	@RequiresPermissions("sys:role:save")
	public R save(@RequestBody SysRoleEntity role){
		ValidatorUtils.validateEntity(role);

		role.setCreateUserId(getUserId());
		sysRoleService.saveRole(role);

		return R.ok();
	}

	


	@SysLog("修改角色")
	@PostMapping("/update")
	@RequiresPermissions("sys:role:update")
	public R update(@RequestBody SysRoleEntity role){
		ValidatorUtils.validateEntity(role);

		role.setCreateUserId(getUserId());
		sysRoleService.update(role);

		return R.ok();
	}

	


	@SysLog("删除角色")
	@PostMapping("/delete")
	@RequiresPermissions("sys:role:delete")
	public R delete(@RequestBody Long[] roleIds){
		sysRoleService.deleteBatch(roleIds);

		return R.ok();
	}
}
