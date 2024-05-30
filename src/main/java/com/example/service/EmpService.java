package com.example.service;


import com.example.pojo.Emp;
import com.example.pojo.PageBean;

import java.util.List;

public interface EmpService
{
    //用户登录
    Emp login(Emp emp);

    //用户注册
    void register(Emp emp);

    //分页查询
    PageBean page(Integer page, Integer pageSize, String studentId, String name, Integer gender);

    //批量删除信息
    void delete(List<Integer> ids);

    //新增数据
    void insert(Emp emp);

    //根据ID查询数据
    Emp getId(Integer id);

    //更新数据
    void update(Emp emp);
}
