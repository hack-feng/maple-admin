package com.maple.demo.bean.web;

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
 * 网站管理-文章表
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("web_article")
@ApiModel(value="Article对象", description="网站管理-文章表")
public class Article extends Model<Article> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "所属栏目ID")
    private Long channelId;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "副标题")
    private String subtitle;

    @ApiModelProperty(value = "图片")
    private String icon;

    @ApiModelProperty(value = "内容存放路径")
    private Long contentId;

    @ApiModelProperty(value = "简介")
    private String summary;

    @ApiModelProperty(value = "作者")
    private String author;

    @ApiModelProperty(value = "发表时间")
    private Date publishDate;

    @ApiModelProperty(value = "url")
    private String url;

    @ApiModelProperty(value = "转载出处")
    private String refSite;

    @ApiModelProperty(value = "转载链接")
    private String refLink;

    @ApiModelProperty(value = "状态 0=未提交,1=待审核,2=审核通过,3=审核拒绝")
    private Integer state;

    @ApiModelProperty(value = "重点新闻推荐")
    private Integer hot;

    @ApiModelProperty(value = "子栏目类型(监事会、董事会...)")
    private Integer type;

    @ApiModelProperty(value = "是否首页展示 0=否  1=是")
    private Integer showHome;

    @ApiModelProperty(value = "1、文章  2、文件")
    private Integer flag;

    @ApiModelProperty(value = "提交者")
    private Long submitter;

    @ApiModelProperty(value = "提交人姓名")
    private String submitName;

    @ApiModelProperty(value = "提交时间")
    private Date submitTime;

    @ApiModelProperty(value = "审核者")
    private Long auditor;

    @ApiModelProperty(value = "审核人姓名")
    private String auditName;

    @ApiModelProperty(value = "审核时间")
    private Date auditTime;

    @ApiModelProperty(value = "删除标记")
    private Integer isDelete;

    @ApiModelProperty(value = "创建人")
    private Long createId;

    @ApiModelProperty(value = "创建人姓名")
    private String createName;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "修改人")
    private Long updateId;

    @ApiModelProperty(value = "最后修改人姓名")
    private String updateName;

    @ApiModelProperty(value = "修改时间")
    private Date updateTime;

    @ApiModelProperty(value = "排序字段")
    private Integer sortFlag;

    @ApiModelProperty(value = "阅读量")
    private Long readCount;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
