package com.maple.base.controller.usc;


import com.maple.base.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.base.bean.usc.UserRole;
import com.maple.base.service.usc.IUserRoleService;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户中心-用户角色关联表 前端控制器
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Api(tags = "{table.comment!}")
@RestController
@RequestMapping("/userRole")
public class UserRoleController {

    @Autowired
    private IUserRoleService userRoleService;

    @PostMapping("getList")
    @ApiOperation(value = "分页查询列表", notes="用户中心-用户角色关联表-分页查询列表", nickname = "ZhangFZ")
    public R getList(Page<UserRole> page, @RequestBody UserRole userRole){
        return R.ok(userRoleService.getList(page, userRole),"查询数据成功");
    }

    @PostMapping("saveOrUpdate")
    @ApiOperation(value = "新增或修改数据", notes="用户中心-用户角色关联表-新增或修改数据", nickname = "ZhangFZ")
    public R saveOrUpdateData(@RequestBody UserRole userRole){
        return R.isOk(userRoleService.saveOrUpdateData(userRole), "操作");
    }

    @GetMapping("getById")
    @ApiOperation(value = "根据id查询数据信息", notes="用户中心-用户角色关联表-根据id查询数据信息", nickname = "ZhangFZ")
    public R getById(long id){
        return R.ok(userRoleService.getById(id));
    }
}
