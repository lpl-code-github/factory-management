







package io.factory.modules.sys.controller;


import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import io.factory.common.annotation.SysLog;
import io.factory.common.validator.ValidatorUtils;
import io.factory.modules.sys.entity.SysConfigEntity;
import io.factory.modules.sys.service.SysConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;






@RestController
@RequestMapping("/sys/config")
public class SysConfigController extends AbstractController {
	@Autowired
	private SysConfigService sysConfigService;

	


	@GetMapping("/list")
	@RequiresPermissions("sys:config:list")
	public R list(@RequestParam Map<String, Object> params){
		PageUtils page = sysConfigService.queryPage(params);

		return R.ok().put("page", page);
	}


	


	@GetMapping("/info/{id}")
	@RequiresPermissions("sys:config:info")
	public R info(@PathVariable("id") Long id){
		SysConfigEntity config = sysConfigService.getById(id);

		return R.ok().put("config", config);
	}

	


	@SysLog("保存配置")
	@PostMapping("/save")
	@RequiresPermissions("sys:config:save")
	public R save(@RequestBody SysConfigEntity config){
		ValidatorUtils.validateEntity(config);

		sysConfigService.saveConfig(config);

		return R.ok();
	}

	


	@SysLog("修改配置")
	@PostMapping("/update")
	@RequiresPermissions("sys:config:update")
	public R update(@RequestBody SysConfigEntity config){
		ValidatorUtils.validateEntity(config);

		sysConfigService.update(config);

		return R.ok();
	}

	


	@SysLog("删除配置")
	@PostMapping("/delete")
	@RequiresPermissions("sys:config:delete")
	public R delete(@RequestBody Long[] ids){
		sysConfigService.deleteBatch(ids);

		return R.ok();
	}

}
