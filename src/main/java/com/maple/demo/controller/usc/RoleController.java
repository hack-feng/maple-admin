package com.maple.demo.controller.usc;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.demo.bean.common.GlobalConfig;
import com.maple.demo.bean.usc.Role;
import com.maple.demo.bean.usc.vo.BatchVo;
import com.maple.demo.service.usc.IMenuService;
import com.maple.demo.service.usc.IRoleService;
import com.maple.demo.util.R;
import com.maple.demo.util.logger.LogHelper;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户中心-角色表 前端控制器
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@RestController
@RequestMapping("/role")
public class RoleController {

    private final IRoleService roleService;
    private final IMenuService menuService;

    @Autowired
    public RoleController(IRoleService roleService, IMenuService menuService) {
        this.roleService = roleService;
        this.menuService = menuService;
    }

    @ApiOperation(value = "获取角色列表", notes = "获取角色列表，含分页信息")
    @PostMapping("/getList")
    public R getList(Page<Role> page, @RequestBody Role role) {
        return R.ok(roleService.getList(page, role));
    }

    @ApiOperation(value = "角色菜单展示", notes = "获取所有角色菜单信息")
    @GetMapping("/listAll")
    public R listAll() {
        List<Role> roleList = roleService.queryRoleNameList();
        return R.ok(roleList);
    }

    @LogHelper(logType = GlobalConfig.logTypeEnum.INTERFACE)
    @ApiOperation(value = "角色创建", notes = "角色创建")
    @PostMapping("/create")
    public R createRole(@RequestBody Role role) {
        try {
            roleService.checkRoleInfo(role);
        } catch (RuntimeException e) {
            return R.failed(e.getMessage());
        }
        boolean result = roleService.createRole(role);
        return R.isOk(result, "添加角色");
    }

    @LogHelper(logType = GlobalConfig.logTypeEnum.INTERFACE)
    @ApiOperation(value = "角色修改", notes = "角色修改")
    @PutMapping("/update")
    public R updateRole(@RequestBody Role role) {
        if (role.getId() == null) {
            return R.failed("角色id不能为空");
        }
        try {
            roleService.checkRoleInfo(role);
        } catch (RuntimeException e) {
            return R.failed(e.getMessage());
        }
        boolean result = roleService.updateRole(role);
        return R.isOk(result, "角色修改");
    }

    @LogHelper(logType = GlobalConfig.logTypeEnum.INTERFACE)
    @PutMapping("/delete")
    @ApiOperation(value = "角色删除", notes = "角色删除")
    public R deleteRole(Long id) {
        try {
            roleService.checkRoleInfo(id);
        } catch (RuntimeException e) {
            return R.failed(e.getMessage());
        }
        boolean result = roleService.deleteRoleById(id);
        return R.isOk(result, "角色删除");
    }

    @LogHelper(logType = GlobalConfig.logTypeEnum.INTERFACE)
    @PutMapping("/deleteList")
    @ApiOperation(value = "角色批量删除")
    public R deleteRoleBatch(@RequestBody BatchVo roleBatchVo) {
        try {
            roleService.checkRoleInfo(roleBatchVo.getIdList());
        } catch (RuntimeException e) {
            return R.failed(e.getMessage());
        }
        roleService.deleteRoleByIdList(roleBatchVo.getIdList());
        return R.isOk(true, "角色删除");
    }

    @LogHelper(logType = GlobalConfig.logTypeEnum.INTERFACE)
    @PutMapping("/updateStatusBatch")
    @ApiOperation(value = "角色状态修改/批量修改", notes = "status ： USABLE 启用 BLOCK_UP 停用")
    public R updateStatusBatch(@RequestBody BatchVo roleBatchVo) {
        try {
            boolean result = roleService.updateStatusBatch(roleBatchVo);
            return R.isOk(result, "角色状态修改");
        } catch (RuntimeException e) {
            return R.failed(e.getMessage());
        }

    }

    @ApiOperation(value = "根据角色id查询权限信息", notes = "根据角色id查询权限信息")
    @GetMapping("/getMenuTreeByRoleId")
    public R getMenuTreeByRoleId(@RequestParam("id") String roleId) {
        Role role = roleService.getById(roleId);
        Map<String, Object> map = new HashMap<>(16);
        map.put("refreshRole", role.getMenuList());
        map.put("menuList", menuService.getMenuTree());
        return R.ok(map);
    }

    @LogHelper(logType = GlobalConfig.logTypeEnum.INTERFACE)
    @ApiOperation(value = "角色授权", notes = "角色授权")
    @PutMapping("/saveRoleMenu")
    public R saveRoleMenu(@RequestBody Role roleParam) {
        if (roleParam.getId() == null) {
            return R.failed("角色id不能为空");
        }
        Role role = new Role();
        role.setId(roleParam.getId());
        role.setMenuList(roleParam.getMenuList());
        roleService.updateById(role);
        return R.ok();
    }
}

