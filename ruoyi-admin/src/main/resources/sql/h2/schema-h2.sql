-- ============================================================
-- H2 内存库（MODE=MySQL）· 建表脚本（登录 + 招商项目库演示所需最小集）
-- 由 application-h2.yml 的 spring.sql.init 自动执行
-- ============================================================

CREATE TABLE IF NOT EXISTS sys_dept (
    dept_id     BIGINT PRIMARY KEY,
    parent_id   BIGINT DEFAULT 0,
    ancestors   VARCHAR(50) DEFAULT '',
    dept_name   VARCHAR(30),
    order_num   INT DEFAULT 0,
    leader      VARCHAR(20),
    phone       VARCHAR(11),
    email       VARCHAR(50),
    status      CHAR(1) DEFAULT '0',
    del_flag    CHAR(1) DEFAULT '0',
    create_by   VARCHAR(64),
    create_time TIMESTAMP,
    update_by   VARCHAR(64),
    update_time TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sys_role (
    role_id     BIGINT PRIMARY KEY,
    role_name   VARCHAR(30) NOT NULL,
    role_key    VARCHAR(100) NOT NULL,
    role_sort   INT NOT NULL,
    data_scope  CHAR(1) DEFAULT '1',
    menu_check_strictly TINYINT DEFAULT 1,
    dept_check_strictly TINYINT DEFAULT 1,
    status      CHAR(1) NOT NULL,
    del_flag    CHAR(1) DEFAULT '0',
    create_by   VARCHAR(64),
    create_time TIMESTAMP,
    update_by   VARCHAR(64),
    update_time TIMESTAMP,
    remark      VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS sys_user (
    user_id        BIGINT PRIMARY KEY,
    dept_id        BIGINT,
    user_name      VARCHAR(30) NOT NULL,
    nick_name      VARCHAR(30) NOT NULL,
    user_type      VARCHAR(2) DEFAULT '00',
    email          VARCHAR(50) DEFAULT '',
    phonenumber    VARCHAR(11) DEFAULT '',
    sex            CHAR(1) DEFAULT '0',
    avatar         VARCHAR(100) DEFAULT '',
    password       VARCHAR(100) DEFAULT '',
    status         CHAR(1) DEFAULT '0',
    del_flag       CHAR(1) DEFAULT '0',
    login_ip       VARCHAR(128) DEFAULT '',
    login_date     TIMESTAMP,
    pwd_update_date TIMESTAMP,
    create_by      VARCHAR(64) DEFAULT '',
    create_time    TIMESTAMP,
    update_by      VARCHAR(64) DEFAULT '',
    update_time    TIMESTAMP,
    remark         VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS sys_user_role (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS sys_post (
    post_id     BIGINT PRIMARY KEY,
    post_code   VARCHAR(64) NOT NULL,
    post_name   VARCHAR(50) NOT NULL,
    post_sort   INT NOT NULL,
    status      CHAR(1) NOT NULL,
    create_by   VARCHAR(64),
    create_time TIMESTAMP,
    update_by   VARCHAR(64),
    update_time TIMESTAMP,
    remark      VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS sys_user_post (
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS sys_menu (
    menu_id     BIGINT PRIMARY KEY,
    menu_name   VARCHAR(50) NOT NULL,
    parent_id   BIGINT DEFAULT 0,
    order_num   INT DEFAULT 0,
    path        VARCHAR(200) DEFAULT '',
    component   VARCHAR(255),
    query       VARCHAR(255),
    route_name  VARCHAR(50),
    is_frame    INT DEFAULT 1,
    is_cache    INT DEFAULT 0,
    menu_type   CHAR(1) DEFAULT '',
    visible     CHAR(1) DEFAULT '0',
    status      CHAR(1) DEFAULT '0',
    perms       VARCHAR(100),
    icon        VARCHAR(100) DEFAULT '#',
    create_by   VARCHAR(64),
    create_time TIMESTAMP,
    update_by   VARCHAR(64),
    update_time TIMESTAMP,
    remark      VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS sys_role_menu (
    role_id BIGINT NOT NULL,
    menu_id BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS sys_dict_type (
    dict_id     BIGINT PRIMARY KEY,
    dict_name   VARCHAR(100) DEFAULT '',
    dict_type   VARCHAR(100) DEFAULT '',
    status      CHAR(1) DEFAULT '0',
    create_by   VARCHAR(64) DEFAULT '',
    create_time TIMESTAMP,
    update_by   VARCHAR(64) DEFAULT '',
    update_time TIMESTAMP,
    remark      VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS sys_dict_data (
    dict_code   BIGINT PRIMARY KEY,
    dict_sort   INT DEFAULT 0,
    dict_label  VARCHAR(100) DEFAULT '',
    dict_value  VARCHAR(100) DEFAULT '',
    dict_type   VARCHAR(100) DEFAULT '',
    css_class   VARCHAR(100),
    list_class  VARCHAR(100),
    is_default  CHAR(1) DEFAULT 'N',
    status      CHAR(1) DEFAULT '0',
    create_by   VARCHAR(64) DEFAULT '',
    create_time TIMESTAMP,
    update_by   VARCHAR(64) DEFAULT '',
    update_time TIMESTAMP,
    remark      VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS sys_config (
    config_id    BIGINT PRIMARY KEY,
    config_name  VARCHAR(100) DEFAULT '',
    config_key   VARCHAR(100) DEFAULT '',
    config_value VARCHAR(500) DEFAULT '',
    config_type  CHAR(1) DEFAULT 'N',
    create_by    VARCHAR(64) DEFAULT '',
    create_time  TIMESTAMP,
    update_by    VARCHAR(64) DEFAULT '',
    update_time  TIMESTAMP,
    remark       VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS sys_logininfor (
    info_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_name      VARCHAR(50) DEFAULT '',
    ipaddr         VARCHAR(128) DEFAULT '',
    login_location VARCHAR(255) DEFAULT '',
    browser        VARCHAR(50) DEFAULT '',
    os             VARCHAR(50) DEFAULT '',
    status         CHAR(1) DEFAULT '0',
    msg            VARCHAR(255) DEFAULT '',
    login_time     TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sys_oper_log (
    oper_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    title          VARCHAR(50) DEFAULT '',
    business_type  INT DEFAULT 0,
    method         VARCHAR(200) DEFAULT '',
    request_method VARCHAR(10) DEFAULT '',
    operator_type  INT DEFAULT 0,
    oper_name      VARCHAR(50) DEFAULT '',
    dept_name      VARCHAR(50) DEFAULT '',
    oper_url       VARCHAR(255) DEFAULT '',
    oper_ip        VARCHAR(128) DEFAULT '',
    oper_location  VARCHAR(255) DEFAULT '',
    oper_param     VARCHAR(2000) DEFAULT '',
    json_result    VARCHAR(2000) DEFAULT '',
    status         INT DEFAULT 0,
    error_msg      VARCHAR(2000) DEFAULT '',
    oper_time      TIMESTAMP,
    cost_time      BIGINT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS sys_job (
    job_id          BIGINT PRIMARY KEY,
    job_name        VARCHAR(64) NOT NULL,
    job_group       VARCHAR(64) NOT NULL,
    invoke_target   VARCHAR(500) NOT NULL,
    cron_expression VARCHAR(255) DEFAULT '',
    misfire_policy  VARCHAR(20) DEFAULT '3',
    concurrent      CHAR(1) DEFAULT '1',
    status          CHAR(1) DEFAULT '0',
    create_by       VARCHAR(64),
    create_time     TIMESTAMP,
    update_by       VARCHAR(64),
    update_time     TIMESTAMP,
    remark          VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS sys_notice (
    notice_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    notice_title   VARCHAR(50) NOT NULL,
    notice_type    CHAR(1) NOT NULL,
    notice_content VARCHAR(2000),
    status         CHAR(1) DEFAULT '0',
    create_by      VARCHAR(64),
    create_time    TIMESTAMP,
    update_by      VARCHAR(64),
    update_time    TIMESTAMP,
    remark         VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS sys_notice_read (
    read_id    BIGINT AUTO_INCREMENT PRIMARY KEY,
    notice_id  BIGINT NOT NULL,
    user_id    BIGINT NOT NULL,
    is_read    CHAR(1) DEFAULT '0',
    read_time  TIMESTAMP
);

CREATE TABLE IF NOT EXISTS biz_project (
    project_id     BIGINT PRIMARY KEY AUTO_INCREMENT,
    project_name   VARCHAR(100) NOT NULL,
    project_code   VARCHAR(50),
    industry_type  VARCHAR(30),
    invest_amount  DECIMAL(14,2),
    project_status VARCHAR(10) NOT NULL DEFAULT '0',
    sign_date      DATE,
    landed_date    DATE,
    contact_name   VARCHAR(50),
    owner          VARCHAR(50),
    remark         VARCHAR(500),
    create_by      VARCHAR(64),
    create_time    TIMESTAMP,
    update_by      VARCHAR(64),
    update_time    TIMESTAMP
);
