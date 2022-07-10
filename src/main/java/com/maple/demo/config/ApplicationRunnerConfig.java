package com.maple.demo.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.net.InetAddress;

/**
 * 配置项目启动成功后，自动加载系统的基础配置
 * @author Maple
 * @date 2020/11/17 11:06
 **/
@Component
@Slf4j
public class ApplicationRunnerConfig implements ApplicationRunner {

    @Value("${server.port}")
    private String port;

    @Override
    public void run(ApplicationArguments args) {
        try {
            String ip = InetAddress.getLocalHost().getHostAddress();
            log.info("\n----------------------------------------------------------\n\t" +
                    "项目启动成功! 如发布线上环境，请关闭swagger文档。请求地址和接口地址如下:\n\t" +
                    "Local: \t\thttp://localhost:" + port + "/\n\t" +
                    "External: \thttp://" + ip + ":" + port + "/\n\t" +
                    "Swagger-ui: http://" + ip + ":" + port + "/swagger-ui.html\n\t" +
                    "Doc文档: \thttp://" + ip + ":" + port + "/doc.html\n" +
                    "----------------------------------------------------------");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
