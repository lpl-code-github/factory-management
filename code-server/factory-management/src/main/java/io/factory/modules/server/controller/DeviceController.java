package io.factory.modules.server.controller;

import java.util.Arrays;
import java.util.Map;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import io.factory.modules.server.entity.DeviceEntity;
import io.factory.modules.server.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;









@RestController
@RequestMapping("server/device")
public class DeviceController {
    @Autowired
    private DeviceService deviceService;

    


    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = deviceService.queryPage(params);
        return R.ok().put("page", page);
    }


    


    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		DeviceEntity device = deviceService.getById(id);
        return R.ok().put("device", device);
    }

    


    @RequestMapping("/save")
    public R save(@RequestBody DeviceEntity device){
		deviceService.save(device);
        return R.ok();
    }

    


    @RequestMapping("/update")
    public R update(@RequestBody DeviceEntity device){
		deviceService.updateById(device);
        return R.ok();
    }

    


    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		deviceService.removeByIds(Arrays.asList(ids));
        return R.ok();
    }

}
