package com.maple.demo.bean.common;

import java.util.ArrayList;
import java.util.List;

/**
 * 全局字段
 *
 * @author Administrator
 */
public class GlobalField {

    /**
     * 登录时可输错密码次数
     */
    public static final Integer FAILNUM = 5;

    /**
     * 前后端 Integer 类型 对应的转换 true 为1 false 为 0
     */
    public static final Integer TRUE = 1;
    public static final Integer FALSE = 0;

    /**
     * 状态 可用 与 冻结（停用） String 类型
     */
    public static final String USABLE = "1";
    public static final String BLOCK_UP = "0";

    /**
     * 系统管理员帐号
     */
    public static final String SYSTEM_ADMIN = "admin";

    /**
     * 前台传递Token存放在Header里面对应的字段
     */
    public static final String TOKEN_AUTHORIZATION = "Authorization";

    /**
     * 空集合List （为了避免前端拿到null值而报错返回一个空集合）
     */
    public static final List EMPTY_LIST = new ArrayList();

    /**
     * 响应成功状态码 200
     */
    public static final int SUCCESS = 200;

    /**
     * 删除状态-未删除
     */
    public static final int UNDELETE_STATUS = 0;

    /**
     * 经销商默认type和类型
     */
    public static final Long PARENTID = 2L;
}
