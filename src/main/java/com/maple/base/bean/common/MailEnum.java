package com.maple.base.bean.common;

import lombok.AllArgsConstructor;

/**
 * 邮件模板的名称
 * @author ZhangFZ
 * @date 2019-12-27 16:20
 */
public class MailEnum {

    /**
     * 邮件模板
     */
    @AllArgsConstructor
    public enum TemplateName {
        SUP_INQUIRE("供应商询价单邮件模板", "供应商询价单邮件模板");
        /**
         * 名称
         */
        public final String code;
        /**
         * 描述
         */
        public final String desc;
    }

    /**
     * 邮件类型
     */
    @AllArgsConstructor
    public enum MailType {
        INTERNAL_MAIL(0, "内部邮件"),
        EXTERNAL_MAIL(1, "外部邮件");
        /**
         * 编码
         */
        public final Integer code;
        /**
         * 描述
         */
        public final String desc;
    }

    /**
     * 邮件发送状态
     */
    @AllArgsConstructor
    public enum MailStatus{
        NOT_SEND(0, "未发送"),
        SEND(1, "已发送"),
        SEND_FAILED(1, "发送失败");
        /**
         * 编码
         */
        public final Integer code;
        /**
         * 描述
         */
        public final String desc;
    }
}
