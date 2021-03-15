package com.maple.demo.service.sys.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.demo.bean.sys.CoreCategory;
import com.maple.demo.mapper.sys.CoreCategoryMapper;
import com.maple.demo.service.sys.ICoreCategoryService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统全局-系统基础数据表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class CoreCategoryServiceImpl extends ServiceImpl<CoreCategoryMapper, CoreCategory> implements ICoreCategoryService {

}
