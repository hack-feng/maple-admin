package com.maple.demo.service.usc.impl;

import com.maple.demo.bean.usc.Menu;
import com.maple.demo.mapper.usc.MenuMapper;
import com.maple.demo.service.usc.IMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 用户中心-菜单权限表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {
    @Override
    public IPage<Menu> getList(Page<Menu> page, Menu menu) {
        return super.baseMapper.selectPage(page, null);
    }

    @Override
    public boolean saveOrUpdateData(Menu menu) {
        // 如果数据id存在，则修改数据，否则，插入一条数据
        if(menu.getId() != null){
            return super.baseMapper.updateById(menu) > 0;
        }else{
            return super.baseMapper.insert(menu) > 0;
        }
    }
}
