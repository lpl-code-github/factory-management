







package io.factory.modules.job.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.factory.modules.job.entity.ScheduleJobEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;






@Mapper
public interface ScheduleJobDao extends BaseMapper<ScheduleJobEntity> {

	


	int updateBatch(Map<String, Object> map);
}
