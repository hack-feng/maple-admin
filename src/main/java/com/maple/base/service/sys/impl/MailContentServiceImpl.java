package com.maple.base.service.sys.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.base.bean.sys.MailContent;
import com.maple.base.mapper.sys.MailContentMapper;
import com.maple.base.service.sys.IMailContentService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统全局-邮件发送内容表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class MailContentServiceImpl extends ServiceImpl<MailContentMapper, MailContent> implements IMailContentService {

}
