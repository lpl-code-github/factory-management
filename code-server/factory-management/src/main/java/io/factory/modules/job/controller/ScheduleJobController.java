







package io.factory.modules.job.controller;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import io.factory.common.annotation.SysLog;
import io.factory.common.validator.ValidatorUtils;
import io.factory.modules.job.entity.ScheduleJobEntity;
import io.factory.modules.job.service.ScheduleJobService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;








public class ScheduleJobController {
	@Autowired
	private ScheduleJobService scheduleJobService;

	


	@RequestMapping("/list")
	@RequiresPermissions("sys:schedule:list")
	public R list(@RequestParam Map<String, Object> params){
		PageUtils page = scheduleJobService.queryPage(params);

		return R.ok().put("page", page);
	}

	


	@RequestMapping("/info/{jobId}")
	@RequiresPermissions("sys:schedule:info")
	public R info(@PathVariable("jobId") Long jobId){
		ScheduleJobEntity schedule = scheduleJobService.getById(jobId);

		return R.ok().put("schedule", schedule);
	}

	


	@SysLog("保存定时任务")
	@RequestMapping("/save")
	@RequiresPermissions("sys:schedule:save")
	public R save(@RequestBody ScheduleJobEntity scheduleJob){
		ValidatorUtils.validateEntity(scheduleJob);

		scheduleJobService.saveJob(scheduleJob);

		return R.ok();
	}

	


	@SysLog("修改定时任务")
	@RequestMapping("/update")
	@RequiresPermissions("sys:schedule:update")
	public R update(@RequestBody ScheduleJobEntity scheduleJob){
		ValidatorUtils.validateEntity(scheduleJob);

		scheduleJobService.update(scheduleJob);

		return R.ok();
	}

	


	@SysLog("删除定时任务")
	@RequestMapping("/delete")
	@RequiresPermissions("sys:schedule:delete")
	public R delete(@RequestBody Long[] jobIds){
		scheduleJobService.deleteBatch(jobIds);

		return R.ok();
	}

	


	@SysLog("立即执行任务")
	@RequestMapping("/run")
	@RequiresPermissions("sys:schedule:run")
	public R run(@RequestBody Long[] jobIds){
		scheduleJobService.run(jobIds);

		return R.ok();
	}

	


	@SysLog("暂停定时任务")
	@RequestMapping("/pause")
	@RequiresPermissions("sys:schedule:pause")
	public R pause(@RequestBody Long[] jobIds){
		scheduleJobService.pause(jobIds);

		return R.ok();
	}

	


	@SysLog("恢复定时任务")
	@RequestMapping("/resume")
	@RequiresPermissions("sys:schedule:resume")
	public R resume(@RequestBody Long[] jobIds){
		scheduleJobService.resume(jobIds);

		return R.ok();
	}

}
