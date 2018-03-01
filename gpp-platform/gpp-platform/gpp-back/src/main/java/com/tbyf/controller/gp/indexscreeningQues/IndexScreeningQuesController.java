package com.tbyf.controller.gp.indexscreeningQues;

import java.util.Date;
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
import com.tbyf.service.gp.index.screeningquestionnarie.ScreeningQuestionnaireManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Constants;
import com.tbyf.util.FirstLetterUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**筛查问卷管理
 * 
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/indexScreeningQues")
public class IndexScreeningQuesController extends BaseController{
	String menuUrl = "indexScreeningQues/list.do"; //菜单地址(权限用)
	@Resource(name="screeningQuestionnaireService")
    private ScreeningQuestionnaireManager screeningQuestionnaireService;
										  
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	/**显示问卷调查表
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示筛选问卷列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		page.setPd(pd);
		List<PageData>	list = screeningQuestionnaireService.list(page);  //列表
		mv.addObject("CHROICDISEASETYPE", dictionariesService.queryDictionary(Constants.DICT_CHROIN_DISEASE_TYPE));  //慢病类型
		mv.addObject("FITSEX", EnumFitSex.toMap());  //适合的类型(性别)
		mv.setViewName("gp/indexscreeningquestionnaire/indexscreeningquestionnaire_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 *新增问卷界面(包括问卷详情、包含的指标组合)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addQues")
	public ModelAndView addQues() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"问卷调查界面 包括问卷详情、包含的指标组合");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexscreeningquestionnaire/indexscreeningquestionnaire_com");
		mv.addObject("msg", "add");
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"保存一条问卷调查表");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PY_CODE", FirstLetterUtil.getFirstLetter(pd.getString("QUESTIONNAIRE_NAME")).toUpperCase());//自动生成拼音简码
		String nowDate = Tools.date2Str(new Date());
		pd.put("CREAT_TIME",nowDate);		  //创建时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		screeningQuestionnaireService.save(pd);
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("CHROICDISEASETYPE", dictionariesService.queryDictionary(Constants.DICT_CHROIN_DISEASE_TYPE));  //慢病类型
		pd = screeningQuestionnaireService.findById(pd);	//根据ID读取
		mv.setViewName("gp/indexscreeningquestionnaire/indexscreeningquestionnaire_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"问卷调查界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("CHROICDISEASETYPE", dictionariesService.queryDictionary(Constants.DICT_CHROIN_DISEASE_TYPE));  //慢病类型
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexscreeningquestionnaire/indexscreeningquestionnaire_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	/**
	 *新增问卷界面(包括问卷详情、包含的指标组合)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editQues")
	public ModelAndView editQues() throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"问卷调查编辑界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("gp/indexscreeningquestionnaire/indexscreeningquestionnaire_com");
		mv.addObject("pd", pd);
		mv.addObject("msg", "update");
		return mv;
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"问卷调查编辑");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("PY_CODE", FirstLetterUtil.getFirstLetter(pd.getString("QUESTIONNAIRE_NAME")).toUpperCase());//自动生成拼音简码
		screeningQuestionnaireService.update(pd);
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("CHROICDISEASETYPE", dictionariesService.queryDictionary(Constants.DICT_CHROIN_DISEASE_TYPE));  //慢病类型
		pd = screeningQuestionnaireService.findById(pd);	//根据ID读取
		mv.setViewName("gp/indexscreeningquestionnaire/indexscreeningquestionnaire_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**
	 * 修改页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"问卷调查编辑界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("CHROICDISEASETYPE", dictionariesService.queryDictionary(Constants.DICT_CHROIN_DISEASE_TYPE));  //慢病类型
		pd = screeningQuestionnaireService.findById(pd);	//根据ID读取
		mv.setViewName("gp/indexscreeningquestionnaire/indexscreeningquestionnaire_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除问卷调查");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.DEL.getCode());
		screeningQuestionnaireService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除问卷调查");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		 String IDS=String.valueOf(pd.get("IDS"));
		if(null!=IDS && !IDS.equals("")){
        	String[] str = IDS.split(",");
        	StringBuffer sb = new StringBuffer("(");
        	for(String s:str){
        		sb.append("'"+s+"',");
        	}
        	pd.put("IDS", sb.substring(0, sb.length()-1)+")");
        }
		String nowDate = Tools.date2Str(new Date());//删除的时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.DEL.getCode());
		screeningQuestionnaireService.delAll(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
	}

	
	
}
