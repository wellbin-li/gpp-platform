package com.tbyf.controller.gp.indexcombinationrelation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumFitSex;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.combinationrelation.IndexCombinationRelationManager;
import com.tbyf.service.gp.index.manager.IndexManagerManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Constants;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**指标组合管理
 * 
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/indexCombinationRelation")
public class IndexCombinationRelationController extends BaseController{
	@Resource(name="indexManagerService")
    private IndexManagerManager indexManagerService;
	String menuUrl = "indexCombinationRelation/list.do"; //菜单地址(权限用)
	@Resource(name="indexCombinationRelationService")
    private IndexCombinationRelationManager indexCombinationRelationService;
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	/**显示指标组合关联列表
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示指标组合关联列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.addObject("FITSEX", EnumFitSex.toMap());  //适合的类型
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	list = indexCombinationRelationService.list(page);  //列表
		mv.setViewName("gp/indexcombinationrelation/indexcombinationrelation_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量添加组合关联");
		Map<String,Object> map = new HashMap<String,Object>();
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String INDEX_COMBINATION_ID = pd.getString("COMBINATION_ID");
		String str=String.valueOf(pd.get("IDS"));
		PageData pds = pd;
		String[] ids = str.split(",");
		for(int i = 0 ; i < ids.length; i++) {
			pds.put("ID", this.get32UUID());					//主键
			pds.put("INDEX_COMBINATION_ID", INDEX_COMBINATION_ID);
			pds.put("INDEX_ID", ids[i]);
			indexCombinationRelationService.save(pds);
			pds.clear();
		}
		pd.put("msg", "ok");
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"指标组合新增关联界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		pd = this.getPageData();
		pd.put("INDEX_STATE", EnumIndexState.NORAML.getCode());
		page.setPd(pd);
		List<PageData>	list = indexCombinationRelationService.findByNot(page);  //列表
		//查询已经关联的指标ID
		mv.addObject("pd", pd);
		mv.addObject("varList", list);
		mv.setViewName("gp/indexcombinationrelation/indexcombinationrelation_edit");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("msg", "save");
		return mv;
	}
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除组合关联管理");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		indexCombinationRelationService.delete(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**批量删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删检查关联指标组合");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("IDS"));
		String[] ids = str.split(",");
		indexCombinationRelationService.delAll(ids);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	

}
