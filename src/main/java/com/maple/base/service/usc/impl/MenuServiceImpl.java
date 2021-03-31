package com.maple.base.service.usc.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.base.bean.usc.Menu;
import com.maple.base.bean.usc.vo.MenuTreeVo;
import com.maple.base.mapper.usc.MenuMapper;
import com.maple.base.service.usc.IMenuService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 用户中心-菜单权限表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Override
    public List<MenuTreeVo> getMenuTree() {
        QueryWrapper<Menu> queryWrapper = new QueryWrapper<>();
        List<Menu> menuList = this.baseMapper.selectList(queryWrapper);
        List<MenuTreeVo> resultList = new ArrayList<>();
        this.buildTree(0L, menuList, resultList);
        return resultList;
    }

    private List<MenuTreeVo> buildTree(Long id, List<Menu> list, List<MenuTreeVo> resultList) {
        for (Menu menu : list) {
            if (id.equals(menu.getParentId())) {
                MenuTreeVo tree = new MenuTreeVo();
                BeanUtils.copyProperties(menu, tree);
                List<MenuTreeVo> subMenuList = this.buildTree(tree.getId(), list, tree.getChildren());
                tree.setChildren(subMenuList);
                resultList.add(tree);
            }
        }
        return resultList;
    }
}
