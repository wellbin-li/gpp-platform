package com.tbyf.service.hm.uric;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;
/**尿酸信息Service
 * 
 * @author zanxc
 *
 */
public interface UricManager {

	/**尿酸查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;
	
	/**
	 * app更新尿酸记录
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	
	/**
	 * 居民尿酸查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 新增尿酸测试
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**修改尿酸测试
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取尿酸详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 删除尿酸测试
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
	
	
}
