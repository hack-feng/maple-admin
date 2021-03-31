package com.maple.base.bean.sys;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统全局-审批流程
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_approve_info")
@ApiModel(value="ApproveInfo对象", description="系统全局-审批流程")
public class ApproveInfo extends Model<ApproveInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "审批模版id")
    private Long appTempId;

    @ApiModelProperty(value = "模版id")
    private Long tempFlowId;

    @ApiModelProperty(value = "待审批的id")
    private Long refId;

    @ApiModelProperty(value = "版本号")
    private Integer version;

    @ApiModelProperty(value = "待审批的角色id")
    private Long roleId;

    @ApiModelProperty(value = "待审批的角色名称")
    private String roleName;

    @ApiModelProperty(value = "创建人id")
    private Long createId;

    @ApiModelProperty(value = "创建人名称")
    private String createName;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "审核人id")
    private Long approveId;

    @ApiModelProperty(value = "审核时间")
    private Date approveTime;

    @ApiModelProperty(value = "审批状态")
    private String approveStatus;

    @ApiModelProperty(value = "审批人名称")
    private String approveName;

    @ApiModelProperty(value = "审批意见")
    private String comment;

    @ApiModelProperty(value = "审批顺序")
    private Integer seq;

    @ApiModelProperty(value = "审批流状态")
    private String status;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
