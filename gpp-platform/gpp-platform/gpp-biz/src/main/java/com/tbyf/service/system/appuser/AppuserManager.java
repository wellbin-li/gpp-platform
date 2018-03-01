package com.tbyf.service.system.appuser;

import java.util.List;

import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.util.PageData;


/** 会员接口类
 * 修改时间：2015.11.2
 */
public interface AppuserManager {
	
	/**列出某角色下的所有会员
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllAppuserByRorlid(PageData pd) throws Exception;
	
	/**会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listPdPageUser(Page page)throws Exception;
	/**会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> userListForApp(PageData pd)throws Exception;
	
	/**通过用户名获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUsername(PageData pd)throws Exception;
	/**通过用户名id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUserId(PageData pd)throws Exception;
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByEmail(PageData pd)throws Exception;
	/**通过手机获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByPhone(PageData pd)throws Exception;
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByNumber(PageData pd)throws Exception;
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception;
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteU(PageData pd)throws Exception;
	
	/**修改用户部分信息
	 * @param pd
	 * @throws Exception
	 */
	public void editUserInfo(PageData pd)throws Exception;
	
	/**修改用户手机号
	 * @param pd
	 * @throws Exception
	 */
	public void editUserPhone(PageData pd)throws Exception;
	
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception;
	
	/**修改用户头像
	 * @param pd
	 * @throws Exception
	 */
	public void editUserImage(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUiId(PageData pd)throws Exception;
	
	/**全部会员
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllUser(PageData pd)throws Exception;
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllU(String[] USER_IDS)throws Exception;
	
	/**获取总数
	 * @param value
	 * @throws Exception
	 */
	public PageData getAppUserCount(String value)throws Exception;

	/**
	 * 根据用户名和密码查询appuser
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByNameAndPwd(PageData pd) throws Exception;

	/**
	 * 更新最后登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLogin(PageData pd) throws Exception;

	/**
	 * 通过用户ID获取用户信息和角色信息
	 * @param user_id
	 * @return
	 */
	public User getUserAndRoleById(String user_id) throws Exception;

	/**通过用户名、密码、手机序列号、类型获取用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUiLoginInfo(PageData pd)throws Exception;
	
	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 */
	public PageData findById(PageData pd) throws Exception;

	void editPW(PageData pd) throws Exception;
	/**
	 * 根据用户名 、工号、姓名、查询用户信息 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByNameAndJobNumber(PageData pd) throws Exception;
	/**
	 * 通过医生ID查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByProviderId(PageData pd) throws Exception;
}

