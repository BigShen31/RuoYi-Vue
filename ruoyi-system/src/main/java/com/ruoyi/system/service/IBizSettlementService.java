package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.BizSettlement;

/**
 * 灵活用工结算单 服务层
 *
 * @author ruoyi
 */
public interface IBizSettlementService
{
    public List<BizSettlement> selectBizSettlementList(BizSettlement bizSettlement);

    public BizSettlement selectBizSettlementBySettlementId(Long settlementId);

    public int insertBizSettlement(BizSettlement bizSettlement);

    public int updateBizSettlement(BizSettlement bizSettlement);

    public int changeSettlementStatus(BizSettlement bizSettlement);

    public int deleteBizSettlementBySettlementIds(Long[] settlementIds);

    public Map<String, Object> selectSettlementStatistics();
}
