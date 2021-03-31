package com.maple.base.controller.usc;


import com.maple.base.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.base.bean.usc.Role;
import com.maple.base.service.usc.IRoleService;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户中心-角色表 前端控制器
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Api(tags = "{table.comment!}")
@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @PostMapping("getList")
    @ApiOperation(value = "分页查询列表", notes="用户中心-角色表-分页查询列表", nickname = "ZhangFZ")
    public R getList(Page<Role> page, @RequestBody Role role){
        return R.ok(roleService.getList(page, role),"查询数据成功");
    }

    @PostMapping("saveOrUpdate")
    @ApiOperation(value = "新增或修改数据", notes="用户中心-角色表-新增或修改数据", nickname = "ZhangFZ")
    public R saveOrUpdateData(@RequestBody Role role){
        return R.isOk(roleService.saveOrUpdateData(role), "操作");
    }

    @GetMapping("getById")
    @ApiOperation(value = "根据id查询数据信息", notes="用户中心-角色表-根据id查询数据信息", nickname = "ZhangFZ")
    public R getById(long id){
        return R.ok(roleService.getById(id));
    }
}
