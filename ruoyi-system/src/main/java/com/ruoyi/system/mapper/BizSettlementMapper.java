package com.ruoyi.system.mapper;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.BizSettlement;

/**
 * 灵活用工结算单 数据层
 *
 * @author ruoyi
 */
public interface BizSettlementMapper
{
    public List<BizSettlement> selectBizSettlementList(BizSettlement bizSettlement);

    public BizSettlement selectBizSettlementBySettlementId(Long settlementId);

    public int insertBizSettlement(BizSettlement bizSettlement);

    public int updateBizSettlement(BizSettlement bizSettlement);

    public int updateBizSettlementStatus(BizSettlement bizSettlement);

    public int deleteBizSettlementBySettlementIds(Long[] settlementIds);

    public List<Map<String, Object>> selectSettlementStatistics();
}
