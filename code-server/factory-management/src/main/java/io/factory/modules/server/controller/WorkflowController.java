package io.factory.modules.server.controller;

import java.util.Arrays;
import java.util.Map;

import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.factory.modules.server.entity.WorkflowEntity;
import io.factory.modules.server.service.WorkflowService;









@RestController
@RequestMapping("server/workflow")
public class WorkflowController {
    @Autowired
    private WorkflowService workflowService;

    


    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = workflowService.queryPage(params);

        return R.ok().put("page", page);
    }


    


    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		WorkflowEntity workflow = workflowService.getById(id);

        return R.ok().put("workflow", workflow);
    }

    


    @RequestMapping("/save")
    public R save(@RequestBody WorkflowEntity workflow){
		workflowService.save(workflow);

        return R.ok();
    }

    


    @RequestMapping("/update")
    public R update(@RequestBody WorkflowEntity workflow){
		workflowService.updateById(workflow);

        return R.ok();
    }

    


    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		workflowService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
