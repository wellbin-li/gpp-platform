package com.tbyf.service.gp.index.residentquestionnaireresult;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**居民问卷结果
 * 
 * @author zanxc
 *
 */
public interface ResidentQuestionnaireResultManager {
	/**居民指标结果查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * app更新居民指标结果查询
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 居民指标问卷结果查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增居民指标问卷结果查询
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改居民指标问卷结果查询
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取居民问卷指标结果查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除居民指标问卷结果查询
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**
	 * 批量删除
	 * @param ids  选中删除的下标
	 * @throws Exception
	 */
	public void delAll(String[] ids )throws Exception;
	/**
	 * 通过居民问卷ID查询问卷结果
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByResidentQuesId(Page page )throws Exception;
	

}
