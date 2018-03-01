package com.tbyf.service.gp.index.resultrange;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

/**指标结果范围管理
 * 
 * @author zanxc
 *
 */
public interface IndexResultRangeManager {

	/**指标指标结果范围
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	/**
	 * app指标结果范围
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**
	 * 指标结果范围查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增指标结果范围
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改指标结果范围
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取指标结果模板
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除指标结果模板
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
	 * 通过指标ID查询结果范围
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByIndexId(PageData pd)throws Exception;
}
