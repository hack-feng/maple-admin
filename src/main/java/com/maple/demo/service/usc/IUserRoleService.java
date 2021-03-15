package com.maple.demo.service.usc;

import com.baomidou.mybatisplus.extension.service.IService;
import com.maple.demo.bean.usc.UserRole;

import java.util.List;

/**
 * <p>
 * 用户中心-用户角色关联表 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
public interface IUserRoleService extends IService<UserRole> {

    void deleteByRoleId(Long roleId);

    void deleteByRoleIdList(List<Long> idList);
}
