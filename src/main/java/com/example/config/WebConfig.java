package com.example.config;

import com.example.interceptor.LoginCheckInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // 注入自定义的登录检查拦截器
    @Autowired
    private LoginCheckInterceptor loginCheckInterceptor;

    // 重写 addInterceptors 方法，用于配置拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 将登录检查拦截器添加到拦截器链，并指定拦截的路径模式为所有路径（"/**"）
        registry.addInterceptor(loginCheckInterceptor).addPathPatterns("/**");
    }
}
