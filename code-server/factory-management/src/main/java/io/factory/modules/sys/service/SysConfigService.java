







package io.factory.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.common.utils.PageUtils;
import io.factory.modules.sys.entity.SysConfigEntity;

import java.util.Map;






public interface SysConfigService extends IService<SysConfigEntity> {

	PageUtils queryPage(Map<String, Object> params);

	


	public void saveConfig(SysConfigEntity config);

	


	public void update(SysConfigEntity config);

	


	public void updateValueByKey(String key, String value);

	


	public void deleteBatch(Long[] ids);

	




	public String getValue(String key);

	




	public <T> T getConfigObject(String key, Class<T> clazz);

}
