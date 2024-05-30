package com.example.mapper;

import com.example.pojo.Emp;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper // 运行时,会自动生成该接口的实现类对象(代理对象),并且将该对象交给IOC容器管理
public interface EmpMapper
{
    @Select("select * from emp2 where username = #{username} and password = #{password}")
    Emp getUsernameAndPassword(Emp emp);

    @Insert("insert into emp2(username, password) values (#{username}, #{password})")
    void register(Emp emp);
    // 查询总记录
//    @Select("select count(*) from  emp")
//    public Long count();
//
//    // 分页查询，
//    @Select("SELECT * from emp limit #{start}, #{pageSize}")
//    public List<Emp> page(Integer start, Integer pageSize);

    // 分页查询(PageHelper插件实现)
//    @Select("select * from student")
    List<Emp> list(String studentId, String name, Integer gender);
//    List<Emp> list(String name, Integer gender, LocalDate begin, LocalDate end);

    // 批量删除
    void delete(List<Integer> ids);

    // 新增数据
    @Insert("insert into student(username, student_id, name, gender, image, motto, create_time, update_time) " +
            "values (#{username},#{studentId},#{name},#{gender},#{image},#{motto},#{createTime},#{updateTime})")
    void insert(Emp emp);

    @Select("select * from student where id = #{id}")
    Emp getId(Integer id);

    void update(Emp emp);
}
