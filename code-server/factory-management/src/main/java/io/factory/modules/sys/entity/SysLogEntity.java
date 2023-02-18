







package io.factory.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;







@Data
@TableName("sys_log")
public class SysLogEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	@TableId
	private Long id;
	
	private String username;
	
	private String operation;
	
	private String method;
	
	private String params;
	
	private Long time;
	
	private String ip;
	
	private Date createDate;

}
