package com.maple.base.bean.usc.vo;

import com.maple.base.bean.usc.Menu;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.LinkedList;
import java.util.List;

/**
 * @author Maple
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class MenuTreeVo extends Menu {

    @ApiModelProperty(value = "下级菜单")
    private List<MenuTreeVo> children = new LinkedList<>();

    @ApiModelProperty(value = "是否授权（不存入数据库）")
    private boolean isAuthorized;

}
