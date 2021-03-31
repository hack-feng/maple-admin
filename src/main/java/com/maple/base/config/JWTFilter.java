package com.maple.base.config;

import com.alibaba.fastjson.JSONObject;
import com.maple.base.bean.common.ErrorEnum;
import com.maple.base.bean.common.GlobalConfig;
import com.maple.base.util.JWTUtil;
import com.maple.base.util.R;
import com.maple.base.util.RedisUtil;
import org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.http.HttpMethod;
import org.springframework.util.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class JWTFilter extends BasicHttpAuthenticationFilter {

    /**
     * 判断用户登陆token，对跨域提供支持
     */
    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;

        BeanFactory factory = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        RedisUtil redisService = (RedisUtil) factory.getBean("redisUtil");

        // 返回编码
        int code = 200;
        // 返回信息
        String msg = "";
        // 返回状态
        boolean result = true;
        String account = "";

        //处理跨域问题，跨域的请求首先会发一个options类型的请求
        if (servletRequest.getMethod().equals(HttpMethod.OPTIONS.name())) {
            return true;
        }
        String authorization = servletRequest.getHeader("Authorization");
        // 判断token是否存在，不存在代表未登录
        if(StringUtils.isEmpty(authorization) || "null".equals(authorization)){
            code = ErrorEnum.ERROR_10001.getErrorCode();
            msg = ErrorEnum.ERROR_10001.getErrorMsg();
            result = false;
        }else{
            account = JWTUtil.getAccount(authorization);
            String token = (String) redisService.get(GlobalConfig.getRedisUserKey(account));
            // 判断token是否存在，不存在代表登陆超时
            if(StringUtils.isEmpty(token)){
                code = ErrorEnum.ERROR_10000.getErrorCode();
                msg = ErrorEnum.ERROR_10000.getErrorMsg();
                result = false;
            }else{
                // 判断token是否相等，不相等代表在其他地方登录
                if(!token.equalsIgnoreCase(authorization)){
                    code = ErrorEnum.ERROR_10002.getErrorCode();
                    msg = ErrorEnum.ERROR_10002.getErrorMsg();
                    result = false;
                }
            }
        }

        if(result){
            redisService.set(GlobalConfig.getRedisUserKey(account), authorization, GlobalConfig.EXPIRE_TIME);
            return true;
        }
        servletResponse.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = servletResponse.getWriter();
        servletResponse.setContentType("application/json;charset=UTF-8");
        servletResponse.setHeader("Access-Control-Allow-Origin", servletRequest.getHeader("Origin"));
        servletResponse.setHeader("Access-Control-Allow-Credentials", "true");
        servletResponse.setHeader("Vary", "Origin");
        R r = new R<>(code, msg,"");
        String respStr= JSONObject.toJSONString(r);
        printWriter.write(respStr);
        printWriter.flush();
        servletResponse.setHeader("content-Length", respStr.getBytes().length + "");
        return false;
    }
}
