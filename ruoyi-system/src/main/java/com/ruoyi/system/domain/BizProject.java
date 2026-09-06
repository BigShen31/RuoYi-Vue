package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 招商项目对象 biz_project
 *
 * @author ruoyi
 */
public class BizProject extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 项目ID */
    private Long projectId;

    /** 项目名称 */
    @NotBlank(message = "项目名称不能为空")
    @Size(max = 100, message = "项目名称长度不能超过100个字符")
    private String projectName;

    /** 项目编号 */
    @Size(max = 50, message = "项目编号长度不能超过50个字符")
    private String projectCode;

    /** 行业类型(字典 biz_industry) */
    @Size(max = 30, message = "行业类型长度不能超过30个字符")
    private String industryType;

    /** 计划投资额(万元) */
    private BigDecimal investAmount;

    /** 状态(0洽谈中 1已签约 2已落地) */
    @Size(max = 10, message = "状态长度不能超过10个字符")
    private String projectStatus;

    /** 签约日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date signDate;

    /** 落地日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date landedDate;

    /** 联系人 */
    @Size(max = 50, message = "联系人长度不能超过50个字符")
    private String contactName;

    /** 招商负责人 */
    @Size(max = 50, message = "招商负责人长度不能超过50个字符")
    private String owner;

    public Long getProjectId()
    {
        return projectId;
    }

    public void setProjectId(Long projectId)
    {
        this.projectId = projectId;
    }

    public String getProjectName()
    {
        return projectName;
    }

    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }

    public String getProjectCode()
    {
        return projectCode;
    }

    public void setProjectCode(String projectCode)
    {
        this.projectCode = projectCode;
    }

    public String getIndustryType()
    {
        return industryType;
    }

    public void setIndustryType(String industryType)
    {
        this.industryType = industryType;
    }

    public BigDecimal getInvestAmount()
    {
        return investAmount;
    }

    public void setInvestAmount(BigDecimal investAmount)
    {
        this.investAmount = investAmount;
    }

    public String getProjectStatus()
    {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }

    public Date getSignDate()
    {
        return signDate;
    }

    public void setSignDate(Date signDate)
    {
        this.signDate = signDate;
    }

    public Date getLandedDate()
    {
        return landedDate;
    }

    public void setLandedDate(Date landedDate)
    {
        this.landedDate = landedDate;
    }

    public String getContactName()
    {
        return contactName;
    }

    public void setContactName(String contactName)
    {
        this.contactName = contactName;
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
