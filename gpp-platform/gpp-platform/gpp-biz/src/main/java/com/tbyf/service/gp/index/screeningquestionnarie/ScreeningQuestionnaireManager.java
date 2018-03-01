package com.tbyf.service.gp.index.screeningquestionnarie;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**
 *  筛选问卷调查管理
 *  @author zanxc
 *
 */
public interface ScreeningQuestionnaireManager {

	/**筛选问卷调查查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * app更新筛选问卷调查
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 指标筛选问卷调查
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增筛选问卷调查
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改筛选问卷调查
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID查询筛选问卷调查
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除筛选问卷调查
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 批量删除
	 * @param ids  选中删除的下标
	 * @throws Exception
	 */
	public void delAll(PageData pd )throws Exception;
	/**
	 * 通过ID查询筛选问卷调查
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findBySId(PageData pd)throws Exception;
}