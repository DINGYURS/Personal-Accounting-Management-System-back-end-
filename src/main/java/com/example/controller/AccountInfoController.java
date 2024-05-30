package com.example.controller;

import com.example.entity.AccountInfoEntity;
import com.example.entity.CategoryLabelEntity;
import com.example.pojo.PageBean;
import com.example.pojo.Result;
import com.example.service.AccountInfoService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/info")
public class AccountInfoController {
    @Resource
    private AccountInfoService accountInfoService;

    // 新增数据
    @PostMapping
    public Result insertInfo(@RequestBody AccountInfoEntity accountInfo) {
        try {
            accountInfoService.insertInfo(accountInfo);
            log.info("新增标签, {}", accountInfo);
        } catch (Exception e) {
            log.error("ERROR occurred while insert Info", e);
            return Result.error("出现错误，请联系管理员筛查");
        }
        return Result.success();
    }

    // 删除数据
    @DeleteMapping("/{ids}")
    public Result deleteInfo(@PathVariable List<Integer> ids) {
        try {
            accountInfoService.deleteInfo(ids);
            log.info("批量删除标签, ids{}", ids);
        } catch (Exception e) {
            log.error("Error occurred while delete Infos", e);
            return Result.error("出现错误，请联系管理员筛查");
        }
        return Result.success();
    }

    //修改数据
    @PutMapping
    public Result updateInfo(@RequestBody AccountInfoEntity accountInfo) {
        try {
            accountInfo = accountInfoService.updateInfo(accountInfo);
            log.info("修改数据{}", accountInfo);
        } catch (Exception e) {
            log.error("ERROR occurred while update Info", e);
            return Result.error("出现错误，请联系管理员筛查");
        }
        return Result.success(accountInfo);
    }

    // 分页查询
    @GetMapping
    // @RequestParam 可设置参数的默认值
    public Result page(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize,
                       String tag, Integer type, String price, String note
    ) {
        PageBean pageBean = null;
        try {
            log.info("分页查询，参数：{},{},{},{},{},{}", page, pageSize, tag, type, price, note);
            // 调用service分页查询
            pageBean = accountInfoService.page(page, pageSize, tag, type, price, note);
        } catch (Exception e) {
            log.error("ERROR occurred while query Info", e);
            return Result.error("出现错误，请联系管理员筛查");
        }
        return Result.success(pageBean);
    }

    // 获取所有标签信息
    @GetMapping("/label")
    public Result getAllLabelData() {
        try {
            List<CategoryLabelEntity> categoryLabelList = accountInfoService.getAllLabelData();
            log.info("获取所有标签信息, {}", categoryLabelList);
            return Result.success(categoryLabelList);
        } catch (Exception e) {
            log.error("ERROR occurred while get all label data", e);
            return Result.error("出现错误，请联系管理员筛查");
        }
    }

    // 按月份查询收支信息
    @GetMapping("/month")
    public Result getInfoByMonth(String month) {
        List<AccountInfoEntity> accountInfoList = null;
        try {
            log.info("按月查询，参数：{}", month);
            accountInfoList = accountInfoService.getInfoByMonth(month);
        } catch (Exception e) {
            log.error("ERROR occurred while query Info by month", e);
            return Result.error("出现错误，请联系管理员筛查");
        }
        return Result.success(accountInfoList);
    }
}

