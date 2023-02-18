







package io.factory.modules.job.utils;

import io.factory.common.utils.SpringContextUtils;
import io.factory.modules.job.entity.ScheduleJobEntity;
import io.factory.modules.job.entity.ScheduleJobLogEntity;
import io.factory.modules.job.service.ScheduleJobLogService;
import org.apache.commons.lang.StringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.lang.reflect.Method;
import java.util.Date;







public class ScheduleJob extends QuartzJobBean {
	private Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        ScheduleJobEntity scheduleJob = (ScheduleJobEntity) context.getMergedJobDataMap()
        		.get(ScheduleJobEntity.JOB_PARAM_KEY);

        
        ScheduleJobLogService scheduleJobLogService = (ScheduleJobLogService) SpringContextUtils.getBean("scheduleJobLogService");

        
        ScheduleJobLogEntity log = new ScheduleJobLogEntity();
        log.setJobId(scheduleJob.getJobId());
        log.setBeanName(scheduleJob.getBeanName());
        log.setParams(scheduleJob.getParams());
        log.setCreateTime(new Date());

        
        long startTime = System.currentTimeMillis();

        try {
            
        	logger.debug("任务准备执行，任务ID：" + scheduleJob.getJobId());

			Object target = SpringContextUtils.getBean(scheduleJob.getBeanName());
			Method method = target.getClass().getDeclaredMethod("run", String.class);
			method.invoke(target, scheduleJob.getParams());

			
			long times = System.currentTimeMillis() - startTime;
			log.setTimes((int)times);
			
			log.setStatus(0);

			logger.debug("任务执行完毕，任务ID：" + scheduleJob.getJobId() + "  总共耗时：" + times + "毫秒");
		} catch (Exception e) {
			logger.error("任务执行失败，任务ID：" + scheduleJob.getJobId(), e);

			
			long times = System.currentTimeMillis() - startTime;
			log.setTimes((int)times);

			
			log.setStatus(1);
			log.setError(StringUtils.substring(e.toString(), 0, 2000));
		}finally {
			scheduleJobLogService.save(log);
		}
    }
}
