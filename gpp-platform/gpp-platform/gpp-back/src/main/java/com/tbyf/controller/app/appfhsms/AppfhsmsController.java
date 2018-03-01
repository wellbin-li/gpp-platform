package com.tbyf.controller.app.appfhsms;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsPMsg;
import com.tbyf.entity.enums.EnumIsUrl;
import com.tbyf.entity.enums.EnumMessageType;
import com.tbyf.service.hm.devicepush.DevicePushManager;
import com.tbyf.service.system.appuser.AppuserManager;
import com.tbyf.service.system.fhsms.FhsmsManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.DateUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;
import com.tbyf.util.jpush.entity.MemberMessage;
import com.tbyf.util.jpush.service.PushMessageService;

/**
 * app站内信接口
 * @author wuml 
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  	用户名或密码错误
 * 05  	FKEY验证失败
 */

@Controller
@RequestMapping(value="/appFhsms")
public class AppfhsmsController extends BaseController {
	
	@Resource(name="fhsmsService")
	private FhsmsManager fhsmsService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	@Resource(name="pushMessageService")
	private PushMessageService pushMessageService;//推送关联Service
	@Resource(name="devicePushService")
	private DevicePushManager devicePushService;//推送关联Service 
	
	/**
	 * 查询站内信列表
	 * @return
	 */
	@RequestMapping(value="/getFhsmsList",method=RequestMethod.GET)
	@ResponseBody
	public Object getFhsmsList(){
		 logBefore(logger, "删除签约管理");
		  Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("USER_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
		    		int pageSize=1;//页码
	        		int pageCount=10;//页数
	               	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	               		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	               	}else{
	               		pd.put("pageStart", (pageSize-1)* pageCount+1);
	               		pd.put("pageEnd", pageSize * pageCount);
	               	}
	               	if(pd.get("TYPE")!=null){
	               		if(pd.get("TYPE").equals("1")){
	               			//查询收件箱
	               			pd.put("TO_USERID", pd.get("USER_ID"));
	               		}else{
	               			//查询发件箱
	               			pd.put("FROM_USERID",  pd.get("USER_ID"));
	               		}
	               		List<PageData>	varList = fhsmsService.listForApp(pd);
			        	map.put("pd", varList);
			            result = "01";
			            message =ResultMessageUtil.MESSAGE_1;
	               	}else{
	               		result = "03";
				        message =ResultMessageUtil.MESSAGE_3;
	               	}
	        	}else{
	        		result = "05";
			        message =ResultMessageUtil.MESSAGE_5;
	        	}
	        }catch (Exception e){
			    message =ResultMessageUtil.MESSAGE_0;
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            map.put("message", message);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 新增站内信
	 * @return
	 */
	@RequestMapping(value="/addFhsms",method=RequestMethod.POST)
	@ResponseBody
	public Object addFhsms(){
		 logBefore(logger, "发送站内信");
		  Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        PageData pdDevicePush = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("USER_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        		 
	        		if(AppUtil.checkParam("addFhsms", pd)){	//检查参数
	        			String[] USERIDS = pd.getString("TO_USERID").split(",");
	        			 String[] res = new String[USERIDS.length];//推送的id数组 
	        		     PageData fStr = new PageData();//通知ID
	        			for(int i=0;i<USERIDS.length;i++){
	        				PageData userPd  =new PageData();
	        				userPd.put("USER_ID",USERIDS[i]);
	        				userPd = appuserService.findById(userPd);
	        				if(userPd!=null){
		        				PageData savePd  =new PageData();
		        				savePd.put("STATUS", "2");	
		        				String SANME_ID = this.get32UUID();
		        				savePd.put("SANME_ID", SANME_ID);					//共同ID
		        				savePd.put("SEND_TIME", DateUtil.getTime());				//发送时间
		        				String FHSMS_ID = this.get32UUID();
		        				savePd.put("FHSMS_ID", FHSMS_ID);					//主键1
		        				savePd.put("TYPE", "2");					 
		        				savePd.put("CONTENT", pd.get("CONTENT"));
		        				savePd.put("TO_USERNAME", userPd.get("NAME"));					//收信人
		        				String USER_ID = userPd.get("USER_ID").toString();//收信人ID
		        				savePd.put("TO_USERID",USER_ID);
		    					userPd.put("USER_ID", pd.get("FROM_USERID"));
		    					userPd = appuserService.findById(userPd);
		    					savePd.put("FROM_USERID",  userPd.get("USER_ID"));
		    					savePd.put("FROM_USERNAME",  userPd.get("NAME"));	//发信人
		    					savePd.put("USERID", USERIDS[i]);
		    					pd.put("ISPMSG", EnumIsPMsg.YES.getCode());
		    					pdDevicePush = devicePushService.findByUserID(savePd);//获得用户设备的推送ID
		    					if(null != pdDevicePush) {
		    						res[i] = pdDevicePush.get("DEVUSERID").toString();
		    						fStr.put(USER_ID, FHSMS_ID);
		    					}
		    					fhsmsService.save(savePd);	
		    					savePd.put("FHSMS_ID", this.get32UUID());					//主键2
		    					savePd.put("TYPE", "1");									//类型1：收信
		    					fhsmsService.save(savePd);
		    					result = "01";
			               		message =ResultMessageUtil.MESSAGE_1;
	        				}else{
	        					result = "00";
			               		message =ResultMessageUtil.MESSAGE_0;
	        				}
	        			}
    					//判断用户是否在用app设备
    					if(null != pdDevicePush) {
    						MemberMessage memberMessage = new MemberMessage();
    						memberMessage.setIsUrl(EnumIsUrl.NO.getCode());//不带连接的
    						memberMessage.setType(EnumMessageType.STOP.getCode());
    						memberMessage.setDeviceIdStr(res);//设备的推送ID
    						memberMessage.setContent("来自" + Jurisdiction.getUser().getName() + "站内信");//推送的内容
    						memberMessage.setTitle("站内信");
    						memberMessage.setFHSMS_IDStr(fStr);
    						pushMessageService.sentStopMessage(memberMessage);
    					}
	               	}else{
	               		result = "03";
	               		message =ResultMessageUtil.MESSAGE_3;
	               	}
	        	}else{
	        		result = "05";
			        message =ResultMessageUtil.MESSAGE_5;
	        	}
	        }catch (Exception e){
			    message =ResultMessageUtil.MESSAGE_0;
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            map.put("message", message);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 查询站内信
	 * @return
	 */
	@RequestMapping(value="/getFhsms",method=RequestMethod.GET)
	@ResponseBody
	public Object getFhsms(){
		 logBefore(logger, "删除签约管理");
		  Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("FHSMS_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        		pd = fhsmsService.findById(pd);	//根据ID读取
	               	if(pd!=null){	 
	               		result = "01";
	               		message =ResultMessageUtil.MESSAGE_1;
	               		if(pd.get("TYPE").equals("1") && pd.get("STATUS").equals("2")){
		               		pd.put("STATUS","1"); //设置已读
		               		fhsmsService.edit(pd);
	               		}
		               	map.put("pd", pd);
	               	}else{
	               		result = "02";
				        message ="查询空值";
	               	}
	        	}else{
	        		result = "05";
			        message =ResultMessageUtil.MESSAGE_5;
	        	}
	        }catch (Exception e){
			    message =ResultMessageUtil.MESSAGE_0;
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            map.put("message", message);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 查询站内信
	 * @return
	 */
	@RequestMapping(value="/deleteFhsms",method=RequestMethod.GET)
	@ResponseBody
	public Object deleteFhsms(){
		 logBefore(logger, "删除签约管理");
		  Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("FHSMS_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        		fhsmsService.delete(pd);	//根据ID读取
               		result = "01";
               		message =ResultMessageUtil.MESSAGE_1;
	        	}else{
	        		result = "05";
			        message =ResultMessageUtil.MESSAGE_5;
	        	}
	        }catch (Exception e){
			    message =ResultMessageUtil.MESSAGE_0;
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            map.put("message", message);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	}

}
