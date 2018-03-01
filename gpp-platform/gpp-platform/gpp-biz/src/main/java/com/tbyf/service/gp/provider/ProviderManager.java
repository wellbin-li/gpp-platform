package com.tbyf.service.gp.provider;

import com.tbyf.plugin.*;
import com.tbyf.util.*;

import java.util.*;

/** 
 * 说明： 医护人员查询
 * 创建人：zhangy
 * 创建时间：2016-09-13
 * @version
 */
public interface ProviderManager{

	/**医护人员查询(分页)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> queryPage(PageData pd)throws Exception;

	List<PageData> listPage(Page pd) throws Exception;

	PageData queryDataById(PageData pd) throws Exception;
	
	/**
	 * 同机构医护人员查询接口
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getProvider(PageData pd)throws Exception;
	/**
	 * App医护人员查询接口
	 */
	public List<PageData> getProviderForApp(PageData pd)throws Exception;
	/**
	 * App根据当前医生机构查询医护人员接口 
	 */
	public List<PageData> getProviderOperTMember(PageData pd) throws Exception;
	/**
	 * App根据当前医生及其机构查询医护人员接口 
	 */
	public List<PageData> getProviderByCode(PageData pd) throws Exception;
	/**
	 * 根基id查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getProviderById(PageData pd) throws Exception;
	/**
	 * 根基id查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getProvierTeamById(PageData pd) throws Exception ;


	
}

