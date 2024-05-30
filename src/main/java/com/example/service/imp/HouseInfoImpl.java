package com.example.service.imp;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.HouseInfoEntity;
import com.example.mapper.HouseInfoMapper;
import com.example.pojo.HouseInfo;
import com.example.service.HouseInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class HouseInfoImpl extends ServiceImpl<HouseInfoMapper, HouseInfoEntity> implements HouseInfoService {
    @Override
    public void insert(List<HouseInfo> houseInfos) {
        for (HouseInfo houseInfo : houseInfos) {
            HouseInfoEntity houseInfoEntity = new HouseInfoEntity();
            houseInfoEntity.setTitle(houseInfo.getTitle());
            houseInfoEntity.setCommunityName(houseInfo.getCommunityName());
            houseInfoEntity.setAddress(houseInfo.getAddress());
            houseInfoEntity.setHouseType(houseInfo.getHouseType());
            houseInfoEntity.setFloorArea(houseInfo.getFloorArea());
            houseInfoEntity.setLevel(houseInfo.getLevel());
            houseInfoEntity.setPrice(houseInfo.getPrice());
            try {
                save(houseInfoEntity);
                log.info("<------插入成功--->");
            } catch (Exception e) {
                log.error("<---插入失败, 请排查错误--->", e);
            }
        }
    }
}