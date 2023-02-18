







package io.factory.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.common.utils.PageUtils;
import io.factory.modules.job.entity.ScheduleJobEntity;

import java.util.Map;






public interface ScheduleJobService extends IService<ScheduleJobEntity> {

	PageUtils queryPage(Map<String, Object> params);

	


	void saveJob(ScheduleJobEntity scheduleJob);

	


	void update(ScheduleJobEntity scheduleJob);

	


	void deleteBatch(Long[] jobIds);

	


	int updateBatch(Long[] jobIds, int status);

	


	void run(Long[] jobIds);

	


	void pause(Long[] jobIds);

	


	void resume(Long[] jobIds);
}
