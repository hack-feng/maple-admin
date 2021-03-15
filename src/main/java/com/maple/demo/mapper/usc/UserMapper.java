package com.maple.demo.mapper.usc;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.maple.demo.bean.usc.User;
import org.springframework.data.domain.Page;

/**
 * <p>
 * 用户中心-用户信息表 Mapper 接口
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
public interface UserMapper extends BaseMapper<User> {

    IPage<User> getListByPage(Page<User> page, User user);
}
