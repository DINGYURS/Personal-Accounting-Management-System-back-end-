package com.example.service.imp;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.CategoryLabelEntity;
import com.example.mapper.CategoryLabelMapper;
import com.example.pojo.PageBean;
import com.example.service.CategoryLabelService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryLabelImpl extends ServiceImpl<CategoryLabelMapper, CategoryLabelEntity> implements CategoryLabelService {

    @Resource
    private CategoryLabelMapper CategoryLabelMapper;

    @Override
    public void insertLabel(CategoryLabelEntity categoryLabel) {
        this.save(categoryLabel);
    }

    @Override
    public void deleteLabel(List<Integer> ids) {
        this.removeByIds(ids);
    }

    @Override
    public CategoryLabelEntity updateLabel(CategoryLabelEntity categoryLabel) {
        this.updateById(categoryLabel);
        return categoryLabel;
    }

    @Override
    public PageBean page(Integer page, Integer pageSize, String tag) {
        // 设置分页参数(使用PageHelper插件)
        PageHelper.startPage(page, pageSize);

        // 执行查询
        List<CategoryLabelEntity> labelList = CategoryLabelMapper.list(tag);
        Page<CategoryLabelEntity> p = (Page<CategoryLabelEntity>) labelList;

        // 封装结果
        PageBean pageBean = new PageBean(p.getTotal(), p.getResult());

        // 返回结果
        return pageBean;
    }
}
