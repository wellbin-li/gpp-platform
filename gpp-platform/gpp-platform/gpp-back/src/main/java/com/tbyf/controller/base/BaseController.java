package com.tbyf.controller.base;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import com.tbyf.entity.system.User;
import com.tbyf.util.Const;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.plugin.Page;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.Logger;
import com.tbyf.util.PageData;
import com.tbyf.util.UuidUtil;

/**
 * 修改时间：2015、12、11
 */
public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;

	/**
	 * 获取当前登录用户
	 * @return
	 */
	public User getCurUser(){
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User curUser = (User) session.getAttribute(Const.SESSION_USER);
		return  curUser;
	}

	/** new PageData对象
	 * @return
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**得到ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**得到request对象
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	/**得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	/**得到分页列表的信息
	 * @return
	 */
	public Page getPage(){
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
	
	public static void logAfter(Logger logger,String info){
		logger.info(info);
		logger.info("end");
		logger.info("");
	}
	
	public User getCurrentUser(){
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		return user;
	}
	
}
