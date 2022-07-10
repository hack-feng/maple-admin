package com.maple.demo.service.usc.impl;

import com.maple.demo.bean.usc.UserRole;
import com.maple.demo.mapper.usc.UserRoleMapper;
import com.maple.demo.service.usc.IUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 用户中心-用户角色关联表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {
    @Override
    public IPage<UserRole> getList(Page<UserRole> page, UserRole userRole) {
        return super.baseMapper.selectPage(page, null);
    }

    @Override
    public boolean saveOrUpdateData(UserRole userRole) {
        // 如果数据id存在，则修改数据，否则，插入一条数据
        if(userRole.getId() != null){
            return super.baseMapper.updateById(userRole) > 0;
        }else{
            return super.baseMapper.insert(userRole) > 0;
        }
    }
}
