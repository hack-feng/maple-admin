package com.maple.base.service.usc.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.base.bean.usc.UserRole;
import com.maple.base.mapper.usc.UserRoleMapper;
import com.maple.base.service.usc.IUserRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 用户中心-用户角色关联表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    /**
     * 根据roleId 删除角色信息
     * @param roleId 角色id
     */
    @Override
    public void deleteByRoleId(Long roleId) {
        QueryWrapper<UserRole> qw = new QueryWrapper<>();
        qw.eq("role_id", roleId);
        UserRole userRole = new UserRole();
        userRole.setRoleId(roleId);
        remove(qw);
        this.baseMapper.deleteById(roleId);
    }

    /**
     * 根据roleId 集合 批量删除角色信息
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByRoleIdList(List<Long> idList) {
        this.baseMapper.deleteBatchIds(idList);
    }
}
