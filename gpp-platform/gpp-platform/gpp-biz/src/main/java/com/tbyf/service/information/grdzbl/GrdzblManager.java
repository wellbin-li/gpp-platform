package com.tbyf.service.information.grdzbl;

import java.util.List;

import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;

public interface GrdzblManager {
		
	/**
	 * 个人电子病历列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 后台查看个人电子病历信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * app录入个人电子病历
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**
	 * app删除个人电子病历
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception;
	
	/**
	 * 居民查询自己提交的电子病历接口
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByTjrId(PageData pd)throws Exception;
	
	/**
	 * 查询居民电子病历列表接口
	 * @param pd
	 * @return
	 * @throws Excepiton
	 */
	public List<PageData> queryPageForApp(PageData pd) throws Exception;

	
}
