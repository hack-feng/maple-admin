package com.maple.demo.bean.sys;

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
 * 系统全局-审批流程记录表
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_approve_flow")
@ApiModel(value="ApproveFlow对象", description="系统全局-审批流程记录表")
public class ApproveFlow extends Model<ApproveFlow> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "审批模版id")
    private Long appTempId;

    @ApiModelProperty(value = "角色id")
    private Long roleId;

    @ApiModelProperty(value = "角色名称")
    private String roleName;

    @ApiModelProperty(value = "审批顺序")
    private Integer seq;

    @ApiModelProperty(value = "是否自动审批通过？（0 - 否，1-是）")
    private Integer isAutoApprove;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
