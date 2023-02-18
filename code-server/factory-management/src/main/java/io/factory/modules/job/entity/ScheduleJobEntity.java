







package io.factory.modules.job.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;






@Data
@TableName("schedule_job")
public class ScheduleJobEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	


    public static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";

	


	@TableId
	private Long jobId;

	


	@NotBlank(message="bean名称不能为空")
	private String beanName;

	


	private String params;

	


	@NotBlank(message="cron表达式不能为空")
	private String cronExpression;

	


	private Integer status;

	


	private String remark;

	


	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date createTime;

}
