package com.tbyf.service.gp.index.screeningquestionnarie.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.screeningquestionnarie.ScreeningQuestionnaireManager;
import com.tbyf.util.PageData;

/**
 * 
 * @author zanxc
 *
 */
@Service("screeningQuestionnaireService")
public class ScreeningQuestionnaireService implements ScreeningQuestionnaireManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询结果
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexQuestionnaireMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("IndexQuestionnaireMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("IndexQuestionnaireMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("IndexQuestionnaireMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexQuestionnaireMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("IndexQuestionnaireMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(PageData pd) throws Exception {
		dao.update("IndexQuestionnaireMapper.deleteAll", pd);
		
	}
	/**
	 * app更新
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("IndexQuestionnaireMapper.renew", pd);
		
	}
	/**
	 * 
	 */

	@Override
	public PageData findBySId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexQuestionnaireMapper.findBySId", pd);
	}

}
