







package io.factory.modules.job.controller;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import io.factory.modules.job.entity.ScheduleJobLogEntity;
import io.factory.modules.job.service.ScheduleJobLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;






@RestController
@RequestMapping("/sys/scheduleLog")
public class ScheduleJobLogController {
	@Autowired
	private ScheduleJobLogService scheduleJobLogService;

	


	@RequestMapping("/list")
	@RequiresPermissions("sys:schedule:log")
	public R list(@RequestParam Map<String, Object> params){
		PageUtils page = scheduleJobLogService.queryPage(params);

		return R.ok().put("page", page);
	}

	


	@RequestMapping("/info/{logId}")
	public R info(@PathVariable("logId") Long logId){
		ScheduleJobLogEntity log = scheduleJobLogService.getById(logId);

		return R.ok().put("log", log);
	}
}
