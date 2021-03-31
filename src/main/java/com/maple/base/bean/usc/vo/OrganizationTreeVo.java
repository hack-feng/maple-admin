package com.maple.base.bean.usc.vo;

import lombok.Data;

import java.util.LinkedList;
import java.util.List;

/**
 * 组织机构树形菜单展示类
 */
@Data
public class OrganizationTreeVo {

    private Long id;
    private String label;
    private List<OrganizationTreeVo> children = new LinkedList<>();
}
