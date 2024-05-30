package com.example;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//@SpringBootTest
class BackendApplicationTests
{

//    @Test
//    public void demoUuid()
//    {
//        String uuid = UUID.randomUUID().toString();
//        System.out.println(uuid);
//    }

    @Test
    public void testGenJwt()
    {
        Map<String, Object> claims = new HashMap<>();
        claims.put("id", 1);
        claims.put("name", "Tom");

        String jwt = Jwts.builder()
                .signWith(SignatureAlgorithm.HS256, "demo")// 设置签名算法
                .setClaims(claims)// 自定义内容
                .setExpiration(new Date(System.currentTimeMillis() + 3600 * 1000))
                .compact();
        System.out.println(jwt);
    }
}
