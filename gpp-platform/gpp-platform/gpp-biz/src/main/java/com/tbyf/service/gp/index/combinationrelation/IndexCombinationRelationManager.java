package com.tbyf.service.gp.index.combinationrelation;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;
/**
 * 指标组合关联
 * @author zanxc
 *
 */
public interface IndexCombinationRelationManager {

	/**指标组合关联查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * app更新指标组合关联
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 指标组合关联查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增指标组合关联
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改指标组合关联
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID指标组合关联
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除指标组合关联
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
	 * 通过指标组合的ID查询指标组合列表 
	 */
	public List<PageData> findByCombinationId(PageData pd)throws Exception;
	/**
	 * 查询不是该组合的指标 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByNot(Page page)throws Exception;

}