package io.factory.modules.server.controller;

import java.util.Arrays;
import java.util.Map;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import io.factory.modules.server.entity.TestEntity;
import io.factory.modules.server.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;









@RestController
@RequestMapping("server/test")
public class TestController {
    @Autowired
    private TestService testService;

    


    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = testService.queryPage(params);

        return R.ok().put("page", page);
    }


    


    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		TestEntity test = testService.getById(id);

        return R.ok().put("test", test);
    }

    


    @RequestMapping("/save")

    public R save(@RequestBody TestEntity test){
		testService.save(test);

        return R.ok();
    }

    


    @RequestMapping("/update")

    public R update(@RequestBody TestEntity test){
		testService.updateById(test);

        return R.ok();
    }

    


    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		testService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
