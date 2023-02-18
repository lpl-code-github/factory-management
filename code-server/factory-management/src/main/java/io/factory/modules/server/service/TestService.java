package io.factory.modules.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.common.utils.PageUtils;
import io.factory.modules.server.entity.TestEntity;

import java.util.Map;








public interface TestService extends IService<TestEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

