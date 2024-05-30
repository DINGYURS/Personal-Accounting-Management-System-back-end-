package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.entity.CategoryLabelEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryLabelMapper extends BaseMapper<CategoryLabelEntity> {
    List<CategoryLabelEntity> list(String tag);
}