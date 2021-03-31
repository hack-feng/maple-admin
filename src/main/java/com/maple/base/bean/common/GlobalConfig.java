package com.maple.base.bean.common;

/**
 * 全局配置
 * @auther: zhangfz
 */
public class GlobalConfig {

    /**
     *  用户登录后储存在redis中的前缀
     */
    public static final String LOGIN_USER = "";

    /**
     * 用户储存在redis中的过期时间
     */
    public static final long EXPIRE_TIME = 30*60;

    /**
     * 生成token的私钥
     */
    public static final String SECRET = "xuyaohui";

    /**
     * 用户登录token保存在redis的key值
     * @param account 用户登录帐号
     * @return token保存在redis的key
     */
    public static String getRedisUserKey(String account){
        return "LOGIN_USER:" + account;
    }

    /**
     * 日志-日志类型
     */
    public static enum logTypeEnum{
        //登录
        LOGIN,
        //接口
        INTERFACE,
        //业务
        BUSINESS

    }

    /**
     * 日志-操作类型
     */
    public static enum operTypeEnum{
        SELECT,
        INSERT,
        UPDATE,
        DELETE
    }
}
