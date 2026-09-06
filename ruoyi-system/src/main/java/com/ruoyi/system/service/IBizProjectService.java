package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.BizProject;

/**
 * 招商项目 服务层
 *
 * @author ruoyi
 */
public interface IBizProjectService
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
     * 状态推进（洽谈中→已签约→已落地，逐级单向）
     *
     * @param bizProject 携带 projectId 与目标 projectStatus
     * @return 结果
     */
    public int changeProjectStatus(BizProject bizProject);

    /**
     * 批量删除招商项目
     *
     * @param projectIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteBizProjectByProjectIds(Long[] projectIds);

    /**
     * 招商项目统计
     *
     * @return 统计结果（total/negotiating/signed/landed）
     */
    public Map<String, Object> selectProjectStatistics();
}
