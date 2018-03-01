package com.tbyf.service.hm.zyyz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumAppResult;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.zyyz.ZyyzManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.PageData;
import com.tbyf.util.UuidUtil;

/**
 * 住院医嘱
 * @author lizk
 * 2016-10-26
 *
 */
@Service("zyyzService")
public class ZyyzService implements ZyyzManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("zyyzMapper.save", pd);
	}
	
	/**
	 * 通过PERSONID获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findByPERSONID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("zyyzMapper.findByPERSONID", pd);
	}
	
	/**
	 * 通过医嘱ID获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findByYZID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("zyyzMapper.findByYZID", pd);
	}
	
	/**通过医疗机构代码获取数据（接口用）
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findByYLJGDM(PageData pd) throws Exception
	{
		return (List<PageData>)dao.findForList("zyyzMapper.findByYLJGDM",pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("zyyzMapper.datalistPage", page);
	}
	
	/**
	 * 通过ID获取数据（用于查看详情）
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findByID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("zyyzMapper.findByID", pd);
	}
	
	@Override
	public String saveListBatch(List<PageData> list)throws Exception{
		String result = EnumAppResult.REQUEST_FAILED.getCode();
		if(list!=null){
			for(PageData pd:list){//循环检查参数
				if(!AppUtil.checkParam("saveZYYZ", pd)){	//检查参数 
					result = EnumAppResult.PARAM_ABSENT.getCode();
					break;
				}else{
					pd.put("ID", UuidUtil.get32UUID());
				}
			}
			if(!result.equals(EnumAppResult.PARAM_ABSENT.getCode())){//参数检查通过
				dao.batchCommit("zyyzMapper.batchSave", Const.COMMIT_COUNT_EVERYTIME, list);//批量提交插入处理
				result = EnumAppResult.REQUEST_SUCCEED.getCode();
			}
		}
		return result;
	}
	
}
