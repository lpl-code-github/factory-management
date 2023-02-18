package io.factory.modules.server.controller;

import io.factory.modules.server.dao.ClockDao;
import io.factory.modules.sys.dao.SysUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;









@RestController
@RequestMapping("charts")
public class EchartsController {
    @Autowired
    private ClockDao clockDao;

    @Autowired
    private SysUserDao sysUserDao;

    @PostMapping("/chuqing")
    public HashMap<String, List<Integer>> chuqing(@RequestBody  List<String> chuqing){
        HashMap<String, List<Integer>> result = new HashMap<>();
        Integer integer = sysUserDao.selectCount(null);
        ArrayList<Integer> integers1 = new ArrayList<Integer>();
        ArrayList<Integer> integers2 = new ArrayList<Integer>();
        for (String s : chuqing) {
            Integer chuqing1 = clockDao.chuqing(s);
            integers1.add(chuqing1);
            integers2.add(integer-chuqing1);

        }
        result.put("chuqing",integers1);
        result.put("queqing",integers2);

        return result;
    }

}
