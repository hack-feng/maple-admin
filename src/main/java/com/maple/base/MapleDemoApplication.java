package com.maple.base;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@EnableSwagger2
@SpringBootApplication
@MapperScan("com.maple.base.mapper.*")
public class MapleDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(MapleDemoApplication.class, args);
    }
}
