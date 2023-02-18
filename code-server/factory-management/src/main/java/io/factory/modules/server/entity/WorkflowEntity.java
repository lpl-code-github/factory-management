package io.factory.modules.server.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;








@Data
@TableName("workflow")
public class WorkflowEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	


	@TableId
	private Integer id;
	


	private String name;
	


	private String description;
	


	private String username;
	


	private String responsible;
	


	private Date createAt;
	


	private Date updateAt;
	


	private String state;

}
