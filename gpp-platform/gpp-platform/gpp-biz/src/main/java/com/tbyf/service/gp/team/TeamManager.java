package com.tbyf.service.gp.team;

import java.util.List;
import java.util.UUID;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface TeamManager {
	
	/**teamApp签约团队查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**teamApp根据医生ID查询签约团队
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPageByProvider(PageData pd) throws Exception;
	
	/**teamApp签约团队新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveTeamApp(PageData pd)throws Exception;
	
	/**teamApp签约团队删除
	 * @param pd
	 * @throws Exception
	 */
	public void delTeamApp(PageData pd)throws Exception;
	
	/**teamApp签约团队更新状态
	 * @param pd
	 * @throws Exception
	 */
	public void statusTeamApp(PageData pd)throws Exception;
	
	/**teamApp签约团队编辑
	 * @param pd
	 * @throws Exception
	 */
	public void editTeamApp(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**
	 * 新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * 删除
	 * 更新状态
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData fingById(PageData pd)throws Exception;
	
	/** 团队成员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> memberList(Page page)throws Exception;
	
	/**
	 * 新增团队成员信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveMember(PageData pd) throws Exception;
	
	/**
	 * 团队成员编辑
	 * @param pd
	 * @throws Exception
	 */
	public void editMember(PageData pd) throws Exception;
	
	/**
	 * APP团队成员编辑
	 * @param pd
	 * @throws Exception
	 */
	public void editMemberForAPP(PageData pd) throws Exception;
	
	/**
	 * 通过ID获取团队成员数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData fingByIdMember(PageData pd)throws Exception;

	public List<PageData> findByTeamMemberId(PageData pd) throws Exception;
	
	/**
	 * App接口查询团队成员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListForApp(PageData pd) throws Exception;
	/**
	 * 通过关键词搜索
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListByKEY(PageData pd) throws Exception;
	
	/**
	 * 根据ID查询成员（本团队）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getlistByMemberId(PageData pd) throws Exception;
	/**
	 * 根据ID查询成员（其他团队）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getlistByMemberIdOther(PageData pd) throws Exception;
	/**
	 * 根据ID增加人数
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void addTeamNumberById(PageData pd) throws Exception;
	/**
	 * 根据ID减少人数
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void delTeamNumberById(PageData pd) throws Exception;

	
}
