-- ============================================================
-- H2 内存库 · 种子数据（登录 admin/admin123 + 招商项目库演示）
-- ============================================================

-- 部门
INSERT INTO sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time) VALUES
    (100, 0, '0', '演示集团', 0, 'admin', '15888888888', 'ry@163.com', '0', '0', 'admin', CURRENT_TIMESTAMP);

-- 角色（admin 超级管理员）
INSERT INTO sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, remark) VALUES
    (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', CURRENT_TIMESTAMP, '超级管理员');

-- 用户：admin / admin123（哈希与官方 ry SQL 一致）
INSERT INTO sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, create_by, create_time, remark) VALUES
    (1, 100, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'admin', CURRENT_TIMESTAMP, '管理员');

INSERT INTO sys_user_role (user_id, role_id) VALUES (1, 1);

-- 岗位
INSERT INTO sys_post (post_id, post_code, post_name, post_sort, status, create_by, create_time, remark) VALUES
    (1, 'ceo', '董事长', 1, '0', 'admin', CURRENT_TIMESTAMP, '董事长');
INSERT INTO sys_user_post (user_id, post_id) VALUES (1, 1);

-- 菜单：招商管理（目录 M，id 2000）/ 招商项目库（菜单 C，id 2001）/ 按钮 F
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark) VALUES
    (2000, '招商管理', 0, 10, 'zhaoshang', NULL, '', '', 1, 0, 'M', '0', '0', '', 'guide', 'admin', CURRENT_TIMESTAMP, '招商管理目录'),
    (2001, '招商项目库', 2000, 1, 'project', 'system/project/index', '', '', 1, 0, 'C', '0', '0', 'system:project:list', 'list', 'admin', CURRENT_TIMESTAMP, '招商项目库菜单'),
    (2002, '新增项目', 2001, 1, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:project:add', '#', 'admin', CURRENT_TIMESTAMP, NULL),
    (2003, '修改项目', 2001, 2, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:project:edit', '#', 'admin', CURRENT_TIMESTAMP, NULL),
    (2004, '删除项目', 2001, 3, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:project:remove', '#', 'admin', CURRENT_TIMESTAMP, NULL),
    (2005, '查询项目', 2001, 4, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:project:query', '#', 'admin', CURRENT_TIMESTAMP, NULL);

-- 字典类型/数据（行业 + 状态）
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, remark) VALUES
    (100, '项目行业', 'biz_industry', '0', 'admin', CURRENT_TIMESTAMP, '招商项目行业类型'),
    (101, '项目状态', 'biz_project_status', '0', 'admin', CURRENT_TIMESTAMP, '招商项目状态');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark) VALUES
    (101, 1, '智能制造', 'smart_manufacturing', 'biz_industry', '', '', 'Y', '0', 'admin', CURRENT_TIMESTAMP, NULL),
    (102, 2, '新能源', 'new_energy', 'biz_industry', '', '', 'N', '0', 'admin', CURRENT_TIMESTAMP, NULL),
    (103, 3, '生物医药', 'biopharma', 'biz_industry', '', '', 'N', '0', 'admin', CURRENT_TIMESTAMP, NULL),
    (104, 4, '数字经济', 'digital_economy', 'biz_industry', '', '', 'N', '0', 'admin', CURRENT_TIMESTAMP, NULL),
    (105, 5, '现代服务', 'modern_service', 'biz_industry', '', '', 'N', '0', 'admin', CURRENT_TIMESTAMP, NULL),
    (106, 6, '其他', 'other', 'biz_industry', '', '', 'N', '0', 'admin', CURRENT_TIMESTAMP, NULL),
    (201, 1, '洽谈中', '0', 'biz_project_status', '', 'warning', 'Y', '0', 'admin', CURRENT_TIMESTAMP, '初始状态'),
    (202, 2, '已签约', '1', 'biz_project_status', '', 'success', 'N', '0', 'admin', CURRENT_TIMESTAMP, '签约后进入'),
    (203, 3, '已落地', '2', 'biz_project_status', '', 'primary', 'N', '0', 'admin', CURRENT_TIMESTAMP, '落地后进入');

-- 参数配置：验证码关闭，便于机试快速演示
INSERT INTO sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, remark) VALUES
    (1, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', CURRENT_TIMESTAMP, '是否开启验证码功能'),
    (2, '账号自助-注册用户开关', 'sys.account.registerUser', 'false', 'Y', 'admin', CURRENT_TIMESTAMP, '是否开启注册用户功能'),
    (3, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', CURRENT_TIMESTAMP, '初始化密码 123456'),
    (4, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', CURRENT_TIMESTAMP, '默认皮肤样式');

-- 招商项目种子数据（覆盖三种状态，统计可演示）
INSERT INTO biz_project (project_name, project_code, industry_type, invest_amount, project_status, sign_date, landed_date, contact_name, owner, remark, create_by, create_time, update_by, update_time) VALUES
    ('年产5GWh动力电池生产基地项目', 'H2-2026-001', 'new_energy', 120000.00, '2', '2025-11-18', '2026-03-02', '王强', '张伟', '一期已投产，二期筹备中', 'admin', CURRENT_TIMESTAMP, 'admin', CURRENT_TIMESTAMP),
    ('高端智能装备产业园项目', 'H2-2026-002', 'smart_manufacturing', 86000.00, '1', '2026-01-22', NULL, '李敏', '张伟', '已完成厂房选址', 'admin', CURRENT_TIMESTAMP, 'admin', CURRENT_TIMESTAMP),
    ('AI大模型算力中心项目', 'H2-2026-003', 'digital_economy', 150000.00, '1', '2026-03-15', NULL, '陈晨', '刘芳', '分三期建设', 'admin', CURRENT_TIMESTAMP, 'admin', CURRENT_TIMESTAMP),
    ('创新药临床前研发中心项目', 'H2-2026-004', 'biopharma', 45000.00, '0', NULL, NULL, '赵磊', '刘芳', '正在洽谈扶持政策', 'admin', CURRENT_TIMESTAMP, NULL, NULL),
    ('跨境电商综合服务基地项目', 'H2-2026-005', 'modern_service', 32000.00, '0', NULL, NULL, '孙悦', '周涛', NULL, 'admin', CURRENT_TIMESTAMP, NULL, NULL),
    ('氢燃料电池核心材料项目', 'H2-2026-006', 'new_energy', 68000.00, '0', NULL, NULL, '钱进', '周涛', '产线已投产', 'admin', CURRENT_TIMESTAMP, NULL, NULL);
