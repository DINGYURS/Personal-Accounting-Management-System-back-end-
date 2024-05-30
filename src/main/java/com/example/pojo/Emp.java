package com.example.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Emp
{
    private Integer id;
    private String username;
    private String password;
    private String studentId;
    private String name;
    private Integer gender;
    private String image;
    private String motto;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
