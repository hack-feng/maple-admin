package com.maple.base.service.web.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.base.bean.web.Template;
import com.maple.base.mapper.web.TemplateMapper;
import com.maple.base.service.web.ITemplateService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 网站管理-模板表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class TemplateServiceImpl extends ServiceImpl<TemplateMapper, Template> implements ITemplateService {

}
