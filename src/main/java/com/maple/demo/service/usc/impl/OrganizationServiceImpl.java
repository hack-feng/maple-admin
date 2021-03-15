package com.maple.demo.service.usc.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.demo.bean.usc.Organization;
import com.maple.demo.mapper.usc.OrganizationMapper;
import com.maple.demo.service.usc.IOrganizationService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户中心-组织结构表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {

}
