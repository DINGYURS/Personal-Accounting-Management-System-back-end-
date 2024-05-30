package com.example.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.Map;

public class JwtUtils
{
    private static final String signKey = "ccxxggyy";
    private static final Long expire = 2592000000L;

    // 生成jwt
    public static String generateGenJwt(Map<String, Object> claims)
    {
        return Jwts.builder()
                .signWith(SignatureAlgorithm.HS256, signKey)// 设置签名算法
                .setClaims(claims)// 自定义内容
                .setExpiration(new Date(System.currentTimeMillis() +expire))
                .compact();
    }

    // 解析jwt
    public static Claims parseJWT(String jwt)
    {
        return Jwts.parser()
                .setSigningKey(signKey)
                .parseClaimsJws(jwt)
                .getBody();
    }
}
