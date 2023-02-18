package io.factory.modules.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.common.utils.PageUtils;
import io.factory.modules.server.entity.ClockEntity;

import java.util.Map;

public interface ClockService extends IService<ClockEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

