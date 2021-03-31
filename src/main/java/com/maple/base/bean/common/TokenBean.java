package com.maple.base.bean.common;

import lombok.Data;

/**
 * @author ZhangFZ
 * @date 2019/12/12 16:10
 **/
@Data
public class TokenBean {

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 用户真实姓名
     */
    private String userName;

    /**
     * 用户登录帐号
     */
    private String account;

    /**
     * 角色拼接字符串
     */
    private String roleList;

    /**
     * 组织机构id
     */
    private Long orgId;

    /**
     * 组织机构名称
     */
    private String orgName;

    /**
     * 是否可见批号和所在地（0：否，1：是）
     */
    private Boolean isVisibleLocation;

}
