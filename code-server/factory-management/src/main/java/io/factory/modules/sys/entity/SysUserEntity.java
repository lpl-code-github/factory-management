







package io.factory.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.factory.common.validator.group.AddGroup;
import io.factory.common.validator.group.UpdateGroup;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;






@Data
@TableName("sys_user")
public class SysUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	


	@TableId
	private Long userId;

	


	@NotBlank(message="用户名不能为空", groups = {AddGroup.class, UpdateGroup.class})
	private String username;

	


	@NotBlank(message="密码不能为空", groups = AddGroup.class)
	private String password;

	


	private String salt;

	


	@NotBlank(message="邮箱不能为空", groups = {AddGroup.class, UpdateGroup.class})
	@Email(message="邮箱格式不正确", groups = {AddGroup.class, UpdateGroup.class})
	private String email;

	


	private String mobile;

	


	private Integer status;

	


	@TableField(exist=false)
	private List<Long> roleIdList;

	


	private Long createUserId;

	


	private Date createTime;

}
