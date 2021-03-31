package com.maple.base.service.usc;

import com.baomidou.mybatisplus.extension.service.IService;
import com.maple.base.bean.usc.Menu;
import com.maple.base.bean.usc.vo.MenuTreeVo;

import java.util.List;

/**
 * <p>
 * 用户中心-菜单权限表 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
public interface IMenuService extends IService<Menu> {

    List<MenuTreeVo> getMenuTree();
}
