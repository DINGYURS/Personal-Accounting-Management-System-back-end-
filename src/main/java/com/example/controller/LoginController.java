package com.example.controller;

import com.example.pojo.Emp;
import com.example.pojo.Result;
import com.example.service.EmpService;
import com.example.utils.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
public class LoginController
{
    @Autowired
    private EmpService empService;

    @PostMapping("/api/login")
    public Result login(@RequestBody Emp emp)
    {
        log.info(" 登录:{}", emp);
        Emp e = empService.login(emp);

        // 登陆成功下发令牌
        if (e != null)
        {
            Map<String, Object> claims = new HashMap<>();
            claims.put("id", e.getId());
            claims.put("username", e.getUsername());
            claims.put("password", e.getPassword());

            String jwt = JwtUtils.generateGenJwt(claims);// jwt包含当前登录的员工的信息
            return Result.success(jwt);
        }
        return Result.error("用户名或密码出现错误");
    }
}
