package com.example.filter;

import com.alibaba.fastjson.JSONObject;
import com.example.pojo.Result;
import com.example.utils.JwtUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import java.io.IOException;

@Slf4j
//@WebFilter(urlPatterns = "/*")
public class LoginCheckFilter implements Filter
{
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException
    {
        HttpServletRequest rep = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        // 1.获取请求URL
        String url = rep.getRequestURL().toString();
        log.info("请求URL:{}", url);

        // 2.判断请求url中是否包含login, 如果包含, 说明是登录操作，放行。
        if(url.contains("login"))
        {
            log.info("这是登录操作，放行");
            chain.doFilter(request,response);
            return;
        }

        // 3.获取请求头中的令牌(token)
        String jwt = rep.getHeader("token");

        // 4.判断令牌是否存在，如果不存在，说明没有登录，返回登录信息
        if(!StringUtils.hasLength(jwt))
        {
            log.info("请求头为空，返回登录信息");
            Result error = Result.error("NOT_LOGIN");
            // 手动转化对象--JSON
            String notLogin = JSONObject.toJSONString(error);
            resp.getWriter().write(notLogin);
            return;
        }

        // 5.解析token, 如果解析失败，说明token不正确，返回登录信息
        try
        {
            JwtUtils.parseJWT(jwt);
        } catch (Exception e)
        {
            e.printStackTrace();
            log.info("解析token失败，返回登录信息");
            Result error = Result.error("NOT_LOGIN");
            // 手动转化对象--JSON
            String notLogin = JSONObject.toJSONString(error);
            resp.getWriter().write(notLogin);
            return;
        }
        // 放行
        log.info("放行");
        chain.doFilter(request,response);
    }
}
