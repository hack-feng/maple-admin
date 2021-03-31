package com.maple.base.service.usc.impl;

import com.maple.base.bean.usc.Role;
import com.maple.base.mapper.usc.RoleMapper;
import com.maple.base.service.usc.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 用户中心-角色表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Override
    public IPage<Role> getList(Page<Role> page, Role role) {
        return super.baseMapper.selectPage(page, null);
    }

    @Override
    public boolean saveOrUpdateData(Role role) {
        // 如果数据id存在，则修改数据，否则，插入一条数据
        if(role.getId() != null){
            return super.baseMapper.updateById(role) > 0;
        }else{
            return super.baseMapper.insert(role) > 0;
        }
    }
}
