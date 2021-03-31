package com.maple.base.bean.sys;

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
 * 系统全局-系统基础数据表
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_core_category")
@ApiModel(value="CoreCategory对象", description="系统全局-系统基础数据表")
public class CoreCategory extends Model<CoreCategory> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "父级id（仅多级显示的时候使用）")
    private String parentId;

    @ApiModelProperty(value = "数据类型")
    private String dataType;

    @ApiModelProperty(value = "数据类型编码")
    private String dataTypeCode;

    @ApiModelProperty(value = "数据名称")
    private String dataName;

    @ApiModelProperty(value = "数据编码")
    private String dataCode;

    @ApiModelProperty(value = "描述")
    private String description;

    @ApiModelProperty(value = "创建人id")
    private Long createId;

    @ApiModelProperty(value = "修改人id")
    private Long updateId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    @ApiModelProperty(value = "创建人姓名")
    private String createName;

    @ApiModelProperty(value = "最后修改人姓名")
    private String updateName;

    @ApiModelProperty(value = "是否删除（0：未删除，1：已删除）")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "备注")
    private String comment;

    @ApiModelProperty(value = "排序")
    private Integer sortNum;

    @ApiModelProperty(value = "状态")
    private String status;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
