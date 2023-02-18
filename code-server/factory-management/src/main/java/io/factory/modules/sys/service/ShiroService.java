







package io.factory.modules.sys.service;

import io.factory.modules.sys.entity.SysUserEntity;
import io.factory.modules.sys.entity.SysUserTokenEntity;

import java.util.Set;






public interface ShiroService {
    


    Set<String> getUserPermissions(long userId);

    SysUserTokenEntity queryByToken(String token);

    



    SysUserEntity queryUser(Long userId);
}
