package com.ruoyi.system.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;
import org.springframework.test.util.ReflectionTestUtils;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.system.domain.BizProject;
import com.ruoyi.system.mapper.BizProjectMapper;

/**
 * 招商项目 状态机与统计 单元测试（JUnit4，兼容项目 surefire 2.12）
 *
 * @author ruoyi
 */
public class BizProjectServiceImplTest
{
    private BizProjectMapper bizProjectMapper;

    private BizProjectServiceImpl bizProjectService;

    @Before
    public void setUp()
    {
        bizProjectMapper = Mockito.mock(BizProjectMapper.class);
        bizProjectService = new BizProjectServiceImpl();
        ReflectionTestUtils.setField(bizProjectService, "bizProjectMapper", bizProjectMapper);
    }

    private BizProject project(String status)
    {
        BizProject project = new BizProject();
        project.setProjectId(1L);
        project.setProjectStatus(status);
        return project;
    }

    @Test
    public void changeStatus_signed_shouldSetSignDate()
    {
        when(bizProjectMapper.selectBizProjectByProjectId(1L)).thenReturn(project("0"));
        when(bizProjectMapper.updateBizProjectStatus(any(BizProject.class))).thenReturn(1);

        int result = bizProjectService.changeProjectStatus(project("1"));

        assertEquals(1, result);
        ArgumentCaptor<BizProject> captor = ArgumentCaptor.forClass(BizProject.class);
        verify(bizProjectMapper).updateBizProjectStatus(captor.capture());
        assertEquals("1", captor.getValue().getProjectStatus());
        assertNotNull("推进到已签约应自动记录签约日期", captor.getValue().getSignDate());
        assertNull(captor.getValue().getLandedDate());
    }

    @Test
    public void changeStatus_landed_shouldSetLandedDate()
    {
        when(bizProjectMapper.selectBizProjectByProjectId(1L)).thenReturn(project("1"));
        when(bizProjectMapper.updateBizProjectStatus(any(BizProject.class))).thenReturn(1);

        int result = bizProjectService.changeProjectStatus(project("2"));

        assertEquals(1, result);
        ArgumentCaptor<BizProject> captor = ArgumentCaptor.forClass(BizProject.class);
        verify(bizProjectMapper).updateBizProjectStatus(captor.capture());
        assertEquals("2", captor.getValue().getProjectStatus());
        assertNotNull("推进到已落地应自动记录落地日期", captor.getValue().getLandedDate());
    }

    @Test(expected = ServiceException.class)
    public void changeStatus_skip_shouldThrow()
    {
        when(bizProjectMapper.selectBizProjectByProjectId(1L)).thenReturn(project("0"));
        bizProjectService.changeProjectStatus(project("2"));
    }

    @Test(expected = ServiceException.class)
    public void changeStatus_regress_shouldThrow()
    {
        when(bizProjectMapper.selectBizProjectByProjectId(1L)).thenReturn(project("2"));
        bizProjectService.changeProjectStatus(project("1"));
    }

    @Test(expected = ServiceException.class)
    public void changeStatus_sameState_shouldThrow()
    {
        when(bizProjectMapper.selectBizProjectByProjectId(1L)).thenReturn(project("0"));
        bizProjectService.changeProjectStatus(project("0"));
    }

    @Test(expected = ServiceException.class)
    public void changeStatus_notFound_shouldThrow()
    {
        when(bizProjectMapper.selectBizProjectByProjectId(1L)).thenReturn(null);
        bizProjectService.changeProjectStatus(project("1"));
    }

    @Test
    public void statistics_shouldAggregateByStatus()
    {
        List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
        rows.add(row("0", 5));
        rows.add(row("1", 3));
        rows.add(row("2", 2));
        when(bizProjectMapper.selectProjectStatistics()).thenReturn(rows);

        Map<String, Object> statistics = bizProjectService.selectProjectStatistics();

        assertEquals(10, statistics.get("total"));
        assertEquals(5, statistics.get("negotiating"));
        assertEquals(3, statistics.get("signed"));
        assertEquals(2, statistics.get("landed"));
    }

    @Test
    public void changeStatus_errorMessage_shouldBeBusinessReadable()
    {
        when(bizProjectMapper.selectBizProjectByProjectId(1L)).thenReturn(project("0"));
        try
        {
            bizProjectService.changeProjectStatus(project("2"));
            fail("跳级推进应抛出业务异常");
        }
        catch (ServiceException e)
        {
            assertEquals("状态只能按“洽谈中→已签约→已落地”逐级推进", e.getMessage());
        }
    }

    private Map<String, Object> row(String status, int count)
    {
        Map<String, Object> row = new HashMap<String, Object>();
        row.put("status_key", status);
        row.put("cnt", count);
        return row;
    }
}
