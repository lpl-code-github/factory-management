package io.factory.modules.server.service.impl;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.Query;
import io.factory.modules.server.entity.ClockEntity;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.factory.modules.server.dao.ClockDao;
import io.factory.modules.server.service.ClockService;


@Service("clockService")
public class ClockServiceImpl extends ServiceImpl<ClockDao, ClockEntity> implements ClockService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<ClockEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", params.get("user_id"));
        IPage<ClockEntity> page = this.page(
                new Query<ClockEntity>().getPage(params),queryWrapper

        );

        return new PageUtils(page);
    }

}
