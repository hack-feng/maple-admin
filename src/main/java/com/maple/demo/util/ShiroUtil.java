package com.maple.demo.util;

import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 */
@Service
public class ShiroUtil {

    /**
     * 获取所有权限对应的角色，用于shiro动态权限加载
     */
    public Map<String, String> getAllRolesByPermission(){
        Map<String, String> filterRuleMap = new LinkedHashMap<>();

        // 所有请求通过我们自己的JWT Filter
        filterRuleMap.put("/mailContent/**", "anon");
        filterRuleMap.put("/user/updateRetrievePassword", "anon");
        filterRuleMap.put("/login/auth", "anon");
        filterRuleMap.put("/token", "anon");
        filterRuleMap.put("/apply/*", "anon");
        filterRuleMap.put("/401", "anon");
        filterRuleMap.put("/500", "anon");

        //swagger配置放行
        filterRuleMap.put("/swagger-ui.html","anon");
        filterRuleMap.put("/swagger/**","anon");
        filterRuleMap.put("/webjars/**","anon");
        filterRuleMap.put("/swagger-resources/**","anon");
        filterRuleMap.put("/v2/**","anon");
        //静态资源放行
        filterRuleMap.put("/**/*.html","anon");
        filterRuleMap.put("/**/*.jpg","anon");
        filterRuleMap.put("/**/*.png","anon");

        filterRuleMap.put("/**", "jwt");
        return filterRuleMap;
    }
}
