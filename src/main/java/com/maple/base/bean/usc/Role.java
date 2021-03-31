package com.maple.base.bean.usc;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户中心-角色表
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("usc_role")
@ApiModel(value="Role对象", description="用户中心-角色表")
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "说明")
    private String comment;

    @ApiModelProperty(value = "角色权限")
    private String menuList;

    @ApiModelProperty(value = "角色名称")
    private String name;

    @ApiModelProperty(value = "状态")
    private String status;

    @ApiModelProperty(value = "是否删除（0：未删除，1：已删除）")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "是否是系统内置角色(0：否，1：是)")
    private Boolean isSystem;

    @ApiModelProperty(value = "创建人id")
    private Long createId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "创建人姓名")
    private String createName;

    @ApiModelProperty(value = "修改人id")
    private Long updateId;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    @ApiModelProperty(value = "最后修改人姓名")
    private String updateName;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
