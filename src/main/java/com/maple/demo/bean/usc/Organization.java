package com.maple.demo.bean.usc;

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
 * 用户中心-组织结构表
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("usc_organization")
@ApiModel(value="Organization对象", description="用户中心-组织结构表")
public class Organization extends Model<Organization> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "父id")
    private Long parentId;

    @ApiModelProperty(value = "机构名字")
    private String name;

    @ApiModelProperty(value = "地址")
    private String address;

    @ApiModelProperty(value = "备注")
    private String comment;

    @ApiModelProperty(value = "公司类型")
    private Integer type;

    @ApiModelProperty(value = "是否删除（0：未删除，1：已删除）")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建人id")
    private Long createId;

    @ApiModelProperty(value = "创建人姓名")
    private String createName;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "修改人id")
    private Long updateId;

    @ApiModelProperty(value = "最后修改人姓名")
    private String updateName;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    @ApiModelProperty(value = "公司状态（0 - 冻结、1 - 活动、2 - 关闭/注销）")
    private String status;

    @ApiModelProperty(value = "是否系统内置机构（0：否，1：是）")
    private Boolean isSystem;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
