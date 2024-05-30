package com.example.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("house_info")
public class HouseInfoEntity {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id; //唯一ID

    @TableField(value = "title")
    private String title; // 租房标题


    @TableField(value = "community_name")
    private String communityName; // 小区名称


    @TableField(value = "address")
    private String address; // 房屋地址


    @TableField(value = "house_type")
    private String houseType; // 房屋户型


    @TableField(value = "floor_area")
    private String floorArea; // 房屋面积


    @TableField(value = "level")
    private String level; // 房屋楼层
    //    private String tag; // 房屋标签


    @TableField(value = "price")
    private String price; // 房屋价格
}
