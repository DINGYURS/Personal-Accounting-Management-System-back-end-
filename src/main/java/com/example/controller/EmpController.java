package com.example.controller;

import com.example.pojo.Emp;
import com.example.pojo.PageBean;
import com.example.pojo.Result;
import com.example.service.EmpService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController// RestController = Controller + ResponseBody, ResponseBody注解 可将方法返回值直接响应给客户端浏览器
// Controller注解为Component(声明IOC容器中bean的基础注解)衍生注解
@RequestMapping("/api/student")
public class EmpController
{
//    private  EmpService empService = new EmpServiceImpl();
//    上方语句由于需要创建EmpServiceImpl对象，导致Service与Controller耦合,需使用用IOC&DI进行解耦操作

//  Dependency injection(依赖注入)
//    @Autowired // 运行时IOC容器会提供该类型的bean对象,并赋值给该变量(该注解按照类型进行注入）

    @Resource(name = "empServiceImpl")// JDK提供而非SpringBoot(该类型按照名称进行注入)
    private EmpService empService;

    // 分页查询
    @GetMapping
    // @RequestParam 可设置参数的默认值
    public Result page(@RequestParam(defaultValue = "1") Integer page,
                        @RequestParam(defaultValue = "10") Integer pageSize,
                        String studentId, String name, Integer gender
                        )
    {
        log.info("分页查询，参数：{},{},{},{},{}", page, pageSize, studentId, name, gender);
        // 调用service分页查询
        PageBean pageBean = empService.page(page, pageSize, studentId, name, gender);
        return Result.success(pageBean);
    }

    // 批量删除
    @DeleteMapping("/{ids}")
    public Result delete(@PathVariable List<Integer> ids)
    {
        log.info("批量删除, ids:{}",ids);
        empService.delete(ids);
        return Result.success();
    }

    // 添加数据
    @PostMapping
    // @RequestBody 用于将前端发送请求的JSON数据封装至实体类中
    public Result insert(@RequestBody Emp emp)
    {
        log.info("新增数据,{}", emp);
        empService.insert(emp);
        return Result.success();
    }

    // 编辑界面显示数据
    @GetMapping("/{id}")
    public Result getId(@PathVariable Integer id)
    {
        log.info("根据ID查询数据：{}", id);
        Emp emp = empService.getId(id);
        return Result.success(emp);
    }

    // 修改数据
    @PutMapping
    public Result update(@RequestBody Emp emp)
    {
        log.info("更新数据：{}", emp);
        empService.update(emp);
        return Result.success();
    }
}
