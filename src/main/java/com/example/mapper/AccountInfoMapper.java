package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.entity.AccountInfoEntity;

import java.util.List;

public interface AccountInfoMapper extends BaseMapper<AccountInfoEntity> {

    // 分页查询
    List<AccountInfoEntity> list(String tag, Integer type, String price);
}
