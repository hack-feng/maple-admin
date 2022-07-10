package com.maple.demo.bean.sys.vo;

import com.maple.demo.bean.sys.ApproveTemplate;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class ApproveTemplateFlowVo extends ApproveTemplate {
    List<Long> roleIds;

    List<String> roleNames;

    String ids;

    String names;
}
