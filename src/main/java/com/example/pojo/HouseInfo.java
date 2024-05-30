package com.example.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HouseInfo
{
    private String title; // 租房标题
    private String communityName; // 小区名称
    private String address; // 房屋地址
    private String houseType; // 房屋户型
    private String floorArea; // 房屋面积
    private String level; // 房屋楼层
    //    private String tag; // 房屋标签
    private String price; // 房屋价格

//    @Override
//    public String toString()
//    {
//        return "租房标题：'" + title + "', 房屋地址：'"
//                + address + "', 房屋户型：'"
//                + houseType + "',房屋面积：'"
//                + floorArea + "',房屋楼层：'"
//                + level + "',房屋标签：'"
//                + tag + "'";
//    }
}
