package ${package.Controller};


import com.maple.demo.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};
<#if restControllerStyle>
import org.springframework.web.bind.annotation.*;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Api(tags = "${table.comment!}")
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if package.ModuleName?? && package.ModuleName != "">/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

    @Autowired
    private I${entity}Service ${table.entityPath}Service;

    @PostMapping("getList")
    @ApiOperation(value = "分页查询列表", notes="${table.comment!}-分页查询列表", nickname = "${author}")
    public R getList(Page<${entity}> page, @RequestBody ${entity} ${table.entityPath}){
        return R.ok(${table.entityPath}Service.getList(page, ${table.entityPath}),"查询数据成功");
    }

    @PostMapping("saveOrUpdate")
    @ApiOperation(value = "新增或修改数据", notes="${table.comment!}-新增或修改数据", nickname = "${author}")
    public R saveOrUpdateData(@RequestBody ${entity} ${table.entityPath}){
        return R.isOk(${table.entityPath}Service.saveOrUpdateData(${table.entityPath}), "操作");
    }

    @GetMapping("getById")
    @ApiOperation(value = "根据id查询数据信息", notes="${table.comment!}-根据id查询数据信息", nickname = "${author}")
    public R getById(long id){
        return R.ok(${table.entityPath}Service.getById(id));
    }

    @PostMapping("deleteById")
    @ApiOperation(value = "根据id删除数据信息", notes="${table.comment!}-根据id删除数据信息", nickname = "${author}")
    public R deleteById(long id){
    return R.ok(${table.entityPath}Service.removeById(id));
    }
}
</#if>