package io.factory.modules.server.service.impl;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.Query;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.factory.modules.server.dao.WorkflowDao;
import io.factory.modules.server.entity.WorkflowEntity;
import io.factory.modules.server.service.WorkflowService;
import org.springframework.util.StringUtils;


@Service
public class WorkflowServiceImpl extends ServiceImpl<WorkflowDao, WorkflowEntity> implements WorkflowService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<WorkflowEntity> wrapper = new QueryWrapper<>();
        System.out.println(!params.get("username").equals("admin"));
        if (!StringUtils.isEmpty(params.get("username"))) {
            if (!params.get("username").equals("admin")){
                wrapper.eq("username", params.get("username"));
            }
        }

        IPage<WorkflowEntity> page = this.page(
                new Query<WorkflowEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

}
