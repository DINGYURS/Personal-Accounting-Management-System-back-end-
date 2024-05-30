package com.example.controller;

import com.example.entity.CategoryLabelEntity;
import com.example.pojo.PageBean;
import com.example.pojo.Result;
import com.example.service.CategoryLabelService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/label")
public class CategoryLabelController {
    @Resource
    private CategoryLabelService categoryLabelService;

    // 新增数据
    @PostMapping
    public Result insertLabel(@RequestBody CategoryLabelEntity categoryLabel) {
        try {
            categoryLabelService.insertLabel(categoryLabel);
            log.info("新增标签, {}", categoryLabel);
        } catch (Exception e) {
            log.error("ERROR occurred while insert label", e);
            return Result.error(e.getMessage());
        }
        return Result.success();
    }

    // 删除数据
    @DeleteMapping("/{ids}")
    public Result deleteLabel(@PathVariable List<Integer> ids) {
        try {
            categoryLabelService.deleteLabel(ids);
            log.info("批量删除标签, ids{}", ids);
        } catch (Exception e) {
            log.error("Error occurred while delete labels", e);
            return Result.error(e.getMessage());
        }
        return Result.success();
    }

    //修改数据
    @PutMapping
    public Result updateLabel(@RequestBody CategoryLabelEntity categoryLabel) {
        try {
            categoryLabel = categoryLabelService.updateLabel(categoryLabel);
            log.info("修改数据{}", categoryLabel);
        } catch (Exception e) {
            log.error("ERROR occurred while update label", e);
            return Result.error(e.getMessage());
        }
        return Result.success(categoryLabel);
    }

    // 分页查询
    @GetMapping
    // @RequestParam 可设置参数的默认值
    public Result page(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize,
                       String tag
    ) {
        log.info("分页查询，参数：{},{},{}", page, pageSize, tag);
        // 调用service分页查询
        PageBean pageBean = categoryLabelService.page(page, pageSize, tag);
        return Result.success(pageBean);
    }
}
