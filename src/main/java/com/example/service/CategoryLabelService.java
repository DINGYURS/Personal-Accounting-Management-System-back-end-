package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.CategoryLabelEntity;
import com.example.pojo.PageBean;

import java.util.List;

public interface CategoryLabelService extends IService<CategoryLabelEntity> {
    // 插入数据
    void insertLabel(CategoryLabelEntity categoryLabel);

    // 删除数据
    void deleteLabel(List<Integer> ids);

    //修改数据
    CategoryLabelEntity updateLabel(CategoryLabelEntity categoryLabel);

    // 分页查询
    PageBean page(Integer page, Integer pageSize, String tag);
}
