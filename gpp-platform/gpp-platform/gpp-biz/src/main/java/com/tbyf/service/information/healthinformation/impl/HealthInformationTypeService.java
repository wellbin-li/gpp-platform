package com.tbyf.service.information.healthinformation.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.healthinformation.HealthInformationTypeManager;
import com.tbyf.util.PageData;

@Service("healthTypeService")
public class HealthInformationTypeService implements
		HealthInformationTypeManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 健康资讯类型列表
	 */
	@Override
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("HealthInfomationTypeMapper.datalistPage", page);
	}

	/**
	 * APP健康资讯类型列表
	 */
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("HealthInfomationTypeMapper.queryPage", pd);
	}

	/**
	 * 添加健康资讯类型
	 * @return 
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("HealthInfomationTypeMapper.save", pd);
	}

	/**
	 * 编辑健康资讯类型
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("HealthInfomationTypeMapper.edit", pd);
	}

	/**
	 * 通过GUID查找健康资讯类型
	 */
	@Override
	public PageData findByGUID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("HealthInfomationTypeMapper.findByGUID", pd);
	}
	/**
	 * 通过GUID删除健康资讯类型
	 */
	@Override
	public void deleteByGUID(PageData pd) throws Exception {
		dao.delete("HealthInfomationTypeMapper.fDelete", pd);
	}
	/**
	 * 健康资讯选取资讯类型
	 */
	@Override
	public List<PageData> typeSelect(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("HealthInfomationTypeMapper.typeSelect", pd);
	}

}
