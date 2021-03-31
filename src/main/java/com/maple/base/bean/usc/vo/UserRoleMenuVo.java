package com.maple.base.bean.usc.vo;

import com.maple.base.bean.usc.User;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.List;

/**
 * <p>
 * 用户中心-用户角色权限表
 * </p>
 *
 * @author WangXB
 * @since 2020-09-18
 */
@Data
@ApiModel(value="用户角色权限", description="用户中心-用户角色权限表")
public class UserRoleMenuVo extends User {

    List<Long> roleIds;

    List<String> roleNames;

    List<Long> menuIds;

    List<String> menuNames;

}
