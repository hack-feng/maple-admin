package com.maple.base.service.usc.impl;

import com.maple.base.bean.usc.Organization;
import com.maple.base.mapper.usc.OrganizationMapper;
import com.maple.base.service.usc.IOrganizationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 用户中心-组织结构表（经销商信息） 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {
    @Override
    public IPage<Organization> getList(Page<Organization> page, Organization organization) {
        return super.baseMapper.selectPage(page, null);
    }

    @Override
    public boolean saveOrUpdateData(Organization organization) {
        // 如果数据id存在，则修改数据，否则，插入一条数据
        if(organization.getId() != null){
            return super.baseMapper.updateById(organization) > 0;
        }else{
            return super.baseMapper.insert(organization) > 0;
        }
    }
}
