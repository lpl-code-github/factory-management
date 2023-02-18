package io.factory.modules.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.common.utils.PageUtils;
import io.factory.modules.server.entity.DeviceEntity;

import java.util.Map;








public interface DeviceService extends IService<DeviceEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

