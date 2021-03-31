package com.maple.base.service.web.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.base.bean.web.Channel;
import com.maple.base.mapper.web.ChannelMapper;
import com.maple.base.service.web.IChannelService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 网站管理-栏目表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class ChannelServiceImpl extends ServiceImpl<ChannelMapper, Channel> implements IChannelService {

}
