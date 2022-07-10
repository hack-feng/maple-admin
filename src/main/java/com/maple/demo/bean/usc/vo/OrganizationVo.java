package com.maple.demo.bean.usc.vo;

import com.maple.demo.bean.usc.Organization;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author ZhangFZ
 * @date 2019/11/14 11:19
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class OrganizationVo extends Organization {
    private static final long serialVersionUID = -5407130387582379833L;

    @ApiModelProperty(value = "父节点名称")
    private String parentName;

    @ApiModelProperty(value = "默认查询页数为第一页")
    private long current = 1;

    @ApiModelProperty(value = "默认每页查询条数为10条")
    private long size = 10;
}
