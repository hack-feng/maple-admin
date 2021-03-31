package com.maple.base.service.usc;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.base.bean.usc.Organization;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户中心-组织结构表（经销商信息） 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
public interface IOrganizationService extends IService<Organization> {
    IPage<Organization> getList(Page<Organization> page, Organization organization);

    boolean saveOrUpdateData(Organization organization);
}
