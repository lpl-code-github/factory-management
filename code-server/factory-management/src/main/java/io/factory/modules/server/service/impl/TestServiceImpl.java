package io.factory.modules.server.service.impl;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.Query;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.factory.modules.server.dao.TestDao;
import io.factory.modules.server.entity.TestEntity;
import io.factory.modules.server.service.TestService;


@Service("testService")
public class TestServiceImpl extends ServiceImpl<TestDao, TestEntity> implements TestService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TestEntity> page = this.page(
                new Query<TestEntity>().getPage(params),
                new QueryWrapper<TestEntity>()
        );

        return new PageUtils(page);
    }

}
