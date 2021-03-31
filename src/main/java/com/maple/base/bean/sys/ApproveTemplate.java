package com.maple.base.bean.sys;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统全局-审批模版
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_approve_template")
@ApiModel(value="ApproveTemplate对象", description="系统全局-审批模版")
public class ApproveTemplate extends Model<ApproveTemplate> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "审批模版名称")
    private String name;

    @ApiModelProperty(value = "审批模版类型")
    private String type;

    @ApiModelProperty(value = "审批模版状态")
    private String status;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
