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
 * 用户中心-菜单权限表
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("usc_menu")
@ApiModel(value="Menu对象", description="用户中心-菜单权限表")
public class Menu extends Model<Menu> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "父节点id")
    private Long parentId;

    @ApiModelProperty(value = "菜单名称")
    private String name;

    @ApiModelProperty(value = "排序")
    private Long serial;

    private Boolean isTab;

    @ApiModelProperty(value = "资源路径")
    private String menuRoute;

    @ApiModelProperty(value = "访问路径")
    private String url;

    @ApiModelProperty(value = "菜单（menu） 按钮（button）")
    private String resType;

    @ApiModelProperty(value = "图标")
    private String icon;

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

    @ApiModelProperty(value = "修改时间")
    private Date updateTime;

    @ApiModelProperty(value = "最后修改人姓名")
    private String updateName;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
