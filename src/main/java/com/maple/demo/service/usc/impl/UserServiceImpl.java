package com.maple.demo.service.usc.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.demo.bean.common.GlobalField;
import com.maple.demo.bean.usc.Organization;
import com.maple.demo.bean.usc.User;
import com.maple.demo.bean.usc.UserRole;
import com.maple.demo.bean.usc.vo.UserMenuVo;
import com.maple.demo.mapper.usc.OrganizationMapper;
import com.maple.demo.mapper.usc.UserMapper;
import com.maple.demo.mapper.usc.UserRoleMapper;
import com.maple.demo.service.usc.IUserService;
import com.maple.demo.util.MD5Util;
import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户中心-用户信息表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private OrganizationMapper organizationMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public UserMenuVo login(String account, String password) {
        UserMenuVo userMenuVo = new UserMenuVo();
        QueryWrapper<User> ew = new QueryWrapper<>();
        ew.eq("account", account);
        User user = this.baseMapper.selectOne(ew);

        if (user == null) {
            throw new RuntimeException("该用户不存在");
        }
        if (!MD5Util.verifyPassword(password, user.getPassword(), user.getAccount())) {
            throw new RuntimeException("帐号密码不正确");
        }
        if (GlobalField.BLOCK_UP.equals(user.getStatus())) {
            throw new RuntimeException("您的帐号已被停用，请联系管理员。");
        }
        Organization organization = organizationMapper.selectById(user.getOrgId());
        if (organization.getType() == 2){
            if(GlobalField.BLOCK_UP.equals(organization.getStatus())){
                throw new RuntimeException("您所在的机构已被停用，有疑问请联系管理员。");
            }
        }

        userMenuVo.setUser(user);
        userMenuVo.setOrganization(organization);

        String roles = "";
        QueryWrapper<UserRole> qw = new QueryWrapper<>();
        qw.eq("user_id", user.getId());
        List<UserRole> roleList = userRoleMapper.selectList(qw);
        for (UserRole userRole : roleList) {
            if(StringUtils.isNotEmpty(roles)){
                roles = roles + "," +  userRole.getRoleId();
            }else{
                roles = String.valueOf(userRole.getRoleId());
            }
        }
        return userMenuVo;
    }

    @Override
    public boolean saveOrUpdateUser(User user) {
        if(user.getId() == null){
            user.setIsSystem(false);
            user.setStatus("1");
            if (StringUtils.isEmpty(user.getPassword())) {
                throw new RuntimeException("密码不能为空");
            }
            user.setPassword(MD5Encoder.encode(user.getPassword().getBytes()));
            return this.baseMapper.insert(user) > 0;
        }else{
            if (StringUtils.isNotEmpty(user.getPassword())) {
                user.setPassword(MD5Encoder.encode(user.getPassword().getBytes()));
            } else {
                user.setPassword(null);
            }
            this.baseMapper.updateById(user);
            return true;
        }
    }

    @Override
    public IPage<User> getListByPage(Page<User> page, User user) {
        return this.baseMapper.getListByPage(page, user);
    }
}
