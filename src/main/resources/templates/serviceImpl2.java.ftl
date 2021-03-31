package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {
    @Override
    public IPage<${entity}> getList(Page<${entity}> page, ${entity} ${table.entityPath}) {
        return super.baseMapper.selectPage(page, null);
    }

    @Override
    public boolean saveOrUpdateData(${entity} ${table.entityPath}) {
        // 如果数据id存在，则修改数据，否则，插入一条数据
        if(${table.entityPath}.getId() != null){
            return super.baseMapper.updateById(${table.entityPath}) > 0;
        }else{
            return super.baseMapper.insert(${table.entityPath}) > 0;
        }
    }
}
</#if>