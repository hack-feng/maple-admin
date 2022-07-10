package com.maple.demo.service.usc;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.demo.bean.usc.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户中心-菜单权限表 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
public interface IMenuService extends IService<Menu> {
    IPage<Menu> getList(Page<Menu> page, Menu menu);

    boolean saveOrUpdateData(Menu menu);
}
