package com.maple.demo.bean.common;

import lombok.AllArgsConstructor;

/**
 * @author ZhangFZ
 * @date 2020/9/23 13:41
 **/
public class ApproveEnum {

    @AllArgsConstructor
    public enum ApproveTemplateEnum {
        /**
         * 审批模版
         */
        CONTRACT_APPROVE("CONTRACT_APPROVE", "合同审批模版"),
        ADVANCE_PAYMENT_APPROVE("ADVANCE_PAYMENT_APPROVE", "预付款审批模板"),
        LOAD_BILL_APPROVE("LOAD_BILL_APPROVE", "提货单审批模版"),
        LOSS_LIST_APPROVE("LOSS_LIST_APPROVE", "损耗单审批模版");

        /**
         * 名称
         */
        public final String code;
        /**
         * 描述
         */
        public final String desc;
    }


    @AllArgsConstructor
    public enum ApproveStatusEnum {
        /**
         * 审批状态
         */
        NO_SUBMIT("0", "未提交"),
        IN_APPROVAL("1", "审批中"),
        APPROVAL_SUCCESS("2", "审批通过"),
        APPROVAL_REJECT("3", "审批拒绝");
        /**
         * 名称
         */
        public final String code;
        /**
         * 描述
         */
        public final String desc;
    }
}
