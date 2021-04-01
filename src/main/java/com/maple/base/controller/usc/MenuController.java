package com.maple.base.controller.usc;


import com.maple.base.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.base.bean.usc.Menu;
import com.maple.base.service.usc.IMenuService;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户中心-菜单权限表 前端控制器
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Api(tags = "用户中心-菜单权限表")
@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @PostMapping("getList")
    @ApiOperation(value = "分页查询列表", notes="用户中心-菜单权限表-分页查询列表", nickname = "ZhangFZ")
    public R getList(Page<Menu> page, @RequestBody Menu menu){
        return R.ok(menuService.getList(page, menu),"查询数据成功");
    }

    @PostMapping("saveOrUpdate")
    @ApiOperation(value = "新增或修改数据", notes="用户中心-菜单权限表-新增或修改数据", nickname = "ZhangFZ")
    public R saveOrUpdateData(@RequestBody Menu menu){
        return R.isOk(menuService.saveOrUpdateData(menu), "操作");
    }

    @GetMapping("getById")
    @ApiOperation(value = "根据id查询数据信息", notes="用户中心-菜单权限表-根据id查询数据信息", nickname = "ZhangFZ")
    public R getById(long id){
        return R.ok(menuService.getById(id));
    }
}
