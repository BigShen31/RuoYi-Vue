package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.BizSettlement;
import com.ruoyi.system.mapper.BizSettlementMapper;
import com.ruoyi.system.service.IBizSettlementService;

/**
 * 灵活用工结算单 服务层实现
 *
 * @author ruoyi
 */
@Service
public class BizSettlementServiceImpl implements IBizSettlementService
{
    /** 状态：待审核 */
    private static final String STATUS_PENDING = "0";

    /** 状态：已结算 */
    private static final String STATUS_SETTLED = "1";

    /** 状态：已支付 */
    private static final String STATUS_PAID = "2";

    @Autowired
    private BizSettlementMapper bizSettlementMapper;

    @Override
    public List<BizSettlement> selectBizSettlementList(BizSettlement bizSettlement)
    {
        return bizSettlementMapper.selectBizSettlementList(bizSettlement);
    }

    @Override
    public BizSettlement selectBizSettlementBySettlementId(Long settlementId)
    {
        return bizSettlementMapper.selectBizSettlementBySettlementId(settlementId);
    }

    @Override
    public int insertBizSettlement(BizSettlement bizSettlement)
    {
        if (StringUtils.isEmpty(bizSettlement.getSettleStatus()))
        {
            bizSettlement.setSettleStatus(STATUS_PENDING);
        }
        return bizSettlementMapper.insertBizSettlement(bizSettlement);
    }

    @Override
    public int updateBizSettlement(BizSettlement bizSettlement)
    {
        return bizSettlementMapper.updateBizSettlement(bizSettlement);
    }

    @Override
    public int changeSettlementStatus(BizSettlement bizSettlement)
    {
        if (bizSettlement.getSettlementId() == null)
        {
            throw new ServiceException("结算单ID不能为空");
        }
        if (StringUtils.isEmpty(bizSettlement.getSettleStatus()))
        {
            throw new ServiceException("目标状态不能为空");
        }
        BizSettlement current = bizSettlementMapper.selectBizSettlementBySettlementId(bizSettlement.getSettlementId());
        if (current == null)
        {
            throw new ServiceException("结算单不存在或已被删除");
        }

        String from = current.getSettleStatus();
        String to = bizSettlement.getSettleStatus();
        if (StringUtils.isEmpty(from))
        {
            from = STATUS_PENDING;
        }
        if (from.equals(to))
        {
            throw new ServiceException("结算单已处于该状态，无需重复推进");
        }
        if (!(STATUS_PENDING.equals(from) && STATUS_SETTLED.equals(to)
                || STATUS_SETTLED.equals(from) && STATUS_PAID.equals(to)))
        {
            throw new ServiceException("状态只能按“待审核→已结算→已支付”逐级推进");
        }

        current.setSettleStatus(to);
        Date now = new Date();
        if (STATUS_SETTLED.equals(to) && current.getAuditDate() == null)
        {
            current.setAuditDate(now);
        }
        if (STATUS_PAID.equals(to) && current.getPayDate() == null)
        {
            current.setPayDate(now);
        }
        current.setUpdateBy(bizSettlement.getUpdateBy());
        return bizSettlementMapper.updateBizSettlementStatus(current);
    }

    @Override
    public int deleteBizSettlementBySettlementIds(Long[] settlementIds)
    {
        return bizSettlementMapper.deleteBizSettlementBySettlementIds(settlementIds);
    }

    @Override
    public Map<String, Object> selectSettlementStatistics()
    {
        Map<String, Object> statistics = new HashMap<String, Object>();
        int total = 0;
        int pending = 0;
        int settled = 0;
        int paid = 0;
        List<Map<String, Object>> rows = bizSettlementMapper.selectSettlementStatistics();
        for (Map<String, Object> row : rows)
        {
            Object status = row.get("status_key");
            Object count = row.get("cnt");
            int cnt = count instanceof Number ? ((Number) count).intValue() : 0;
            total += cnt;
            if (STATUS_PENDING.equals(String.valueOf(status)))
            {
                pending = cnt;
            }
            else if (STATUS_SETTLED.equals(String.valueOf(status)))
            {
                settled = cnt;
            }
            else if (STATUS_PAID.equals(String.valueOf(status)))
            {
                paid = cnt;
            }
        }
        statistics.put("total", total);
        statistics.put("pending", pending);
        statistics.put("settled", settled);
        statistics.put("paid", paid);
        return statistics;
    }
}
