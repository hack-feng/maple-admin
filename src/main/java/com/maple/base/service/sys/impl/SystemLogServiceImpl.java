package com.maple.base.service.sys.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.base.bean.sys.SystemLog;
import com.maple.base.mapper.sys.SystemLogMapper;
import com.maple.base.service.sys.ISystemLogService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 日志信息-系统日志表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class SystemLogServiceImpl extends ServiceImpl<SystemLogMapper, SystemLog> implements ISystemLogService {

}
