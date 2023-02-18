







package io.factory.modules.app.controller;


import io.factory.common.utils.R;
import io.factory.modules.app.service.UserService;
import io.factory.modules.app.utils.JwtUtils;
import io.factory.common.validator.ValidatorUtils;
import io.factory.modules.app.form.LoginForm;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;






@RestController
@RequestMapping("/app")
@Api("APP登录接口")
public class AppLoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private JwtUtils jwtUtils;

    


    @PostMapping("login")
    @ApiOperation("登录")
    public R login(@RequestBody LoginForm form){
        
        ValidatorUtils.validateEntity(form);

        
        long userId = userService.login(form);

        
        String token = jwtUtils.generateToken(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("userId", userId);
        map.put("expire", jwtUtils.getExpire());

        return R.ok(map);
    }

}
