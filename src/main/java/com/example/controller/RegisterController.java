package com.example.controller;

import com.example.pojo.Emp;
import com.example.pojo.Result;
import com.example.service.EmpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class RegisterController
{
    @Autowired
    private EmpService empService;

    @PostMapping("/api/register")
    // @RequestBody 用于将前端发送请求的JSON数据封装至实体类中
    public Result insert(@RequestBody Emp emp)
    {
        log.info("新增数据,{}", emp);
        empService.register(emp);
        return Result.success();
    }
}
