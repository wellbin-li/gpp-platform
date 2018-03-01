package com.tbyf.service.gp.index.residentquestionnarie.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.residentquestionnarie.ResidentQuestionnaireManager;
import com.tbyf.util.PageData;

/**
 * 居民问卷service
 * @author zanxc
 *
 */
@Service("residentQuestionnaireService")
public class ResidentQuestionnaireService implements ResidentQuestionnaireManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询结果
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexResidentQuesMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("IndexResidentQuesMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("IndexResidentQuesMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("IndexResidentQuesMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexResidentQuesMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("IndexResidentQuesMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(String[] ids) throws Exception {
		dao.update("IndexResidentQuesMapper.deleteAll", ids);
		
	}
	/**
	 * app更新
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("IndexResidentQuesMapper.renew", pd);
		
	}

	@Override
	public List<PageData> findByResidentId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexResidentQuesMapper.findByResidentId", pd);
	}

	@Override
	public void updateScore(PageData pd) throws Exception {
		dao.update("IndexResidentQuesMapper.updateScore", pd);
	}
	
}
