







package io.factory.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.common.utils.R;
import io.factory.modules.sys.entity.SysUserTokenEntity;






public interface SysUserTokenService extends IService<SysUserTokenEntity> {

	



	R createToken(long userId);

	



	void logout(long userId);

}
