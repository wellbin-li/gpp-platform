package com.tbyf.service.gp.index.residentquestionnaireresult.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumSex;
import com.tbyf.entity.enums.EnumSexGB;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.residentquestionnaireresult.ResidentQuestionnaireResultManager;
import com.tbyf.util.PageData;
/**居民指标问卷结果管理
 * 
 * @author zanxc
 *
 */
@Service("residentQuestionnaireResultService")
public class ResidentQuestionnaireResultService implements ResidentQuestionnaireResultManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询结果
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexResidentQuesResultMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("IndexResidentQuesResultMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("IndexResidentQuesResultMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("IndexResidentQuesResultMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexResidentQuesResultMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("IndexResidentQuesResultMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(String[] ids) throws Exception {
		dao.update("IndexResidentQuesResultMapper.deleteAll", ids);
		
	}
	/**
	 * app更新
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("IndexResidentQuesResultMapper.renew", pd);
		
	}

	@Override
	public List<PageData> findByResidentQuesId(Page page) throws Exception {
		return (List<PageData>)dao.findForList("IndexResidentQuesResultMapper.findByResidentQuesId", page);
	}

	
	
}
