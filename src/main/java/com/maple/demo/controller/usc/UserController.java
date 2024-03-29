package com.maple.demo.controller.usc;


import com.maple.demo.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.demo.bean.usc.User;
import com.maple.demo.service.usc.IUserService;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户中心-用户信息表 前端控制器
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Api(tags = "用户中心-用户信息表")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @PostMapping("getList")
    @ApiOperation(value = "分页查询列表", notes="用户中心-用户信息表-分页查询列表", nickname = "ZhangFZ")
    public R getList(Page<User> page, @RequestBody User user){
        return R.ok(userService.getList(page, user),"查询数据成功");
    }

    @PutMapping("saveOrUpdate")
    @ApiOperation(value = "新增或修改数据", notes="用户中心-用户信息表-新增或修改数据", nickname = "ZhangFZ")
    public R saveOrUpdateData(@RequestBody User user){
        return R.isOk(userService.saveOrUpdateData(user), "操作");
    }

    @GetMapping("getById")
    @ApiOperation(value = "根据id查询数据信息", notes="用户中心-用户信息表-根据id查询数据信息", nickname = "ZhangFZ")
    public R getById(long id){
        return R.ok(userService.getById(id));
    }

    @PostMapping("deleteById/{id}")
    @ApiOperation(value = "根据id删除数据信息", notes="用户中心-用户信息表-根据id删除数据信息", nickname = "ZhangFZ")
    public R deleteById(@PathVariable("id") long id){
        return R.ok(userService.removeById(id));
    }
}
