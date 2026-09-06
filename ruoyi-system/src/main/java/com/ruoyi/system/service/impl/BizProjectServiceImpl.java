package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.BizProject;
import com.ruoyi.system.mapper.BizProjectMapper;
import com.ruoyi.system.service.IBizProjectService;

/**
 * 招商项目 服务层实现
 *
 * @author ruoyi
 */
@Service
public class BizProjectServiceImpl implements IBizProjectService
{
    /** 状态：洽谈中 */
    private static final String STATUS_NEGOTIATING = "0";

    /** 状态：已签约 */
    private static final String STATUS_SIGNED = "1";

    /** 状态：已落地 */
    private static final String STATUS_LANDED = "2";

    @Autowired
    private BizProjectMapper bizProjectMapper;

    /**
     * 查询招商项目列表
     *
     * @param bizProject 招商项目
     * @return 招商项目集合
     */
    @Override
    public List<BizProject> selectBizProjectList(BizProject bizProject)
    {
        return bizProjectMapper.selectBizProjectList(bizProject);
    }

    /**
     * 根据项目ID查询招商项目
     *
     * @param projectId 项目ID
     * @return 招商项目
     */
    @Override
    public BizProject selectBizProjectByProjectId(Long projectId)
    {
        return bizProjectMapper.selectBizProjectByProjectId(projectId);
    }

    /**
     * 新增招商项目
     *
     * @param bizProject 招商项目
     * @return 结果
     */
    @Override
    public int insertBizProject(BizProject bizProject)
    {
        if (StringUtils.isEmpty(bizProject.getProjectStatus()))
        {
            bizProject.setProjectStatus(STATUS_NEGOTIATING);
        }
        return bizProjectMapper.insertBizProject(bizProject);
    }

    /**
     * 修改招商项目
     *
     * @param bizProject 招商项目
     * @return 结果
     */
    @Override
    public int updateBizProject(BizProject bizProject)
    {
        return bizProjectMapper.updateBizProject(bizProject);
    }

    /**
     * 状态推进（洽谈中→已签约→已落地，逐级单向）
     *
     * @param bizProject 携带 projectId 与目标 projectStatus
     * @return 结果
     */
    @Override
    public int changeProjectStatus(BizProject bizProject)
    {
        if (bizProject.getProjectId() == null)
        {
            throw new ServiceException("项目ID不能为空");
        }
        if (StringUtils.isEmpty(bizProject.getProjectStatus()))
        {
            throw new ServiceException("目标状态不能为空");
        }
        BizProject current = bizProjectMapper.selectBizProjectByProjectId(bizProject.getProjectId());
        if (current == null)
        {
            throw new ServiceException("项目不存在或已被删除");
        }

        String from = current.getProjectStatus();
        String to = bizProject.getProjectStatus();
        if (StringUtils.isEmpty(from))
        {
            from = STATUS_NEGOTIATING;
        }
        if (from.equals(to))
        {
            throw new ServiceException("项目已处于该状态，无需重复推进");
        }
        if (!(STATUS_NEGOTIATING.equals(from) && STATUS_SIGNED.equals(to)
                || STATUS_SIGNED.equals(from) && STATUS_LANDED.equals(to)))
        {
            throw new ServiceException("状态只能按“洽谈中→已签约→已落地”逐级推进");
        }

        current.setProjectStatus(to);
        Date now = new Date();
        if (STATUS_SIGNED.equals(to) && current.getSignDate() == null)
        {
            current.setSignDate(now);
        }
        if (STATUS_LANDED.equals(to) && current.getLandedDate() == null)
        {
            current.setLandedDate(now);
        }
        current.setUpdateBy(bizProject.getUpdateBy());
        return bizProjectMapper.updateBizProjectStatus(current);
    }

    /**
     * 批量删除招商项目
     *
     * @param projectIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBizProjectByProjectIds(Long[] projectIds)
    {
        return bizProjectMapper.deleteBizProjectByProjectIds(projectIds);
    }

    /**
     * 招商项目统计
     *
     * @return 统计结果（total/negotiating/signed/landed）
     */
    @Override
    public Map<String, Object> selectProjectStatistics()
    {
        Map<String, Object> statistics = new HashMap<String, Object>();
        int total = 0;
        int negotiating = 0;
        int signed = 0;
        int landed = 0;
        List<Map<String, Object>> rows = bizProjectMapper.selectProjectStatistics();
        for (Map<String, Object> row : rows)
        {
            Object status = row.get("status_key");
            Object count = row.get("cnt");
            int cnt = count instanceof Number ? ((Number) count).intValue() : 0;
            total += cnt;
            if (STATUS_NEGOTIATING.equals(String.valueOf(status)))
            {
                negotiating = cnt;
            }
            else if (STATUS_SIGNED.equals(String.valueOf(status)))
            {
                signed = cnt;
            }
            else if (STATUS_LANDED.equals(String.valueOf(status)))
            {
                landed = cnt;
            }
        }
        statistics.put("total", total);
        statistics.put("negotiating", negotiating);
        statistics.put("signed", signed);
        statistics.put("landed", landed);
        return statistics;
    }
}
