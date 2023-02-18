package io.factory.modules.server.service.impl;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.Query;
import io.factory.modules.server.entity.DeviceEntity;
import io.factory.modules.server.service.DeviceService;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.factory.modules.server.dao.DeviceDao;
import org.springframework.util.StringUtils;


@Service
public class DeviceServiceImpl extends ServiceImpl<DeviceDao, DeviceEntity> implements DeviceService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<DeviceEntity> wrapper =null;
        if (StringUtils.isEmpty(params.get("key"))) {
             wrapper = new QueryWrapper<DeviceEntity>();
        }else {

            wrapper = new QueryWrapper<DeviceEntity>().eq("name",params.get("key"));
        }

        IPage<DeviceEntity> page = this.page(
                new Query<DeviceEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

}
