package com.example.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.example.pojo.Result;
import com.example.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Component // 将该类交给IOC容器管理
public class LoginCheckInterceptor implements HandlerInterceptor
{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        // 1.获取请求URL
        String url = request.getRequestURL().toString();
        log.info("请求URL:{}", url);

        // 2.判断请求url中是否包含login, 如果包含, 说明是登录操作，放行。
        if(url.contains("login") || url.contains("register"))
        {
            log.info("这是登录或注册操作，放行");
            return true;
        }

        // 3.获取请求头中的令牌(token)
        String jwt = request.getHeader("token");

        // 4.判断令牌是否存在，如果不存在，说明没有登录，返回登录信息
        if(!StringUtils.hasLength(jwt))
        {
            log.info("请求头为空，返回登录信息");
            Result error = Result.error("NOT_LOGIN_NO_TOKEN");
            // 手动转化对象--JSON
            String notLogin = JSONObject.toJSONString(error);
            response.getWriter().write(notLogin);
            return false;
        }

        // 5.解析token, 如果解析失败，说明token不正确，返回登录信息
        try
        {
            JwtUtils.parseJWT(jwt);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("解析token失败，返回登录信息");
            Result error = Result.error("NOT_LOGIN_FALSE_TOKEN");
            // 手动转化对象--JSON
            String notLogin = JSONObject.toJSONString(error);
            response.getWriter().write(notLogin);
            return false;
        }
        // 放行
        log.info("放行");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception
    {
        System.out.println("postHandle...");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception
    {
        System.out.printf("afterCompletion...");
    }
}
