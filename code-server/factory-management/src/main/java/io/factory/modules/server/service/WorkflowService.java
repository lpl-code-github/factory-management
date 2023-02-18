package io.factory.modules.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.common.utils.PageUtils;
import io.factory.modules.server.entity.WorkflowEntity;

import java.util.Map;








public interface WorkflowService extends IService<WorkflowEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

