package com.maple.base.service.sys.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.base.bean.sys.Message;
import com.maple.base.mapper.sys.MessageMapper;
import com.maple.base.service.sys.IMessageService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统全局-系统消息表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements IMessageService {

}
