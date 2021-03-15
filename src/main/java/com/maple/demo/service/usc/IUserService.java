package com.maple.demo.service.usc;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.maple.demo.bean.usc.User;
import com.maple.demo.bean.usc.vo.UserMenuVo;
import org.springframework.data.domain.Page;

/**
 * <p>
 * 用户中心-用户信息表 服务类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
public interface IUserService extends IService<User> {

    UserMenuVo login(String account, String password);

    boolean saveOrUpdateUser(User user);

    IPage<User> getListByPage(Page<User> page, User user);
}
