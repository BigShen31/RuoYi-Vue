-- ============================================================
-- 招商项目库 · 03 演示种子数据（MySQL，库：ry-vue）
-- ============================================================
USE `ry-vue`;

-- 重灌语义：本文件每次执行都会先清空 biz_project（含逻辑删除数据），再写入完整演示数据
DELETE FROM biz_project;


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


-- 补充演示数据（2026-09 二次造数，2在谈/2已签约/2已落地）
INSERT INTO biz_project (project_name, project_code, industry_type, invest_amount, project_status,
                         sign_date, landed_date, contact_name, owner, remark, create_by, create_time, update_by, update_time)
VALUES
    ('低空经济产业基地项目',       'ZS-2026-011', 'other', 95000.00, '0', NULL, NULL, '罗一鸣', '张伟', '正在洽谈空域政策配套', 'admin', sysdate(), NULL, NULL),
    ('半导体封测产业园项目',       'ZS-2026-012', 'smart_manufacturing', 78000.00, '0', NULL, NULL, '顾晓东', '刘芳', '等待产业基金尽调', 'admin', sysdate(), NULL, NULL),
    ('储能系统集成项目',           'ZS-2026-013', 'new_energy', 62000.00, '1', '2026-06-18', NULL, '陆明', '周涛', '已完成厂房租赁签约', 'admin', sysdate(), 'admin', sysdate()),
    ('智能网联汽车测试基地项目',   'ZS-2026-014', 'smart_manufacturing', 88000.00, '1', '2026-07-02', NULL, '韩雪', '张伟', '测试道路建设中', 'admin', sysdate(), 'admin', sysdate()),
    ('细胞治疗药物产业化项目',     'ZS-2026-015', 'biopharma', 51000.00, '2', '2026-04-16', '2026-08-10', '孟凡', '刘芳', '已进入临床样品生产', 'admin', sysdate(), 'admin', sysdate()),
    ('数据要素产业园项目',         'ZS-2026-016', 'digital_economy', 72000.00, '2', '2026-03-30', '2026-07-28', '董倩', '周涛', '一期已开园运营', 'admin', sysdate(), 'admin', sysdate());