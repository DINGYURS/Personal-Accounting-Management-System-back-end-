package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.AccountInfoEntity;
import com.example.entity.CategoryLabelEntity;
import com.example.pojo.PageBean;

import java.util.List;

public interface AccountInfoService extends IService<AccountInfoEntity> {
    void insertInfo(AccountInfoEntity accountInfo);

    void deleteInfo(List<Integer> ids);

    AccountInfoEntity updateInfo(AccountInfoEntity accountInfo);

    PageBean page(Integer page, Integer pageSize, String tag, Integer type, String price, String note);

    List<CategoryLabelEntity> getAllLabelData();

    List<AccountInfoEntity> getInfoByMonth(String month);
}
