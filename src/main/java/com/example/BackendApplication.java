package com.example;

import com.example.utils.Task.BeiKeTask;
import jakarta.annotation.Resource;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@MapperScan("com.example.mapper")
@ServletComponentScan// 开启对servlet组件的支持
// 声明IOC bean的四大注解要想生效，需要被组件扫描注解ComponentScan扫描
@SpringBootApplication// 该注解中包含ComponentScan注解,默认扫描范围为启动类所在包及其子包
public class BackendApplication{

    @Resource
    private BeiKeTask beiKeTask;

    public static void main(String[] args) {
        SpringApplication.run(BackendApplication.class, args);
    }

    /**
     * @Description: 爬虫程序启动
     */
//    @Override
//    public void run(String... strings) throws Exception {
//        beiKeTask.crawl();
//    }
}
