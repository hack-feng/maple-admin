package com.maple.base.controller.usc;


import com.maple.base.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.base.bean.usc.Organization;
import com.maple.base.service.usc.IOrganizationService;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户中心-组织结构表（经销商信息） 前端控制器
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
@Api(tags = "{table.comment!}")
@RestController
@RequestMapping("/organization")
public class OrganizationController {

    @Autowired
    private IOrganizationService organizationService;

    @PostMapping("getList")
    @ApiOperation(value = "分页查询列表", notes="用户中心-组织结构表（经销商信息）-分页查询列表", nickname = "ZhangFZ")
    public R getList(Page<Organization> page, @RequestBody Organization organization){
        return R.ok(organizationService.getList(page, organization),"查询数据成功");
    }

    @PostMapping("saveOrUpdate")
    @ApiOperation(value = "新增或修改数据", notes="用户中心-组织结构表（经销商信息）-新增或修改数据", nickname = "ZhangFZ")
    public R saveOrUpdateData(@RequestBody Organization organization){
        return R.isOk(organizationService.saveOrUpdateData(organization), "操作");
    }

    @GetMapping("getById")
    @ApiOperation(value = "根据id查询数据信息", notes="用户中心-组织结构表（经销商信息）-根据id查询数据信息", nickname = "ZhangFZ")
    public R getById(long id){
        return R.ok(organizationService.getById(id));
    }
}
