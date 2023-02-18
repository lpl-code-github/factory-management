package io.factory.modules.server.dao;

import io.factory.modules.server.entity.TestEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;








@Mapper
public interface TestDao extends BaseMapper<TestEntity> {

}
