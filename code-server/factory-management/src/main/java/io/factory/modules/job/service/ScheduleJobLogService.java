







package io.factory.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.common.utils.PageUtils;
import io.factory.modules.job.entity.ScheduleJobLogEntity;

import java.util.Map;






public interface ScheduleJobLogService extends IService<ScheduleJobLogEntity> {

	PageUtils queryPage(Map<String, Object> params);

}
