







package io.factory.modules.sys.controller;

import io.factory.common.utils.Constant;
import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import io.factory.common.validator.Assert;
import io.factory.common.annotation.SysLog;
import io.factory.common.validator.ValidatorUtils;
import io.factory.common.validator.group.AddGroup;
import io.factory.common.validator.group.UpdateGroup;
import io.factory.modules.sys.entity.SysUserEntity;
import io.factory.modules.sys.form.PasswordForm;
import io.factory.modules.sys.service.SysUserRoleService;
import io.factory.modules.sys.service.SysUserService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;






@RestController
@RequestMapping("/sys/user")
public class SysUserController extends AbstractController {
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserRoleService sysUserRoleService;


	


	@GetMapping("/list")
	@RequiresPermissions("sys:user:list")
	public R list(@RequestParam Map<String, Object> params){
		
		if(getUserId() != Constant.SUPER_ADMIN){
			params.put("createUserId", getUserId());
		}
		PageUtils page = sysUserService.queryPage(params);

		return R.ok().put("page", page);
	}

	


	@GetMapping("/info")
	public R info(){
		return R.ok().put("user", getUser());
	}

	


	@SysLog("修改密码")
	@PostMapping("/password")
	public R password(@RequestBody PasswordForm form){
		Assert.isBlank(form.getNewPassword(), "新密码不为能空");

		
		String password = new Sha256Hash(form.getPassword(), getUser().getSalt()).toHex();
		
		String newPassword = new Sha256Hash(form.getNewPassword(), getUser().getSalt()).toHex();

		
		boolean flag = sysUserService.updatePassword(getUserId(), password, newPassword);
		if(!flag){
			return R.error("原密码不正确");
		}

		return R.ok();
	}

	


	@GetMapping("/info/{userId}")
	@RequiresPermissions("sys:user:info")
	public R info(@PathVariable("userId") Long userId){
		SysUserEntity user = sysUserService.getById(userId);

		
		List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
		user.setRoleIdList(roleIdList);

		return R.ok().put("user", user);
	}

	


	@SysLog("保存用户")
	@PostMapping("/save")
	@RequiresPermissions("sys:user:save")
	public R save(@RequestBody SysUserEntity user){
		ValidatorUtils.validateEntity(user, AddGroup.class);

		user.setCreateUserId(getUserId());
		sysUserService.saveUser(user);

		return R.ok();
	}

	


	@SysLog("修改用户")
	@PostMapping("/update")
	@RequiresPermissions("sys:user:update")
	public R update(@RequestBody SysUserEntity user){
		if (user.getUserId() ==1){
			return R.error("不允许修改管理员");
		}
		ValidatorUtils.validateEntity(user, UpdateGroup.class);

		user.setCreateUserId(getUserId());
		sysUserService.update(user);

		return R.ok();
	}

	


	@SysLog("删除用户")
	@PostMapping("/delete")
	@RequiresPermissions("sys:user:delete")
	public R delete(@RequestBody Long[] userIds){
		if(ArrayUtils.contains(userIds, 1L)){
			return R.error("系统管理员不能删除");
		}

		if(ArrayUtils.contains(userIds, getUserId())){
			return R.error("当前用户不能删除");
		}

		sysUserService.deleteBatch(userIds);

		return R.ok();
	}
}
