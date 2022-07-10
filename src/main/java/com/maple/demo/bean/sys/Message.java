package com.maple.demo.bean.sys;

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
 * 系统全局-系统消息表
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_message")
@ApiModel(value="Message对象", description="系统全局-系统消息表")
public class Message extends Model<Message> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "接收人id")
    private Long receiverId;

    @ApiModelProperty(value = "发送人id")
    private Long createId;

    @ApiModelProperty(value = "发送人姓名")
    private String createName;

    @ApiModelProperty(value = "创建人所属机构id")
    private Long createOrgId;

    @ApiModelProperty(value = "创建人所属机构名称")
    private String createOrgName;

    @ApiModelProperty(value = "消息标题")
    private String title;

    @ApiModelProperty(value = "消息内容")
    private String content;

    @ApiModelProperty(value = "发送时间")
    private Date createTime;

    @ApiModelProperty(value = "是否已读（0：否  1：是）")
    private Integer isRead;

    @ApiModelProperty(value = "消息类型 (0:普通  1:审核  2:通知)")
    private Integer type;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
