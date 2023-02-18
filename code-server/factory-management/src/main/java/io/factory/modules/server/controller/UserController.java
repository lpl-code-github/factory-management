package io.factory.modules.server.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.factory.modules.sys.dao.SysUserDao;
import io.factory.modules.sys.dao.SysUserRoleDao;
import io.factory.modules.sys.entity.SysUserEntity;
import io.factory.modules.sys.entity.SysUserRoleEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequestMapping("/user")
@RestController
public class UserController {
    @Autowired
    private SysUserDao userDao;
    @Autowired
    private SysUserRoleDao sysUserRoleDao;

    @GetMapping("/no-employee")
    public List<Map<String, Object>> getNoEmployee() {

        List<Map<String, Object>> result = new ArrayList<>();

        QueryWrapper<SysUserRoleEntity> sysUserRoleEntityQueryWrapper = new QueryWrapper<>();
        sysUserRoleEntityQueryWrapper.ne("role_id", 1);
        List<SysUserRoleEntity> sysUserRoleEntities = sysUserRoleDao.selectList(sysUserRoleEntityQueryWrapper);
        for (SysUserRoleEntity sysUserRoleEntity : sysUserRoleEntities) {
            Long userId = sysUserRoleEntity.getUserId();
            SysUserEntity userEntity = userDao.selectById(userId);
            if (userEntity==null){
                continue;
            }
            HashMap<String, Object> userInfo = new HashMap<>();
            userInfo.put("user_id", userEntity.getUserId());
            userInfo.put("username", userEntity.getUsername());
            result.add(userInfo);
        }

        return result;
    }
}
