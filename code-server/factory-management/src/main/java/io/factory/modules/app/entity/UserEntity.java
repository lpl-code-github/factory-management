







package io.factory.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;







@Data
@TableName("tb_user")
public class UserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	


	@TableId
	private Long userId;
	


	private String username;
	


	private String mobile;
	


	private String password;
	


	private Date createTime;

}
