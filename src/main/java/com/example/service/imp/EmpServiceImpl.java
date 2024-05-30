package com.example.service.imp;

import com.example.mapper.EmpMapper;
import com.example.pojo.Emp;
import com.example.pojo.PageBean;
import com.example.service.EmpService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;


@Service
public class EmpServiceImpl implements EmpService
{
    @Autowired
    private EmpMapper empMapper;

    @Override
    public Emp login(Emp emp)
    {
        return empMapper.getUsernameAndPassword(emp);
    }

    @Override
    public void register(Emp emp)
    {
        empMapper.register(emp);
    }

    @Override
    public PageBean page(Integer page, Integer pageSize, String studentId, String name, Integer gender)
    {
        // 设置分页参数(使用PageHelper插件)
        PageHelper.startPage(page, pageSize);

        // 执行查询
        List<Emp> emplist = empMapper.list(studentId, name, gender);
        Page<Emp> p = (Page<Emp>) emplist;

        // 封装结果
        PageBean pageBean = new PageBean(p.getTotal(), p.getResult());

        // 返回结果
        return pageBean;
    }

    @Override
    public void delete(List<Integer> ids)
    {
        empMapper.delete(ids);
    }

    @Override
    public void insert(Emp emp)
    {
        emp.setCreateTime(LocalDateTime.now());
        emp.setUpdateTime(LocalDateTime.now());
        empMapper.insert(emp);
    }

    @Override
    public Emp getId(Integer id)
    {
        return empMapper.getId(id);
    }

    @Override
    public void update(Emp emp)
    {
        emp.setUpdateTime(LocalDateTime.now());
        empMapper.update(emp);
    }
}
