package com.example.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result
{
    private Integer code;// 响应码, 1 代表成功, 0 代表失败
    private String msg;// 响应信息
    private Object data;// 返回的数据

    public static Result success(Object data)
    {
        return new Result(1, "successful", data);
    }
    public static Result success()
    {
        return new Result(1, "successful", null);
    }
    public static Result error(String msg)
    {
        return new Result(0, msg, null);
    }
}
