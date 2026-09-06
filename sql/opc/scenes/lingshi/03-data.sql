USE `ry-vue`;

INSERT INTO biz_settlement (company_name, settlement_no, work_type, worker_count, settle_amount, settle_month, settle_status,
                            audit_date, pay_date, owner, remark, create_by, create_time, update_by, update_time)
VALUES
    ('杭州云骑科技有限公司',   'LS-2026-001', 'project_based', 38, 186400.00, '2026-08', '2', '2026-08-12', '2026-08-18', '刘敏', '项目制骑手结算', 'admin', sysdate(), 'admin', sysdate()),
    ('上海盒马配送服务有限公司', 'LS-2026-002', 'long_term',     52, 260000.00, '2026-08', '1', '2026-08-15', NULL, '王磊', '长期配送员', 'admin', sysdate(), 'admin', sysdate()),
    ('深圳顺丰同城信息技术有限公司', 'LS-2026-003', 'short_term',  21, 98500.00, '2026-08', '1', '2026-08-16', NULL, '周敏', NULL, 'admin', sysdate(), 'admin', sysdate()),
    ('成都美团优选供应链公司',   'LS-2026-004', 'hourly',        66, 132000.00, '2026-07', '0', NULL, NULL, '陈涛', '待审核', 'admin', sysdate(), NULL, NULL),
    ('苏州叮咚买菜服务有限公司', 'LS-2026-005', 'short_term',    17, 76300.00,  '2026-07', '0', NULL, NULL, '赵倩', NULL, 'admin', sysdate(), NULL, NULL),
    ('北京京东达达配送公司',     'LS-2026-006', 'long_term',     45, 225000.00, '2026-07', '2', '2026-07-10', '2026-07-16', '孙浩', '已支付', 'admin', sysdate(), 'admin', sysdate()),
    ('广州朴朴超市有限公司',     'LS-2026-007', 'project_based', 29, 121800.00, '2026-06', '1', '2026-06-11', NULL, '刘敏', NULL, 'admin', sysdate(), 'admin', sysdate()),
    ('武汉瑞幸咖啡外送项目',     'LS-2026-008', 'hourly',        40, 89000.00,  '2026-06', '2', '2026-06-05', '2026-06-12', '王磊', '已支付', 'admin', sysdate(), 'admin', sysdate());
