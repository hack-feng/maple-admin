package com.maple.base.service.usc.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.base.bean.common.GlobalField;
import com.maple.base.bean.usc.Role;
import com.maple.base.bean.usc.vo.BatchVo;
import com.maple.base.mapper.usc.RoleMapper;
import com.maple.base.service.usc.IRoleService;
import com.maple.base.service.usc.IUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户中心-角色表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Autowired
    private IUserRoleService userRoleService;

    /**
     * 角色table栏数据分页展示
     *
     * @param page 分页信息
     * @param role 搜索查询参数
     */
    @Override
    public IPage<Role> getList(Page<Role> page, Role role) {
        Page<Role> rolePage = new Page<>(page.getCurrent(), page.getSize());
        QueryWrapper<Role> qw = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(role.getName())) {
            qw.like("name", role.getName());
        }
        if (StringUtils.isNotEmpty(role.getStatus())) {
            qw.eq("status", role.getStatus());
        }
        if (StringUtils.isNotEmpty(role.getComment())) {
            qw.like("comments", role.getComment());
        }
        qw.eq("is_deleted", false);
        qw.orderByAsc("sn");
        qw.eq("type", 1);
        rolePage = (Page<Role>) this.page(rolePage, qw);
        return rolePage;
    }

    /**
     * 角色树形菜单展示
     */
    @Override
    public List<Role> queryRoleNameList() {
        return this.baseMapper.selectList(new QueryWrapper<Role>().eq("is_deleted", false)
                .eq("status", GlobalField.USABLE));
    }

    /**
     * 校验角色唯一性
     *
     * @param role 角色名称
     */
    @Override
    public void checkRoleInfo(Role role) {
        role.setStatus(GlobalField.USABLE);
        if (StringUtils.isEmpty(role.getName())) {
            throw new RuntimeException("角色名称不能为空");
        }
        QueryWrapper<Role> qw = new QueryWrapper<>();
        if (role.getId() != null) {
            qw.ne("id", role.getId());
        }
        qw.eq("name", role.getName());
        Integer roleResultNum = this.baseMapper.selectCount(qw);
        if (roleResultNum > 0) {
            throw new RuntimeException("该角色名字已添加");
        }
    }

    @Override
    public void checkRoleInfo(Long id) {
        Role roleData = this.baseMapper.selectById(id);
        if (roleData!=null && roleData.getIsSystem()) {
            throw new RuntimeException("系统内置角色无法执行此操作");
        }
    }

    @Override
    public void checkRoleInfo(List<Long> ids) {
        if (CollectionUtils.isEmpty(ids)) {
            throw new RuntimeException("操作失败，传入数据错误");
        }
        List<Role> roleDataList = this.baseMapper.selectBatchIds(ids);
        for (Role roleData : roleDataList) {
            if (roleData.getIsSystem()) {
                throw new RuntimeException("存在系统内置角色无法执行此操作");
            }
        }
    }

    /**
     * 新增角色
     */
    @Override
    public boolean createRole(Role role) {
        role.setIsSystem(false);
        this.baseMapper.insert(role);
        return this.baseMapper.updateById(role) > 0;
    }

    /**
     * 修改用户角色
     */
    @Override
    public boolean updateRole(Role role) {
        Role roleData = this.baseMapper.selectById(role.getId());
        if (roleData != null && roleData.getIsSystem() && GlobalField.BLOCK_UP.equals(role.getStatus())) {
            throw new RuntimeException("系统内置角色无法禁用");
        }
        role.setIsSystem(null);
        return this.baseMapper.updateById(role) > 0;
    }

    /**
     * 角色删除
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteRoleById(Long id) {
        this.userRoleService.deleteByRoleId(id);
        return this.baseMapper.deleteById(id) > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteRoleByIdList(List<Long> idList) {
        userRoleService.deleteByRoleIdList(idList);
        this.baseMapper.deleteBatchIds(idList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateStatusBatch(BatchVo roleBatchVo) {

        List<Role> roleListDb = this.baseMapper.selectList(new QueryWrapper<Role>().in("id", roleBatchVo.getIdList()));
        for (Role role : roleListDb) {
            if (role.getIsSystem()) {
                throw new RuntimeException("存在系统内置角色无法执行此操作");
            }
        }

        List<Role> roleList = roleBatchVo.getIdList().stream().map((id) -> {
            Role role = new Role();
            role.setId(id);
            role.setStatus(roleBatchVo.getStatus());
            return role;
        }).collect(Collectors.toList());

        return this.updateBatchById(roleList);
    }
}
