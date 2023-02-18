







package io.factory.modules.app.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.factory.modules.app.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;






@Mapper
public interface UserDao extends BaseMapper<UserEntity> {

}
