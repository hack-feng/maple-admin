package com.maple.base.util.logger;

import com.maple.base.bean.common.GlobalConfig;

import java.lang.annotation.*;

/**
 * @author Maple
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogHelper {

    //日志类型（0：登录 1：业务 2：接口）
    GlobalConfig.logTypeEnum logType();
}