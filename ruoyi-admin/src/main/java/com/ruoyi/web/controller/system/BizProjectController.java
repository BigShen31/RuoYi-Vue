package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.BizProject;
import com.ruoyi.system.service.IBizProjectService;

/**
 * 招商项目操作处理
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/project")
public class BizProjectController extends BaseController
{
    @Autowired
    private IBizProjectService bizProjectService;

    /**
     * 查询招商项目列表
     */
    @PreAuthorize("@ss.hasPermi('system:project:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizProject bizProject)
    {
        startPage();
        List<BizProject> list = bizProjectService.selectBizProjectList(bizProject);
        return getDataTable(list);
    }

    /**
     * 招商项目统计（总数/在谈/已签约/已落地）
     */
    @PreAuthorize("@ss.hasPermi('system:project:list')")
    @GetMapping("/statistics")
    public AjaxResult statistics()
    {
        Map<String, Object> statistics = bizProjectService.selectProjectStatistics();
        return success(statistics);
    }

    /**
     * 根据项目ID获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:project:query')")
    @GetMapping(value = "/{projectId}")
    public AjaxResult getInfo(@PathVariable Long projectId)
    {
        return success(bizProjectService.selectBizProjectByProjectId(projectId));
    }

    /**
     * 新增招商项目
     */
    @PreAuthorize("@ss.hasPermi('system:project:add')")
    @Log(title = "招商项目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody BizProject bizProject)
    {
        bizProject.setCreateBy(getUsername());
        return toAjax(bizProjectService.insertBizProject(bizProject));
    }

    /**
     * 修改招商项目
     */
    @PreAuthorize("@ss.hasPermi('system:project:edit')")
    @Log(title = "招商项目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody BizProject bizProject)
    {
        bizProject.setUpdateBy(getUsername());
        return toAjax(bizProjectService.updateBizProject(bizProject));
    }

    /**
     * 招商项目状态推进（洽谈中→已签约→已落地）
     */
    @PreAuthorize("@ss.hasPermi('system:project:edit')")
    @Log(title = "招商项目", businessType = BusinessType.UPDATE)
    @PutMapping("/status")
    public AjaxResult changeStatus(@RequestBody BizProject bizProject)
    {
        bizProject.setUpdateBy(getUsername());
        return toAjax(bizProjectService.changeProjectStatus(bizProject));
    }

    /**
     * 删除招商项目
     */
    @PreAuthorize("@ss.hasPermi('system:project:remove')")
    @Log(title = "招商项目", businessType = BusinessType.DELETE)
    @DeleteMapping("/{projectIds}")
    public AjaxResult remove(@PathVariable Long[] projectIds)
    {
        return toAjax(bizProjectService.deleteBizProjectByProjectIds(projectIds));
    }
}
