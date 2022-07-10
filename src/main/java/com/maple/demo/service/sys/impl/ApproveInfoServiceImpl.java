package com.maple.demo.service.sys.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.demo.bean.sys.ApproveInfo;
import com.maple.demo.mapper.sys.ApproveInfoMapper;
import com.maple.demo.service.sys.IApproveInfoService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统全局-审批流程 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class ApproveInfoServiceImpl extends ServiceImpl<ApproveInfoMapper, ApproveInfo> implements IApproveInfoService {

}
