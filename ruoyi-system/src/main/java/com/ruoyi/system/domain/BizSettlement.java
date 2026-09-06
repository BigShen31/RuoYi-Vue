package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 灵活用工结算单对象 biz_settlement
 *
 * @author ruoyi
 */
public class BizSettlement extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 结算单ID */
    private Long settlementId;

    /** 用工企业名称 */
    @NotBlank(message = "用工企业名称不能为空")
    @Size(max = 120, message = "用工企业名称长度不能超过120个字符")
    private String companyName;

    /** 结算单号 */
    @Size(max = 50, message = "结算单号长度不能超过50个字符")
    private String settlementNo;

    /** 用工类型(字典 biz_work_type) */
    @Size(max = 30, message = "用工类型长度不能超过30个字符")
    private String workType;

    /** 结算人数 */
    private Integer workerCount;

    /** 结算金额(元) */
    private BigDecimal settleAmount;

    /** 结算月份(YYYY-MM) */
    @Size(max = 7, message = "结算月份格式为YYYY-MM")
    private String settleMonth;

    /** 状态(0待审核 1已结算 2已支付) */
    @Size(max = 10, message = "状态长度不能超过10个字符")
    private String settleStatus;

    /** 审核日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date auditDate;

    /** 支付日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date payDate;

    /** 经办人 */
    @Size(max = 50, message = "经办人长度不能超过50个字符")
    private String owner;

    public Long getSettlementId()
    {
        return settlementId;
    }

    public void setSettlementId(Long settlementId)
    {
        this.settlementId = settlementId;
    }

    public String getCompanyName()
    {
        return companyName;
    }

    public void setCompanyName(String companyName)
    {
        this.companyName = companyName;
    }

    public String getSettlementNo()
    {
        return settlementNo;
    }

    public void setSettlementNo(String settlementNo)
    {
        this.settlementNo = settlementNo;
    }

    public String getWorkType()
    {
        return workType;
    }

    public void setWorkType(String workType)
    {
        this.workType = workType;
    }

    public Integer getWorkerCount()
    {
        return workerCount;
    }

    public void setWorkerCount(Integer workerCount)
    {
        this.workerCount = workerCount;
    }

    public BigDecimal getSettleAmount()
    {
        return settleAmount;
    }

    public void setSettleAmount(BigDecimal settleAmount)
    {
        this.settleAmount = settleAmount;
    }

    public String getSettleMonth()
    {
        return settleMonth;
    }

    public void setSettleMonth(String settleMonth)
    {
        this.settleMonth = settleMonth;
    }

    public String getSettleStatus()
    {
        return settleStatus;
    }

    public void setSettleStatus(String settleStatus)
    {
        this.settleStatus = settleStatus;
    }

    public Date getAuditDate()
    {
        return auditDate;
    }

    public void setAuditDate(Date auditDate)
    {
        this.auditDate = auditDate;
    }

    public Date getPayDate()
    {
        return payDate;
    }

    public void setPayDate(Date payDate)
    {
        this.payDate = payDate;
    }

    public String getOwner()
    {
        return owner;
    }

    public void setOwner(String owner)
    {
        this.owner = owner;
    }
}
