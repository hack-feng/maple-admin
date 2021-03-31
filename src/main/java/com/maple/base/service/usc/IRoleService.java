package com.maple.base.service.usc;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.maple.base.bean.usc.Role;
import com.maple.base.bean.usc.vo.BatchVo;

import java.util.List;

/**
 * <p>
 * 用户中心-角色表 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
public interface IRoleService extends IService<Role> {
    IPage<Role> getList(Page<Role> page, Role role);

    List<Role> queryRoleNameList();

    void checkRoleInfo(Role role);

    void checkRoleInfo(Long id);

    void checkRoleInfo(List<Long> ids);

    boolean createRole(Role role);

    boolean updateRole(Role role);

    boolean deleteRoleById(Long id);

    void deleteRoleByIdList(List<Long> idList);

    boolean updateStatusBatch(BatchVo roleBatchVo);
}
