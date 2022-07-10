package com.maple.demo.service.usc;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.demo.bean.usc.UserRole;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户中心-用户角色关联表 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
public interface IUserRoleService extends IService<UserRole> {
    IPage<UserRole> getList(Page<UserRole> page, UserRole userRole);

    boolean saveOrUpdateData(UserRole userRole);
}
