







package io.factory.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.factory.common.utils.R;
import io.factory.modules.sys.dao.SysUserTokenDao;
import io.factory.modules.sys.entity.SysUserTokenEntity;
import io.factory.modules.sys.oauth2.TokenGenerator;
import io.factory.modules.sys.service.SysUserTokenService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Objects;


@Service("sysUserTokenService")
public class SysUserTokenServiceImpl extends ServiceImpl<SysUserTokenDao, SysUserTokenEntity> implements SysUserTokenService {
	
	private final static int EXPIRE = 3600 * 12;


	@Override
	public R createToken(long userId) {
		
		String token = TokenGenerator.generateValue();

		
		Date now = new Date();
		
		Date expireTime = new Date(now.getTime() + EXPIRE * 1000);

		
		SysUserTokenEntity tokenEntity = this.getById(userId);
		if(tokenEntity == null){
			tokenEntity = new SysUserTokenEntity();
			tokenEntity.setUserId(userId);
			tokenEntity.setToken(token);
			tokenEntity.setUpdateTime(now);
			tokenEntity.setExpireTime(expireTime);

			
			this.save(tokenEntity);
		}else{
			tokenEntity.setToken(token);
			tokenEntity.setUpdateTime(now);
			tokenEntity.setExpireTime(expireTime);

			
			this.updateById(tokenEntity);
		}

		R r = Objects.requireNonNull(Objects.requireNonNull(R.ok().put("token", token)).put("expire", EXPIRE)).put("userId", userId);

		return r;
	}

	@Override
	public void logout(long userId) {
		
		String token = TokenGenerator.generateValue();

		
		SysUserTokenEntity tokenEntity = new SysUserTokenEntity();
		tokenEntity.setUserId(userId);
		tokenEntity.setToken(token);
		this.updateById(tokenEntity);
	}
}
