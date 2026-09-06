USE `ry-vue`;

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name,
                      is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2100, '用工管理', 0, 20, 'lingshi', NULL, '', '', 1, 0, 'M', '0', '0', '', 'people', 'admin', sysdate(), '', NULL, '用工管理目录');

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name,
                      is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES (2101, '灵活用工结算单', 2100, 1, 'settlement', 'system/settlement/index', '', '', 1, 0, 'C', '0', '0', 'system:settlement:list', 'money', 'admin', sysdate(), '', NULL, '灵活用工结算单菜单');

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name,
                      is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES
    (2102, '新增结算单', 2101, 1, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:settlement:add',    '#', 'admin', sysdate(), '', NULL, NULL),
    (2103, '修改结算单', 2101, 2, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:settlement:edit',   '#', 'admin', sysdate(), '', NULL, NULL),
    (2104, '删除结算单', 2101, 3, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:settlement:remove', '#', 'admin', sysdate(), '', NULL, NULL),
    (2105, '查询结算单', 2101, 4, '', NULL, '', '', 1, 0, 'F', '0', '0', 'system:settlement:query',  '#', 'admin', sysdate(), '', NULL, NULL);

INSERT INTO sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES
    (102, '用工类型', 'biz_work_type',     '0', 'admin', sysdate(), '', NULL, '灵活用工类型'),
    (103, '结算状态', 'biz_settle_status', '0', 'admin', sysdate(), '', NULL, '结算状态（待审核→已结算→已支付）');

INSERT INTO sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES
    (301, 1, '长期用工', 'long_term', 'biz_work_type', '', '', 'Y', '0', 'admin', sysdate(), '', NULL, NULL),
    (302, 2, '短期用工', 'short_term', 'biz_work_type', '', '', 'N', '0', 'admin', sysdate(), '', NULL, NULL),
    (303, 3, '项目制用工', 'project_based', 'biz_work_type', '', '', 'N', '0', 'admin', sysdate(), '', NULL, NULL),
    (304, 4, '小时工', 'hourly', 'biz_work_type', '', '', 'N', '0', 'admin', sysdate(), '', NULL, NULL),
    (401, 1, '待审核', '0', 'biz_settle_status', '', 'warning', 'Y', '0', 'admin', sysdate(), '', NULL, '初始状态'),
    (402, 2, '已结算', '1', 'biz_settle_status', '', 'success', 'N', '0', 'admin', sysdate(), '', NULL, '审核通过'),
    (403, 3, '已支付', '2', 'biz_settle_status', '', 'primary', 'N', '0', 'admin', sysdate(), '', NULL, '打款完成');
