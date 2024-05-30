package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.HouseInfoEntity;
import com.example.pojo.HouseInfo;

import java.util.List;

public interface HouseInfoService extends IService<HouseInfoEntity> {
    void insert(List<HouseInfo> houseInfos);
}
