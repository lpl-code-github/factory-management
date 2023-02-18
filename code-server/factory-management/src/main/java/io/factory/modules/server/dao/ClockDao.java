package io.factory.modules.server.dao;

import io.factory.modules.server.entity.ClockEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;








@Mapper
public interface ClockDao extends BaseMapper<ClockEntity> {
    @Select("SELECT COUNT(*) \n" +
            "FROM clock\n" +
            "WHERE create_at is NOT NULL \n" +
            "AND update_at is not NULL\n" +
            "AND (DATE_FORMAT(create_at,'%Y-%m-%d')  = #{param} OR DATE_FORMAT(update_at,'%Y-%m-%d')  = #{param})")
    public Integer chuqing(@Param("param") String param);
}
