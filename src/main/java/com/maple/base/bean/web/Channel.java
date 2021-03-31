package com.maple.base.bean.web;

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
 * 网站管理-栏目表
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("web_channel")
@ApiModel(value="Channel对象", description="网站管理-栏目表")
public class Channel extends Model<Channel> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "栏目自身url")
    private String url;

    @ApiModelProperty(value = "栏目自身模板Id")
    private Long templateId;

    @ApiModelProperty(value = "栏目文章模板Id")
    private Long articleTemplateId;

    @ApiModelProperty(value = "删除标记")
    private Integer isDelete;

    @ApiModelProperty(value = "创建人")
    private Long createId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "修改人")
    private Long updateId;

    @ApiModelProperty(value = "修改时间")
    private Date updateTime;

    @ApiModelProperty(value = "背景图片地址")
    private String backgroundImage;

    @ApiModelProperty(value = "该栏目是否需要在首页展示")
    private Integer showIndexFlag;

    @ApiModelProperty(value = "栏目简介")
    private String summary;

    @ApiModelProperty(value = "创建人姓名")
    private String createName;

    @ApiModelProperty(value = "最后修改人姓名")
    private String updateName;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
