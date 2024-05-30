package com.example.service.imp;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.AccountInfoEntity;
import com.example.entity.CategoryLabelEntity;
import com.example.mapper.AccountInfoMapper;
import com.example.pojo.PageBean;
import com.example.service.AccountInfoService;
import com.example.service.CategoryLabelService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class AccountInfoImpl extends ServiceImpl<AccountInfoMapper, AccountInfoEntity> implements AccountInfoService {

    @Resource
    private AccountInfoMapper AccountInfoMapper;

    @Resource
    private CategoryLabelService categoryLabelService;

    // 新增数据
    @Override
    public void insertInfo(AccountInfoEntity accountInfo) {
        accountInfo.setCreateTime(LocalDateTime.now());
        accountInfo.setUpdateTime(LocalDateTime.now());
        save(accountInfo);
    }

    // 删除数据
    @Override
    public void deleteInfo(List<Integer> ids) {
        removeByIds(ids);
    }

    //修改数据
    @Override
    public AccountInfoEntity updateInfo(AccountInfoEntity accountInfo) {
        accountInfo.setUpdateTime(LocalDateTime.now());
        updateById(accountInfo);
        return null;
    }

    // 分页查询
    @Override
    public PageBean page(Integer page, Integer pageSize, String tag, Integer type, String price, String note) {
        // 设置分页参数(使用PageHelper插件)
        PageHelper.startPage(page, pageSize);

        // 执行查询
        List<AccountInfoEntity> accountInfoList = AccountInfoMapper.list(tag, type, price);
        Page<AccountInfoEntity> p = (Page<AccountInfoEntity>) accountInfoList;

        // 封装结果
        PageBean pageBean = new PageBean(p.getTotal(), p.getResult());

        // 返回结果
        return pageBean;
    }

    // 获取所有标签数据
    @Override
    public List<CategoryLabelEntity> getAllLabelData() {
        return categoryLabelService.list();
    }

    @Override
    public List<AccountInfoEntity> getInfoByMonth(String month) {
        QueryWrapper<AccountInfoEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.apply("DATE_FORMAT(create_time, '%Y-%m') = {0}", month);
        return list(queryWrapper);
    }
}
