-- ============================================================
-- 招商项目库 · 01 建表脚本（MySQL，库：ry-vue）
-- 与 02-menu-dict.sql / 03-data.sql 配套执行
-- ============================================================
USE `ry-vue`;

CREATE TABLE IF NOT EXISTS biz_project (
    project_id     BIGINT       NOT NULL AUTO_INCREMENT COMMENT '项目ID',
    project_name   VARCHAR(100) NOT NULL COMMENT '项目名称',
    project_code   VARCHAR(50)           COMMENT '项目编号',
    industry_type  VARCHAR(30)           COMMENT '行业类型(字典biz_industry)',
    invest_amount  DECIMAL(14,2)         COMMENT '计划投资额(万元)',
    project_status VARCHAR(10)  NOT NULL DEFAULT '0' COMMENT '状态(0洽谈中 1已签约 2已落地)',
    sign_date      DATE                 COMMENT '签约日期',
    landed_date    DATE                 COMMENT '落地日期',
    contact_name   VARCHAR(50)           COMMENT '联系人',
    owner          VARCHAR(50)           COMMENT '招商负责人',
    remark         VARCHAR(500)          COMMENT '备注',
    create_by      VARCHAR(64)           COMMENT '创建者',
    create_time    DATETIME              COMMENT '创建时间',
    update_by      VARCHAR(64)           COMMENT '更新者',
    update_time    DATETIME              COMMENT '更新时间',
    PRIMARY KEY (project_id),
    KEY idx_project_status (project_status),
    KEY idx_project_name (project_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招商项目库';
