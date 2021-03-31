package com.maple.base.controller.usc;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.maple.base.bean.usc.User;
import com.maple.base.service.usc.IUserService;
import com.maple.base.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户中心-用户信息表 前端控制器
 * </p>
 *
 * @author Maple
 * @since 2020-10-15
 */
@Api(tags = "用户中心-用户信息前端控制器")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @ApiOperation(value = "添加或修改用户信息")
    @GetMapping("saveOrUpdateUser")
    public R saveOrUpdateUser(User user){
        boolean isOk = userService.saveOrUpdateUser(user);
        return R.isOk(isOk, "操作");
    }

    @ApiOperation(value = "添加或修改用户信息")
    @GetMapping("selectById")
    public R selectById(long id){
        User user = userService.getById(id);
        user.setPassword(null);
        return R.ok(user);
    }

    @ApiOperation(value = "分页查询用户列表信息")
    @PostMapping("getListByPage")
    public R getListByPage(Page<User> page, User user){
        IPage<User> result = userService.getListByPage(page, user);
        return R.ok(result);
    }
}

