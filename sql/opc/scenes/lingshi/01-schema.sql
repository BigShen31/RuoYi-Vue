USE `ry-vue`;

CREATE TABLE IF NOT EXISTS biz_settlement (
    settlement_id  BIGINT       NOT NULL AUTO_INCREMENT COMMENT '结算单ID',
    company_name   VARCHAR(120) NOT NULL COMMENT '用工企业名称',
    settlement_no  VARCHAR(50)           COMMENT '结算单号',
    work_type      VARCHAR(30)           COMMENT '用工类型(字典biz_work_type)',
    worker_count   INT                   COMMENT '结算人数',
    settle_amount  DECIMAL(14,2)         COMMENT '结算金额(元)',
    settle_month   VARCHAR(7)            COMMENT '结算月份(YYYY-MM)',
    settle_status  VARCHAR(10)  NOT NULL DEFAULT '0' COMMENT '状态(0待审核 1已结算 2已支付)',
    audit_date     DATE                 COMMENT '审核日期',
    pay_date       DATE                 COMMENT '支付日期',
    owner          VARCHAR(50)           COMMENT '经办人',
    remark         VARCHAR(500)          COMMENT '备注',
    create_by      VARCHAR(64)           COMMENT '创建者',
    create_time    DATETIME              COMMENT '创建时间',
    update_by      VARCHAR(64)           COMMENT '更新者',
    update_time    DATETIME              COMMENT '更新时间',
    PRIMARY KEY (settlement_id),
    KEY idx_settle_status (settle_status),
    KEY idx_settle_month (settle_month)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='灵活用工结算单';
