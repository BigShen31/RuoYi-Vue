package com.ruoyi.system.mapper;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.BizProject;

/**
 * 招商项目 数据层
 *
 * @author ruoyi
 */
public interface BizProjectMapper
{
    /**
     * 查询招商项目列表
     *
     * @param bizProject 招商项目
     * @return 招商项目集合
     */
    public List<BizProject> selectBizProjectList(BizProject bizProject);

    /**
     * 根据项目ID查询招商项目
     *
     * @param projectId 项目ID
     * @return 招商项目
     */
    public BizProject selectBizProjectByProjectId(Long projectId);

    /**
     * 新增招商项目
     *
     * @param bizProject 招商项目
     * @return 结果
     */
    public int insertBizProject(BizProject bizProject);

    /**
     * 修改招商项目
     *
     * @param bizProject 招商项目
     * @return 结果
     */
    public int updateBizProject(BizProject bizProject);

    /**
     * 修改招商项目状态（状态推进专用，仅更新状态与业务日期）
     *
     * @param bizProject 招商项目
     * @return 结果
     */
    public int updateBizProjectStatus(BizProject bizProject);

    /**
     * 删除招商项目
     *
     * @param projectId 项目ID
     * @return 结果
     */
    public int deleteBizProjectByProjectId(Long projectId);

    /**
     * 批量删除招商项目
     *
     * @param projectIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteBizProjectByProjectIds(Long[] projectIds);

    /**
     * 招商项目统计（按状态分组计数）
     *
     * @return 状态-数量映射集合
     */
    public List<Map<String, Object>> selectProjectStatistics();
}
