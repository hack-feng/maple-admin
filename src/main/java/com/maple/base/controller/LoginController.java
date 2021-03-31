package com.maple.base.controller;

import com.alibaba.fastjson.JSONObject;
import com.maple.base.bean.common.GlobalConfig;
import com.maple.base.bean.common.TokenBean;
import com.maple.base.bean.usc.vo.UserMenuVo;
import com.maple.base.service.usc.IUserService;
import com.maple.base.util.JWTUtil;
import com.maple.base.util.R;
import com.maple.base.util.RedisUtil;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Maple
 */
@RestController
@RequestMapping(value = "/login")
public class LoginController {


    @Autowired
    ShiroFilterFactoryBean shiroFilterFactoryBean;

    @Autowired
    RedisUtil redisUtil;

    @Autowired
    private IUserService userService;


    @ApiOperation(value = "vue前端登录实现", notes = "根据用户名密码实现登录")
    @PostMapping("/auth")
    public R login(@RequestBody JSONObject jsonObject){
        String account = jsonObject.getString("username");
        String password = jsonObject.getString("password");
        try {
            UserMenuVo user = userService.login(account, password);
            Long userId = user.getUser().getId();
            TokenBean tokenBean = new TokenBean();
            tokenBean.setUserId(userId);
            tokenBean.setAccount(account);
            tokenBean.setUserName(user.getUser().getName());
            tokenBean.setRoleList(user.getRoles());
            tokenBean.setOrgId(user.getOrganization().getId());
            tokenBean.setOrgName(user.getOrganization().getName());
            String token = JWTUtil.createToken(tokenBean);
            redisUtil.remove(GlobalConfig.getRedisUserKey(account));
            redisUtil.set(GlobalConfig.getRedisUserKey(account), token, GlobalConfig.EXPIRE_TIME);

            Map<String, Object> resultMap = new HashMap<>(16);
            resultMap.put("token", token);
            resultMap.put("id", user.getUser().getId());
            resultMap.put("account", user.getUser().getAccount());
            resultMap.put("name", user.getUser().getName());
            resultMap.put("user", user);
            return R.ok(resultMap, "登录成功");
        } catch (RuntimeException e) {
            e.printStackTrace();
            return R.failed(e.getMessage());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return R.failed("登录失败，请重试");
        }
    }

    @ApiOperation(value = "退出登录", notes = "用户帐号退出功能")
    @PostMapping("/loginOut")
    public R loginOut(){
        String account = JWTUtil.getAccount();
        redisUtil.remove(GlobalConfig.getRedisUserKey(account));
        return R.ok("退出成功");
    }
}
