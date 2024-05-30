package com.example.filter;

import jakarta.servlet.*;

import java.io.IOException;

//@WebFilter(urlPatterns = "/*")
public class DemoFilter implements Filter
{

    @Override // 初始化方法,只调用一次
    public void init(FilterConfig filterConfig)
    {
//        Filter.super.init(filterConfig);
        System.out.println("init 初始化方法执行了");
    }

    @Override // 拦截到请求之后调用，调用多次
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        System.out.println("拦截到了请求");
        // 放行
        chain.doFilter(request, response);
    }

    @Override // 销毁方法，调用一次
    public void destroy()
    {
//        Filter.super.destroy();
        System.out.println("destroy 销毁方法执行了");
    }
}
