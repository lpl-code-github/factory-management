package io.factory.modules.server.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.factory.common.utils.PageUtils;
import io.factory.common.utils.R;
import io.factory.modules.server.entity.ClockEntity;
import io.factory.modules.server.service.ClockService;
import io.factory.modules.app.utils.JwtUtils;
import io.factory.modules.server.dao.ClockDao;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("server/clock")
public class ClockController {
    @Autowired
    private ClockService clockService;
    @Autowired
    private ClockDao clockDao;
    @Autowired
    private JwtUtils jwtUtils;


    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = clockService.queryPage(params);

        return R.ok().put("page", page);
    }


    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		ClockEntity clock = clockService.getById(id);

        return R.ok().put("clock", clock);
    }

    @RequestMapping("/shangban")
    public R shangban(@RequestBody ClockEntity clock, HttpServletRequest request){
        Integer userId = clock.getUserId();
        System.out.println(clock.getUserId());
        Date date = new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("YYYY-MM-dd");
        String format = dateFormat.format(date);

        QueryWrapper<ClockEntity> queryWrapper  = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        queryWrapper.like("create_at",format);
        Integer integer = clockDao.selectCount(queryWrapper);
        if (integer==0){
            clockService.save(clock);
            return R.ok();
        }
        return R.error("请勿重复打卡");

    }

    @RequestMapping("/xiaban")
    public R xiaban(@RequestBody ClockEntity clock, HttpServletRequest request){
        Integer userId = clock.getUserId();
        Date date = new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("YYYY-MM-dd");
        String format = dateFormat.format(date);

        QueryWrapper<ClockEntity> queryWrapper  = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId);
        queryWrapper.and(Wrapper -> Wrapper.like("create_at",format).or().like("update_at",format));
        ClockEntity clockEntity = clockDao.selectOne(queryWrapper);
        if (clockEntity ==null ){
            clockService.save(clock);
            return R.ok();
        }
        if (clockEntity.getUpdateAt()==null && clockEntity.getCreateAt()!=null){
            clockEntity.setUpdateAt(clock.getUpdateAt());
            clockService.updateById(clockEntity);
            return R.ok();
        }
        return R.error("请勿重复打卡");
    }


    public  String getCookies(HttpServletRequest request) {



        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token")) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }



    @RequestMapping("/update")
    public R update(@RequestBody ClockEntity clock){
		clockService.updateById(clock);

        return R.ok();
    }




    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		clockService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
