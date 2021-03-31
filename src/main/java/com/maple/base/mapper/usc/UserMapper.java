package com.maple.base.mapper.usc;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.base.bean.usc.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 用户中心-用户信息表 Mapper 接口
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
public interface UserMapper extends BaseMapper<User> {

    IPage<User> getListByPage(@Param("page") Page<User> page, @Param("user") User user);
}
