create table emp2
(
    id       int unsigned auto_increment comment 'ID'
        primary key,
    username varchar(20)                  not null comment '用户名',
    password varchar(32) default '123456' null comment '密码',
    constraint username
        unique (username)
)
    comment '员工表';

INSERT INTO mybatis.emp2 (id, username, password) VALUES (1, 'jinyong', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (4, 'weiyixiao', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (5, 'changyuchun', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (6, 'xiaozhao', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (7, 'jixiaofu', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (8, 'zhouzhiruo', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (9, 'dingminjun', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (10, 'zhaomin', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (14, 'zhangsanfeng', '123456');
INSERT INTO mybatis.emp2 (id, username, password) VALUES (18, 'ZeDu', '123456');
