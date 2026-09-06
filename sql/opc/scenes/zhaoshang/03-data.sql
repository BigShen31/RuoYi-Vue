-- ============================================================
-- 招商项目库 · 03 演示种子数据（MySQL，库：ry-vue）
-- ============================================================
USE `ry-vue`;

INSERT INTO biz_project (project_name, project_code, industry_type, invest_amount, project_status,
                         sign_date, landed_date, contact_name, owner, remark, create_by, create_time, update_by, update_time)
VALUES
    ('年产5GWh动力电池生产基地项目', 'ZS-2026-001', 'new_energy', 120000.00, '2', '2025-11-18', '2026-03-02', '王强', '张伟', '一期已投产，二期筹备中', 'admin', sysdate(), 'admin', sysdate()),
    ('高端智能装备产业园项目',       'ZS-2026-002', 'smart_manufacturing', 86000.00, '1', '2026-01-22', NULL, '李敏', '张伟', '已完成厂房选址', 'admin', sysdate(), 'admin', sysdate()),
    ('AI大模型算力中心项目',         'ZS-2026-003', 'digital_economy', 150000.00, '1', '2026-03-15', NULL, '陈晨', '刘芳', '分三期建设', 'admin', sysdate(), 'admin', sysdate()),
    ('创新药临床前研发中心项目',     'ZS-2026-004', 'biopharma', 45000.00, '0', NULL, NULL, '赵磊', '刘芳', '正在洽谈扶持政策', 'admin', sysdate(), NULL, NULL),
    ('跨境电商综合服务基地项目',     'ZS-2026-005', 'modern_service', 32000.00, '0', NULL, NULL, '孙悦', '周涛', NULL, 'admin', sysdate(), NULL, NULL),
    ('氢燃料电池核心材料项目',       'ZS-2026-006', 'new_energy', 68000.00, '2', '2025-09-10', '2025-12-20', '钱进', '周涛', '产线已投产', 'admin', sysdate(), 'admin', sysdate()),
    ('工业机器人本体制造项目',       'ZS-2026-007', 'smart_manufacturing', 53000.00, '1', '2026-04-08', NULL, '吴昊', '张伟', '厂房改造中', 'admin', sysdate(), 'admin', sysdate()),
    ('大数据交易中心项目',           'ZS-2026-008', 'digital_economy', 28000.00, '0', NULL, NULL, '郑爽', '刘芳', '等待上级批复', 'admin', sysdate(), NULL, NULL),
    ('基因检测试剂盒产业化项目',     'ZS-2026-009', 'biopharma', 36000.00, '2', '2025-12-01', '2026-02-14', '冯源', '周涛', '已进入批量生产', 'admin', sysdate(), 'admin', sysdate()),
    ('智慧物流分拣中心项目',         'ZS-2026-010', 'modern_service', 22000.00, '1', '2026-05-06', NULL, '何静', '张伟', '设备招标中', 'admin', sysdate(), 'admin', sysdate());
