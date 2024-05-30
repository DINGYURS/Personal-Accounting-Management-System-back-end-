package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.entity.HouseInfoEntity;
import com.example.pojo.HouseInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface HouseInfoMapper extends BaseMapper<HouseInfoEntity> {
    @Insert("insert into house_info(title, community_name, address, house_type, floor_area, level, price)" +
            "values (#{title}, #{communityName}, #{address}, #{houseType}, #{floorArea}, #{level}, #{price})")
    void insert(HouseInfo houseInfo);
}
