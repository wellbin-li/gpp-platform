package com.tbyf.controller.hm.curedisease;

import com.tbyf.controller.base.*;
import com.tbyf.entity.enums.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.curedisease.*;
import com.tbyf.service.hm.diseasecode.*;
import com.tbyf.util.*;
import org.springframework.beans.propertyeditors.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import javax.annotation.*;
import java.io.*;
import java.text.*;
import java.util.*;

/** 
 * 说明：主治疾病
 * 创建人：
 * 创建时间：2016-07-01
 */
@Controller
@RequestMapping(value="/curedisease")
public class CureDiseaseController extends BaseController {
	
	String menuUrl = "curedisease/list.do"; //菜单地址(权限用)
	@Resource(name="curediseaseService")
	private CureDiseaseManager curediseaseService;
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseasecodeService;

	/**判断疾病编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasC")
	@ResponseBody
	public Object hasC(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(curediseaseService.findByDISEASE_CODE(pd) != null){
				errInfo = "error";
			}
			PageData pd1 = new PageData();
			pd1.put("JBBM",pd.getString("DISEASE_CODE"));
			if(diseasecodeService.findByDiseaseCode(pd1) == null){
				errInfo = "none";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增CureDisease");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CUREDISEASE_ID", this.get32UUID());	//主键
		PageData pd1 = new PageData();
		pd1.put("JBBM",pd.getString("DISEASE_CODE"));
		PageData org = diseasecodeService.findByDiseaseCode(pd1);
		pd.put("DISEASE_NAME",org.getString("JBMC"));
		pd.put("DISEASE_TYPE",org.getString("JBLB"));
		pd.put("CONFIG_DATE",new Date());
		pd.put("OPERATOR",getCurUser().getName());
		curediseaseService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}

	/**批量新增
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveAll")
	@ResponseBody
	public Object saveAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量新增CureDisease的主治疾病");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		String ORG_CODE = pd.getString("ORG_CODE");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for (String diseaseCode:ArrayDATA_IDS)
			{
				PageData pd1 = new PageData();
				pd1.put("ORG_CODE",ORG_CODE);
				pd1.put("DISEASE_CODE",diseaseCode);
				if(curediseaseService.findByDISEASE_CODE(pd1) != null)
				{
					continue;
				}else {
					pd.put("CUREDISEASE_ID", this.get32UUID());	//主键
					PageData pd2 = new PageData();
					pd2.put("JBBM",diseaseCode);
					PageData org = diseasecodeService.findByDiseaseCode(pd2);
					pd.put("DISEASE_CODE",diseaseCode);
					pd.put("DISEASE_NAME",org.getString("JBMC"));
					pd.put("DISEASE_TYPE",org.getString("JBLB"));
					pd.put("CONFIG_DATE",new Date());
					pd.put("OPERATOR",getCurUser().getName());
					curediseaseService.save(pd);
				}
			}
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除CureDisease");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		curediseaseService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改CureDisease");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CONFIG_DATE",new Date());
		pd.put("OPERATOR",getCurUser().getName());
		curediseaseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表CureDisease");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumDiseaseType", EnumDiseaseType.toMap());
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = curediseaseService.list(page);	//列出CureDisease列表
		mv.setViewName("hm/curedisease/curedisease_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("ORG_CODE",pd.getString("ORG_CODE"));
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("hm/curedisease/curedisease_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**去新增疾病页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddDis")
	public ModelAndView goAddDis(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = diseasecodeService.list(page);	//列出DiseaseCode列表

		mv.setViewName("hm/curedisease/curedisease_add_list");
		mv.addObject("varList", varList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("pd", pd);
		return mv;
	}
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = curediseaseService.findById(pd);	//根据ID读取
		mv.setViewName("hm/curedisease/curedisease_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除CureDisease");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			curediseaseService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出CureDisease到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("机构编码");	//1
		titles.add("疾病编码");	//2
		titles.add("疾病名称");	//3
		titles.add("疾病类别");	//4
		titles.add("配置时间");	//5
		titles.add("操作人");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = curediseaseService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ORG_CODE"));	//1
			vpd.put("var2", varOList.get(i).getString("DISEASE_CODE"));	//2
			vpd.put("var3", varOList.get(i).getString("DISEASE_NAME"));	//3
			vpd.put("var4", varOList.get(i).getString("DISEASE_TYPE"));	//4
			vpd.put("var5", varOList.get(i).getString("CONFIG_DATE"));	//5
			vpd.put("var6", varOList.get(i).getString("OPERATOR"));	//6
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
