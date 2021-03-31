package com.maple.base.service.usc;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.base.bean.usc.Role;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户中心-角色表 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
public interface IRoleService extends IService<Role> {
    IPage<Role> getList(Page<Role> page, Role role);

    boolean saveOrUpdateData(Role role);
}
