package com.maple.base.bean.usc.vo;

import com.maple.base.bean.usc.User;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author ZhangFZ
 * @date 2020/9/10 13:29
 **/
@EqualsAndHashCode(callSuper = true)
@Data
public class UserVo extends User {

    /**
     * 角色id列表
     */
    List<Long> roleIds;

    /**
     * 角色Id
     */
    String roleIdList;

    /**
     * 经销商名称
     */
    String orgName;

    /**
     * 新密码
     */
    String newPwd;

    /**
     * 旧密码
     */
    String oldPwd;

    /**
     * 验证码
     */
    int code;

    /**
     * 角色下的菜单
     */
    String menuList;

    /**
     * 角色名称
     */
    String roleNames;
}
