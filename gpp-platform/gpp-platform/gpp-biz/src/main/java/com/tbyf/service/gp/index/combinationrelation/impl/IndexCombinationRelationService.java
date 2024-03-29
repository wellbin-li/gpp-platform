package com.tbyf.service.gp.index.combinationrelation.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.combinationrelation.IndexCombinationRelationManager;
import com.tbyf.util.PageData;

/**
 *指标组合关联Service
 * @author zanxc
 *
 */
@Service("indexCombinationRelationService")
public class IndexCombinationRelationService implements IndexCombinationRelationManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * app查询指标
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexCombinationRelationMapper.queryPage", pd);
	}

	/**显示
	 * 
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("IndexCombinationRelationMapper.datalistPage", page);
	}

	/**保存信息
	 * 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("IndexCombinationRelationMapper.save", pd);
		
	}

	/**
	 *修改信息 
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("IndexCombinationRelationMapper.edit", pd);
		
	}

	/**
	 * 通过Id查询
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("IndexCombinationRelationMapper.findById", pd);
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("IndexCombinationRelationMapper.delete", pd);
		
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delAll(String[] ids) throws Exception {
		dao.update("IndexCombinationRelationMapper.deleteAll", ids);
		
	}
	/**
	 * app更新血脂四项记录
	 */
	@Override
	public void update(PageData pd) throws Exception {
		dao.update("IndexCombinationRelationMapper.renew", pd);
		
	}

	@Override
	public List<PageData> findByCombinationId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("IndexCombinationRelationMapper.findByCombinationId", pd);
	}

	@Override
	public List<PageData> findByNot(Page page) throws Exception {
		return (List<PageData>)dao.findForList("IndexCombinationRelationMapper.datapage", page);
	}
}
