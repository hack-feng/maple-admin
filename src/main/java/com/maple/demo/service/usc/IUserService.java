package com.maple.demo.service.usc;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maple.demo.bean.usc.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.maple.demo.bean.usc.vo.UserMenuVo;

/**
 * <p>
 * 用户中心-用户信息表 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2021-03-31
 */
public interface IUserService extends IService<User> {
    IPage<User> getList(Page<User> page, User user);

    boolean saveOrUpdateData(User user);

    UserMenuVo login(String account, String password);
}
