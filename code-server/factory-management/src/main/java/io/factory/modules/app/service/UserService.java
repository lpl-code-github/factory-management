







package io.factory.modules.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.factory.modules.app.entity.UserEntity;
import io.factory.modules.app.form.LoginForm;






public interface UserService extends IService<UserEntity> {

	UserEntity queryByMobile(String mobile);

	




	long login(LoginForm form);
}
