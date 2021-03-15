package com.maple.demo.bean.usc.vo;

import com.maple.demo.bean.usc.Organization;
import com.maple.demo.bean.usc.User;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.List;

/**
 * <p>
 * 用户中心-用户信息表
 * </p>
 *
 * @author buzy
 * @since 2019-11-05
 */
@Data
@ApiModel(value="User对象", description="用户中心-用户信息表")
public class UserMenuVo {

    /**
     * 用户信息
     */
    private User user;

    /**
     * 用户标识
     */
    private String userAccount;

    /**
     * token信息
     */
    private String token;

    /**
     * 用户角色（多角色）
     */
    private String roles;

    /**
     * 用户菜单树
     */
    private List<MenuTreeVo> menuList;

    /**
     * 组织机构信息
     */
    private Organization organization;
}
