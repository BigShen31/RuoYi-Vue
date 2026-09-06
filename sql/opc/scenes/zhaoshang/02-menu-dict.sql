-- ============================================================
-- 招商项目库 · 02 菜单 + 字典（MySQL，库：ry-vue）
-- 说明：目录类型 M（无 component），叶子菜单 C，按钮 F，与本仓库现有约定一致
-- ============================================================
USE `ry-vue`;

-- 目录：招商管理（id 2000）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name,
                      is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2000, '招商管理', 0, 10, 'zhaoshang', NULL, '', '', 1, 0, 'M', '0', '0', '', 'guide', 'admin', sysdate(), '', NULL, '招商管理目录');

-- 菜单：招商项目库（id 2001）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name,
                      is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2001, '招商项目库', 2000, 1, 'project', 'system/project/index', '', '', 1, 0, 'C', '0', '0', 'system:project:list', 'list', 'admin', sysdate(), '', NULL, '招商项目库菜单');

-- 按钮：新增/修改/删除/查询（父 2001）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name,
                      is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES
    (2002, '新增项目', 2001, 1, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:project:add',    '#', 'admin', sysdate(), '', NULL, '新增项目按钮'),
    (2003, '修改项目', 2001, 2, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:project:edit',   '#', 'admin', sysdate(), '', NULL, '修改项目按钮'),
    (2004, '删除项目', 2001, 3, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:project:remove', '#', 'admin', sysdate(), '', NULL, '删除项目按钮'),
    (2005, '查询项目', 2001, 4, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:project:query',  '#', 'admin', sysdate(), '', NULL, '查询项目按钮');

-- 字典类型：项目行业 / 项目状态
INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES
    (100, '项目行业', 'biz_industry',       '0', 'admin', sysdate(), '', NULL, '招商项目行业类型'),
    (101, '项目状态', 'biz_project_status', '0', 'admin', sysdate(), '', NULL, '招商项目状态（洽谈中→已签约→已落地）');

-- 字典数据：行业
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES
    (101, 1, '智能制造', 'smart_manufacturing', 'biz_industry', '', '', 'Y', '0', 'admin', sysdate(), '', NULL, NULL),
    (102, 2, '新能源',   'new_energy',         'biz_industry', '', '', 'N', '0', 'admin', sysdate(), '', NULL, NULL),
    (103, 3, '生物医药', 'biopharma',          'biz_industry', '', '', 'N', '0', 'admin', sysdate(), '', NULL, NULL),
    (104, 4, '数字经济', 'digital_economy',    'biz_industry', '', '', 'N', '0', 'admin', sysdate(), '', NULL, NULL),
    (105, 5, '现代服务', 'modern_service',     'biz_industry', '', '', 'N', '0', 'admin', sysdate(), '', NULL, NULL),
    (106, 6, '其他',     'other',              'biz_industry', '', '', 'N', '0', 'admin', sysdate(), '', NULL, NULL);

-- 字典数据：状态
INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES
    (201, 1, '洽谈中', '0', 'biz_project_status', '', 'warning', 'Y', '0', 'admin', sysdate(), '', NULL, '初始状态'),
    (202, 2, '已签约', '1', 'biz_project_status', '', 'success', 'N', '0', 'admin', sysdate(), '', NULL, '签约后进入'),
    (203, 3, '已落地', '2', 'biz_project_status', '', 'primary', 'N', '0', 'admin', sysdate(), '', NULL, '落地后进入');
