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
import com.ruoyi.system.domain.BizSettlement;
import com.ruoyi.system.service.IBizSettlementService;

/**
 * 灵活用工结算单操作处理
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/settlement")
public class BizSettlementController extends BaseController
{
    @Autowired
    private IBizSettlementService bizSettlementService;

    @PreAuthorize("@ss.hasPermi('system:settlement:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizSettlement bizSettlement)
    {
        startPage();
        List<BizSettlement> list = bizSettlementService.selectBizSettlementList(bizSettlement);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('system:settlement:list')")
    @GetMapping("/statistics")
    public AjaxResult statistics()
    {
        Map<String, Object> statistics = bizSettlementService.selectSettlementStatistics();
        return success(statistics);
    }

    @PreAuthorize("@ss.hasPermi('system:settlement:query')")
    @GetMapping(value = "/{settlementId}")
    public AjaxResult getInfo(@PathVariable Long settlementId)
    {
        return success(bizSettlementService.selectBizSettlementBySettlementId(settlementId));
    }

    @PreAuthorize("@ss.hasPermi('system:settlement:add')")
    @Log(title = "灵活用工结算单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody BizSettlement bizSettlement)
    {
        bizSettlement.setCreateBy(getUsername());
        return toAjax(bizSettlementService.insertBizSettlement(bizSettlement));
    }

    @PreAuthorize("@ss.hasPermi('system:settlement:edit')")
    @Log(title = "灵活用工结算单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody BizSettlement bizSettlement)
    {
        bizSettlement.setUpdateBy(getUsername());
        return toAjax(bizSettlementService.updateBizSettlement(bizSettlement));
    }

    @PreAuthorize("@ss.hasPermi('system:settlement:edit')")
    @Log(title = "灵活用工结算单", businessType = BusinessType.UPDATE)
    @PutMapping("/status")
    public AjaxResult changeStatus(@RequestBody BizSettlement bizSettlement)
    {
        bizSettlement.setUpdateBy(getUsername());
        return toAjax(bizSettlementService.changeSettlementStatus(bizSettlement));
    }

    @PreAuthorize("@ss.hasPermi('system:settlement:remove')")
    @Log(title = "灵活用工结算单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{settlementIds}")
    public AjaxResult remove(@PathVariable Long[] settlementIds)
    {
        return toAjax(bizSettlementService.deleteBizSettlementBySettlementIds(settlementIds));
    }
}
