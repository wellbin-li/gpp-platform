package com.tbyf.controller.app.apphealthinformation;

import java.io.BufferedReader;
import java.io.Reader;
import java.sql.Blob;
import java.sql.Clob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.service.information.healthinformation.HealthInformationManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;

/**
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  	用户名或密码错误
 * 05  	FKEY验证失败
 */
/**
 * APP查询健康资讯接口
 * @author ad
 *
 */
@Controller
@RequestMapping(value="/appHealthInformation")
public class IntHealthInformationController extends BaseController{
		
	@Resource(name="healthService")
	private HealthInformationManager healthService;
	
	 //	  @RequestMapping(value="/getHealth", method = RequestMethod.GET)
    @RequestMapping(value="/getHealth")
    @ResponseBody
    public Object getHealth()
    {
        logBefore(logger, "APP查询健康资讯接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message ="";
        try{	
        	if(Tools.checkKey("STATE", pd.getString("FKEY"))){	//检验请求key值是否合法
        	    int pageSize=1;//页码
       			int pageCount=10;//页数
              	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
              		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
              		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
              	}else{
              		pd.put("pageStart", (pageSize-1)* pageCount+1);
              		pd.put("pageEnd", pageSize * pageCount);
              	}
              	pd.put("STATE", EnumStatus.ENABLE.getCode());
    		    List<PageData> list=healthService.queryPage(pd);
    		    for(PageData pds :list){
    		    	Object REMARK = pds.get("REMARK");
					String str = null;   
			        if(REMARK instanceof Clob){  //Clob转换为String
			        	Clob clob = (Clob) REMARK;  
			            if (clob != null) {  
			               Reader read = clob.getCharacterStream();
			               BufferedReader br = new BufferedReader(read);
			               String s = br.readLine();
			               StringBuffer sb = new StringBuffer();
			               while(s!=null){
			            	   sb.append(s);
			            	   s=br.readLine();
			               }
			               str = sb.toString();
			            }  
			        }  
			        pds.put("REMARK", str);//将blob类型转换，在页面显示
    		    }
    			map.put("pd", list);
    			result = "01";
    			message=ResultMessageUtil.MESSAGE_1;
               
         	}else{
				result = "05";
				message=ResultMessageUtil.MESSAGE_5;
			}
        }catch (Exception e){
            logger.error(e.toString(), e);
            message=ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            map.put("message",message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
	
	/**
	  * APP健康资讯详情接口
	  * @return
	  */
	 @RequestMapping(value="/view" , method = RequestMethod.GET)
	@ResponseBody
	public Object viewHealthInformation(){
		logBefore(logger, "展示健康资讯接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try{
			if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("jkview", pd)){	//检查参数
					pd = healthService.findById(pd);
					if(pd!=null){
						Object REMARK = pd.get("REMARK");
						String str = null;   
				        if(REMARK instanceof Clob){  //Clob转换为String
				        	Clob clob = (Clob) REMARK;  
				            if (clob != null) {  
				               Reader read = clob.getCharacterStream();
				               BufferedReader br = new BufferedReader(read);
				               String s = br.readLine();
				               StringBuffer sb = new StringBuffer();
				               while(s!=null){
				            	   sb.append(s);
				            	   s=br.readLine();
				               }
				               str = sb.toString();
				            }  
				        }  
				        pd.put("REMARK", str);//将blob类型转换，在页面显示
				        int lll =Integer.valueOf(pd.get("LLL").toString())+1;
						pd.put("LLL",lll);
						map.put("pd", pd);
						result = "01";
						message = ResultMessageUtil.MESSAGE_1;
						//增加浏览量值
						pd.put("num", 1);
						healthService.addLLL(pd);
					}else{
						result = "02" ;
						message = ResultMessageUtil.MESSAGE_2;
					}
				}else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			}else{
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
			message = ResultMessageUtil.MESSAGE_0;
		}finally{
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
}
