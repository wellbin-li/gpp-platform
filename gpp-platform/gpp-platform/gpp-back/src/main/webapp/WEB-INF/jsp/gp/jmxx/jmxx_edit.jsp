<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- 弹出居民信息新增页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
 <link rel="stylesheet" href="static/ace/css/bootstrap-editable.css">
 <link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<form action="jmxx/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="USER_AGENT_ID" id="USER_AGENT_ID" value="${pd.USER_AGENT_ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">居民基本信息</h5>
                                        <span class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                            <a href="#" data-action="fullscreen" class="orange2">
                                                <i class="ace-icon fa fa-expand"></i>
                                            </a>
                                        </span>
                                </div>
                                <div class="widget-body col-xs-12">
                                	 <div class="widget-main col-xs-12">
                                	 	<div class="col-xs-12 col-sm-4 center">
                                	 		<span class="profile-picture">
													<img id="avatar0" class="editable img-responsive" alt="${pd.USER_NAME}"  src="${pd.IMAGE_URL}" onerror="onerror=null;src='static/ace/avatars/profile-pic.jpg'" width="182" height="207"/>
												</span>
                                                <div class="space-4"></div>
                                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                                    <div class="inline position-relative">
                                                        <span class="white">${pd.USER_NAME}</span>
                                                    </div>
                                                </div>
                                	 	</div>
                                	 	<div class="col-xs-12 col-sm-8">
                                	 		<div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >姓名:</label>
                                                    <div class="col-sm-8">
                                                        <span   class="col-sm-12 from-control-span">
                                                        	<input type="text" name="USER_NAME" id="USER_NAME" value="${pd.USER_NAME }" placeholder="这里输入姓名" title="姓名" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SEX">性别:</label>
                                                    <div class="col-sm-8">
                                                        <span  class="col-sm-12 from-control-span">
															<select class="chosen-select form-control" name="SEX" id="SEX" data-placeholder="性别" style="vertical-align:top;width: 98%;">
																<option value="2" <c:if test="${pd.SEX == '2' }">selected</c:if> >女</option>
																<option value="1" <c:if test="${pd.SEX == '1' }">selected</c:if> >男</option>
															</select>
														</span>
                                                    </div>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDTYPE">证件类型:</label>
                                                    <div class="col-sm-8">
                                                       <span  class="col-sm-12 from-control-span">居民身份证</span> 
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDNO">证件号码:</label>
                                                    <div class="col-sm-8">
                                                        <span  class="col-sm-12 from-control-span"><input type="text" name="ID_NUMBER" id="ID_NUMBER" value="${pd.ID_NUMBER }" maxlength="18" placeholder="这里输入身份证号" title="身份证号" onblur="hasI()" style="width:98%;" /></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="BIRTHDAY_TIME">出生日期:</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group col-xs-12">
                                                            <span  class="col-sm-12 from-control-span">
                                                            	<input class="span10 date-picker" name="BIRTHDAY_TIME" id="BIRTHDAY_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.BIRTHDAY_TIME}" />' type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:98%;" placeholder="出生日期" title="出生日期"/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="PHONE">联系电话:</label>
                                                    <div class="col-sm-8">
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="TELEPHONE" id="TELEPHONE" value="${pd.TELEPHONE }" placeholder="手机号" title="手机号" onblur="yanT();" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="POSTCODE "  >邮政编码:</label>
                                                    <div class="col-sm-8"  >
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="POSTCODE" id="POSTCODE" value="${pd.POSTCODE }" placeholder="邮政编码" title="邮政编码" onblur="yanP();" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="ADDRESS">详细地址:</label>
                                                    <div class="col-sm-8" id="STREETDiv">
                                                        <span class="col-sm-12 from-control-span">
                                                              <input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS }" placeholder="详细地址" title="详细地址" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="form-group">
												 <div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >区域</label>
													 <div class="col-sm-8"  >
														 <span  class="col-sm-12 from-control-span">
															<input type="text" name="AREA" id="AREA" value="${pd.AREA }" placeholder="区域" title="区域" style="width:98%;" />
														</span>
													 </div>
												 </div>
												<div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >头像URL</label>
													 <div class="col-sm-8" >
														 <span   class="col-sm-12 from-control-span">
															<input type="text" name="IMAGE_URL" id="IMAGE_URL" value="${pd.IMAGE_URL }" placeholder="头像URL" title="头像URL" style="width:98%;" />
														 </span>
													 </div>
												</div>
											</div>
											<div class="form-group">
												 <div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >区域ID</label>
													 <div class="col-sm-8"  >
														 <span class="col-sm-12 from-control-span">
															<input type="text" name="AREA_ID" id="AREA_ID" value="${pd.AREA_ID }" placeholder="区域ID" title="区域ID" style="width:98%;" />
														</span>
													 </div>
												 </div>
												<div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >手机定位地址:</label>
													 <div class="col-sm-8" >
														 <span   class="col-sm-12 from-control-span">
															<input type="text" name="LOCAL_ADDRESS" id="LOCAL_ADDRESS" value="${pd.LOCAL_ADDRESS }" placeholder="手机定位传入的地址" title="手机定位传入的地址" style="width:98%;" />
														 </span>
													 </div>
												</div>
											</div>
										</div>
                                	 </div>
                                </div>
                            </div>
                            </div>
							<div class="form-group">
                            <div class="widget-box col-xs-12">
			                     <div class="widget-header">
			                           <h5 class="widget-title">居民的账号信息</h5>
			                               <span class="widget-toolbar">
	                                            <a href="#" data-action="collapse">
	                                                <i class="ace-icon fa fa-chevron-up"></i>
	                                            </a>
	                                            <a href="#" data-action="fullscreen" class="orange2">
	                                                <i class="ace-icon fa fa-expand"></i>
	                                            </a>
	                                      </span>
	                             </div>
	                              <div class="widget-body col-xs-12">
	                              	<div class="form-group">
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="HEALTHSN">健康账号:</label>
                                               <div class="col-sm-8">
                                                   <span  class="col-sm-12 from-control-span">
                                                   		<input type="text" name="HEALTH_ACCOUNT" id="HEALTH_ACCOUNT" value="${pd.HEALTH_ACCOUNT }" placeholder="健康账号" title="健康账号" style="width:98%;" />
                                                   </span>
                                               </div>
                                           </div>
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="HEADTHCARDNO">医保卡号:</label>
                                               <div class="col-sm-8">
                                                   <span  class="col-sm-12 from-control-span">
                                                   		<input type="text" name="MI_CARD" id="MI_CARD"  value="${pd.MI_CARD }" placeholder="输入医保卡号"  title="医保卡号" onblur="hasM()" style="width:98%;" />
                                                   </span>
                                               </div>
                                           </div>
                                  	</div>
                                  	<div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="COMMUNITY">微信账号:</label>
                                                    <div class="col-sm-8" id="COMMUNITYDiv">
                                                        <span   class="col-sm-12 from-control-span">
                                                        	<input type="text" name="WXACCOUNT" id="WXACCOUNT" value="${pd.WXACCOUNT }" placeholder="微信账号" title="微信账号" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
												<div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="QQACCOUNT ">QQ账号:</label>
                                                    <div class="col-sm-8" id="AREADiv">
                                                        <span   class="col-sm-12 from-control-span">
                                                        	<input type="text" name="QQACCOUNT" id="QQACCOUNT" value="${pd.QQACCOUNT }" placeholder="QQ账号" title="QQ账号" onblur="yanQ();" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
							  		 </div>
							  		 <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SINAACCOUNT "  >新浪账号:</label>
                                                    <div class="col-sm-8"  >
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="SINAACCOUNT" id="SINAACCOUNT" value="${pd.SINAACCOUNT }" placeholder="新浪账号" title="新浪账号" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="REFERRAL_CODE "  >推荐码:</label>
                                                    <div class="col-sm-8"  >
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="REFERRAL_CODE" id="REFERRAL_CODE" value="${pd.REFERRAL_CODE }" placeholder="推荐码" title="推荐码" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                     </div>
                                     <div class="form-group">
                                               <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="REFERRAL_CODE "  >邮箱:</label>
                                                    <div class="col-sm-8"  >
                                                        <span class="col-sm-12 from-control-span">
                                                        	<input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL }" placeholder="邮箱" title="邮箱" onblur="yanE();" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >UUID:</label>
											 <div class="col-sm-8"  >
												 <span  class="col-sm-12 from-control-span">
													<input type="text" name="UUID" id="UUID" value="${pd.UUID }" placeholder="UUID" title="UUID" style="width:98%;" />
												</span>
											 </div>
										 </div>
                                      </div>
                                     <div class="form-group">
                                          <div class="col-xs-12 col-sm-6">
                                              <label class="col-sm-4 control-label no-padding-right" for="IS_INDEPENDENCE">是否独立:</label>
                                              <div class="col-sm-8">
                                                  <span   class="col-sm-12 from-control-span">
														<select class="chosen-select form-control" name="IS_INDEPENDENCE" id="IS_INDEPENDENCE" data-placeholder="是否独立" style="vertical-align:top;width: 98%;">
															<option value="1" <c:if test="${pd.IS_INDEPENDENCE == '1' }">selected</c:if> >是</option>
															<option value="0" <c:if test="${pd.IS_INDEPENDENCE == '0' }">selected</c:if> >否</option>
														</select>
												  </span>
                                              </div>
                                          </div>
                                          <div class="col-xs-12 col-sm-6">
                                              <label class="col-sm-4 control-label no-padding-right" for="SHARE_AMOUNT ">软件分享次数:</label>
                                              <div class="col-sm-8">
                                                  <span  class="col-sm-12 from-control-span">
                                                  	<input type="text" name="SHARE_AMOUNT" id="SHARE_AMOUNT" value="${pd.SHARE_AMOUNT }" placeholder="软件分享次数" title="软件分享次数" style="width:98%;" />
                                                  </span>
                                              </div>
                                          </div>
                                     </div>
                                     <div class="form-group">
                                             <div class="col-xs-12  col-sm-6">
                                                 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >是否锁定:</label>
                                                 <div class="col-sm-8"  >
                                                     <span  class="col-sm-12 from-control-span">
														<select class="chosen-select form-control" name="IS_LOCK" id="IS_LOCK" data-placeholder="是否锁定" style="vertical-align:top;width: 98%;">
															<option value="0" <c:if test="${pd.IS_LOCK == '0' }">selected</c:if> >否</option>
															<option value="1" <c:if test="${pd.IS_LOCK == '1' }">selected</c:if> >是</option>
														</select>
													</span>
                                                 </div>
                                             </div>
											<div class="col-xs-12  col-sm-6">
                                                 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >锁定人ID:</label>
                                                 <div class="col-sm-8" >
                                                     <span   class="col-sm-12 from-control-span">
                                                     	<input type="text" name="OPERATOR_ID" id="OPERATOR_ID" value="${pd.OPERATOR_ID }" placeholder="锁定人ID" title="锁定人ID" style="width:98%;" />
                                                     </span>
                                                 </div>
                                            </div>
                                     </div>
                                      <div class="form-group">
										 <div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >密码:</label>
											 <div class="col-sm-8"  >
												 <span  class="col-sm-12 from-control-span">
													<input type="password" name="PASSWORD" id="PASSWORD" value="${pd.PASSWORD }" placeholder="这里输入密码" title="密码" style="width:98%;" />
												</span>
											 </div>
										 </div>
										<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >原始密码:</label>
											 <div class="col-sm-8" >
												 <span   class="col-sm-12 from-control-span">
													<input type="PASSWORD" name="OLDPASS" id="OLDPASS" value="${pd.OLDPASS }" placeholder="这里输入原始密码" title="原始密码" style="width:98%;" />
												 </span>
											 </div>
										</div>
									</div>
									<div class="form-group">
										 <div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >状态:</label>
											 <div class="col-sm-8"  >
												 <span class="col-sm-12 from-control-span">
													<select class="chosen-select form-control" name="STATE" id="STATE" data-placeholder="状态" style="vertical-align:top;width: 98%;">
														<option value="1" <c:if test="${pd.PROCESSING_STATUS == '1' }">selected</c:if> >禁用</option>
														<option value="0" <c:if test="${pd.PROCESSING_STATUS == '0' }">selected</c:if> >有效</option>
													</select>
												</span>
											 </div>
										 </div>
										<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >昵称:</label>
											 <div class="col-sm-8" >
												 <span   class="col-sm-12 from-control-span">
													<input type="text" name="NICK_NAME" id="NICK_NAME" value="${pd.NICK_NAME }" placeholder="昵称" title="昵称" style="width:98%;" />
												 </span>
											 </div>
										</div>
									</div>
									<div class="form-group">
										 <div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >第三方登录ID:</label>
											 <div class="col-sm-8"  >
												 <span  class="col-sm-12 from-control-span">
													<input type="text" name="OPEN_ID" id="OPEN_ID" value="${pd.OPEN_ID }" placeholder="第三方登录ID" title="第三方登录ID" style="width:98%;" />
												</span>
											 </div>
										 </div>
										<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >第三方登录类型:</label>
											 <div class="col-sm-8" >
												 <span   class="col-sm-12 from-control-span">
													<input type="text" name="OPEN_ID_TYPE" id="OPEN_ID_TYPE" value="${pd.OPEN_ID_TYPE }" placeholder="第三方登录类型" title="第三方登录类型" style="width:98%;" />
												 </span>
											 </div>
										</div>
									</div>
									<div class="form-group">
										 <div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >外接公司编号:</label>
											 <div class="col-sm-8"  >
												 <span  class="col-sm-12 from-control-span">
													<input type="text" name="COMPID" id="COMPID" value="${pd.COMPID }" placeholder="外接公司编号" title="外接公司编号" style="width:98%;" />
												</span>
											 </div>
										 </div>
										<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >微信TOKEN:</label>
											 <div class="col-sm-8" >
												 <span   class="col-sm-12 from-control-span">
													<input type="text" name="APPID" id="APPID" value="${pd.APPID }" placeholder="微信TOKEN" title="微信TOKEN" style="width:98%;" />
												 </span>
											 </div>
										</div>
									</div>
									<div class="form-group">
									   <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="WEIGHT" >云信编号:</label>
                                                    <div class="col-sm-8"  >
                                                        <span   class="col-sm-12 from-control-span">
                                                        	<input type="text" name="YXID" id="YXID" value="${pd.YXID }" placeholder="云信编号" title="云信编号" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
										<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >云信密码:</label>
											 <div class="col-sm-8" >
												 <span   class="col-sm-12 from-control-span">
													<input type="password" name="YXPASS" id="YXPASS" value="${pd.YXPASS }" placeholder="云信密码" title="云信密码" style="width:98%;" />
												 </span>
											 </div>
										</div>
									</div>
									<div class="form-group">
										 <div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >二维码URL:</label>
											 <div class="col-sm-8"  >
												 <span  class="col-sm-12 from-control-span">
													<input type="text" name="QR_CODE_URL" id="QR_CODE_URL" value="${pd.QR_CODE_URL }" placeholder="二维码URL" title="二维码URL" style="width:98%;" />
												</span>
											 </div>
										 </div>
										<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >是否认证:</label>
											 <div class="col-sm-8" >
												 <span  id="OPERATOR_ID  " class="col-sm-12 from-control-span">
													<select name="IS_COMPLETE" id="IS_COMPLETE" style="width:98%;">
											             <c:forEach items="${pd.EnumIsComplete}" var="item">
			                                             <c:choose>
			                                                 <c:when test="${pd.is_complete == item.key}">
			                                                       <option value="${item.key}" selected="selected">${item.value}</option>
			                                                 </c:when>
			                                                 
			                                                       <c:otherwise>
			                                                        <option value="${item.key}">${item.value}</option>
			                                                       </c:otherwise>
			                                                  
			                                                  </c:choose>
			                                             </c:forEach>
												     </select>
												 </span>
											 </div>
										</div>
									</div>
									<div class="form-group">
										 <div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right"  >释放时间:</label>
											 <div class="col-sm-8"  >
												 <span  class="col-sm-12 from-control-span">
									                <input class="span10 date-picker" name="RELEASE_TIME" id="RELEASE_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.RELEASE_TIME}" />' type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:98%;" placeholder="释放时间" title="释放时间"/>
												</span>
											 </div>
										 </div>
										<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >锁定时间:</label>
											 <div class="col-sm-8" >
												 <span  class="col-sm-12 from-control-span">
													<input class="span10 date-picker" name="OPERATOR_TIME"" id="OPERATOR_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.OPERATOR_TIME}" />' type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:98%;" placeholder="释放时间" title="释放时间"/>												
												 </span>
											 </div>
										</div>
									</div>
									<div class="form-group">
										 <div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >外接公司人员编码：</label>
											 <div class="col-sm-8"  >
												 <span  class="col-sm-12 from-control-span">
													<input type="text" name="COM_AGENTID" id="COM_AGENTID" value="${pd.COM_AGENTID }" placeholder="外接公司人员编码" title="外接公司人员编码" style="width:98%;" />
												</span>
											 </div>
										 </div>
										<div class="col-xs-12  col-sm-6">
											 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " ></label>
											 <div class="col-sm-8" >
												 <span  class="col-sm-12 from-control-span">
													
												 </span>
											 </div>
										</div>
									</div>
	                              </div>
                            </div>
                            </div>
                            <div class="form-group">
                            <div class="widget-box col-xs-12">
	                                <div class="widget-header">
	                                    <h5 class="widget-title">居民健康信息</h5>
	                                        <span class="widget-toolbar">
	                                            <a href="#" data-action="collapse">
	                                                <i class="ace-icon fa fa-chevron-up"></i>
	                                            </a>
	                                            <a href="#" data-action="fullscreen" class="orange2">
	                                                <i class="ace-icon fa fa-expand"></i>
	                                            </a>
	                                        </span>
	                               </div>
	                              <div class="widget-body col-xs-12">
	                              	<div class="form-group">
                                        <div class="col-xs-12  col-sm-6">
                                            <label class="col-sm-4 control-label no-padding-right" for="HEIGHT " >身高(CM):</label>
                                            <div class="col-sm-8" >
                                                <span class="col-sm-12 from-control-span">
                                                	<input type="text" name="HEIGHT" id="HEIGHT" value="${pd.HEIGHT }" placeholder="身高(单位：CM)" title="身高" onblur="yanHEIGHT();" style="width:95%;" />
                                                </span>
                                            </div>
                                        </div>
										<div class="col-xs-12  col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="WEIGHT" >体重(单位:kg):</label>
                                                <div class="col-sm-8"  ">
                                                    <span  class="col-sm-12 from-control-span">
                                                    	<input type="text" name="WEIGHT" id="WEIGHT" value="${pd.WEIGHT }" placeholder="体重(单位：KG)" title="体重" onblur="yanWEIGHT();" style="width:95%;" />
                                                   	</span>
                                                </div>
                                     	</div>
                                     </div>
                                     <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HISTORY_ALLERGIC " >过敏史:</label>
                                                    <div class="col-sm-8" >
                                                        <span   class="col-sm-12 from-control-span">
                                                        	<input type="text" name="HISTORY_ALLERGIC" id="HISTORY_ALLERGIC" value="${pd.HISTORY_ALLERGIC }" placeholder="过敏史" title="过敏史" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HISTORY_OPERATION " >手术史:</label>
                                                    <div class="col-sm-8"  >
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="HISTORY_OPERATION" id="HISTORY_OPERATION" value="${pd.HISTORY_OPERATION }" placeholder="手术史" title="手术史" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HISTORY_ALLERGIC ">备注:</label>
                                                    <div class="col-sm-8"  >
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="REMARK" id="REMARK" value="${pd.REMARK }" placeholder="备注" title="备注" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HISTORY_OPERATION " >所属分组:</label>
                                                    <div class="col-sm-8" >
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="GROUP_ID" id="GROUP_ID" value="${pd.GROUP_ID }" placeholder="所属分组（多个分组以，隔开）" title="所属分组（多个分组以，隔开）" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTOR_OPERATOR_ID ">医生与患者关联ID:</label>
                                                    <div class="col-sm-8">
                                                        <span class="col-sm-12 from-control-span">
                                                        	<input type="text" name="DOCTOR_OPERATOR_ID" id="DOCTOR_OPERATOR_ID" value="${pd.DOCTOR_OPERATOR_ID }" placeholder="医生与患者关联ID" title="医生与患者关联ID" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTOR_OPERATOR_TIME " >医生与患者关联操作时间:</label>
                                                    <div class="col-sm-8"  >
                                                        <span class="col-sm-12 from-control-span">
                                                        	<input class="span10 date-picker" name="DOCTOR_OPERATOR_TIME" id="DOCTOR_OPERATOR_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.DOCTOR_OPERATOR_TIME}" />' type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:98%;" placeholder="医生与患者关联操作时间" title="医生与患者关联操作时间"/>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                           <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTOR_OPERATOR_ID " >签约状态:</label>
                                                    <div class="col-sm-8" >
                                                        <span   class="col-sm-12 from-control-span">
														<select class="chosen-select form-control" name="IS_SIGN" id="IS_SIGN" data-placeholder="签约状态" style="vertical-align:top;width: 98%;">
															<option value="0" <c:if test="${pd.IS_SIGN == '0' }">selected</c:if> >未签约</option>
															<option value="1" <c:if test="${pd.IS_SIGN == '1' }">selected</c:if> >待签约</option>
															<option value="2" <c:if test="${pd.IS_SIGN == '2' }">selected</c:if> >已签约</option>
														</select>
														</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTOR_OPERATOR_TIME " >是否重点人群</label>
                                                    <div class="col-sm-8" >
                                                        <span  class="col-sm-12 from-control-span">
															 <select class="chosen-select form-control" name="ZDRQ" id="ZDRQ" data-placeholder="重点人群" style="vertical-align:top;width: 98%;">
																<option value="1" <c:if test="${pd.ZDRQ == '1' }">selected</c:if> >是</option>
																<option value="2" <c:if test="${pd.ZDRQ == '2' }">selected</c:if> >否</option>
															</select>
														</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
												 <div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >加急状态:</label>
													 <div class="col-sm-8"  >
														 <span  class="col-sm-12 from-control-span">
															<select class="chosen-select form-control" name="PROCESSING_STATUS" id="PROCESSING_STATUS" data-placeholder="加急状态" style="vertical-align:top;width: 98%;">
																<option value="0" ></option>
																<option value="1" <c:if test="${pd.PROCESSING_STATUS == '1' }">selected</c:if> >立即</option>
																<option value="2" <c:if test="${pd.PROCESSING_STATUS == '2' }">selected</c:if> >优先</option>
																<option value="3" <c:if test="${pd.PROCESSING_STATUS == '3' }">selected</c:if> >尽快</option>
																<option value="4" <c:if test="${pd.PROCESSING_STATUS == '4' }">selected</c:if> >普通</option>
															</select>
														</span>
													 </div>
												 </div>
												<div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >客户来源</label>
													 <div class="col-sm-8" >
														 <span  id="OPERATOR_ID  " class="col-sm-12 from-control-span">
															<input type="text" name="SOURCE_FROM" id="SOURCE_FROM" value="${pd.SOURCE_FROM }" placeholder="客户来源" title="客户来源" style="width:98%;" />
														 </span>
													 </div>
												</div>
											</div>
											<div class="form-group">
												 <div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right"  >申请签约日期:</label>
													 <div class="col-sm-8"  >
														 <span  class="col-sm-12 from-control-span">
															<input class="span10 date-picker" name="SIGN_APPLY_TIME" id="SIGN_APPLY_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.SIGN_APPLY_TIME}" />' type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:98%;" placeholder="申请日期" title="申请日期"/>
														</span>
													 </div>
												 </div>
												<div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " ></label>
													 <div class="col-sm-8" >
														 <span  class="col-sm-12 from-control-span">
															
														 </span>
													 </div>
												</div>
											</div>
	                              </div> 
                             </div>
                            </div>
							    <div align="center">
									<a class="btn btn-mini btn-primary" onclick="save();" >保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</div>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
				<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			    </a>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
    <script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
    <!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDialog.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	//验证身份证正则表达式
	function isSfzh(sfzh){
		return(new RegExp(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/).test(sfzh));
	}
	
	//验证邮箱正则表达式
	function isEmail(email){
		return(new RegExp(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/).test(email));
	}
	
	//验证手机号正则表达式
	function isTel(telephone){
		return(new RegExp(/^(13[0-9]{9})|(14[0-9]{9})|(15[0-9]{9})|(18[0-9]{9})$/).test(telephone));
	}
	
	//验证QQ号正则表达式
	function isQQ(qqaccount){
		return(new RegExp(/^\d{5,10}$/).test(qqaccount));
	}
	
	//验证邮编正则表达式
	function isPostcode(postcode){
		return(new RegExp(/^\d{6}$/).test(postcode));
	}
	
	//验证身高,体重
	function isHEIGHT(height){
		return(new RegExp(/^[0-9]{2,3}$/).test(height));
	}
	
	//验证邮箱格式
	function yanE(){
		if(!isEmail($("#EMAIL").val()) && $("#EMAIL").val() != ""){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").val("");
			return false;
		}
	}
	
	//验证电话号码号格式
	function yanT(){
		if(!isTel($("#TELEPHONE").val()) && $("#TELEPHONE").val() != ""){
			$("#TELEPHONE").tips({
				side:3,
	            msg:'手机号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TELEPHONE").val("");
			return false;
		}
	}
	
	//验证QQ格式
	function yanQ(){
		if(!isQQ($("#QQACCOUNT").val()) && $("#QQACCOUNT").val() !=""){
			$("#QQACCOUNT").tips({
				side:3,
	            msg:'QQ号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QQACCOUNT").val("");
			return false;
		}
	}
	
	//验证邮编格式
	function yanP(){
		if(!isPostcode($("#POSTCODE").val()) && $("#POSTCODE").val() !=""){
			$("#POSTCODE").tips({
				side:3,
	            msg:'邮政编码格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#POSTCODE").val("");
			return false;
		}
	}
	
	//验证身高
	function yanHEIGHT(){
		if(!isHEIGHT($("#HEIGHT").val()) && $("#HEIGHT").val() !=""){
			$("#HEIGHT").tips({
				side:3,
	            msg:'身高值不在范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HEIGHT").val("");
			return false;
		}
	}
	
	//验证体重
	function yanWEIGHT(){
		if(!isHEIGHT($("#WEIGHT").val()) && $("#WEIGHT").val() !=""){
			$("#WEIGHT").tips({
				side:3,
	            msg:'体重值不在范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#WEIGHT").val("");
			return false;
		}
	}
	
	//保存
	function save(){
		if($("#USER_NAME").val()==""){
			$("#USER_NAME").tips({
				side:3,
	            msg:'请输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_NAME").focus();
			return false;
		} else {
			$("#USER_NAME").val($.trim($("#USER_NAME").val()));
		}
		
		if($("#HEALTH_ACCOUNT").val()==""){
			$("#HEALTH_ACCOUNT").tips({
				side:3,
	            msg:'请输入健康账号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HEALTH_ACCOUNT").focus();
			return false;
		}else{
			$("#HEALTH_ACCOUNT").val($.trim($("#HEALTH_ACCOUNT").val()));
		}	
		if($("#ID_NUMBER").val()==""){
			
			$("#ID_NUMBER").tips({
				side:3,
	            msg:'请输入身份证号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ID_NUMBER").focus();
			return false;
		}else if(!isSfzh($("#ID_NUMBER").val())){
			$("#ID_NUMBER").tips({
				side:3,
	            msg:'身份证号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ID_NUMBER").val("");
			return false;
		} else {
			$("#ID_NUMBER").val($.trim($("#ID_NUMBER").val()));
		}
		
		
		if($("#MI_CARD").val()==""){
			$("#MI_CARD").tips({
				side:3,
	            msg:'输入医保卡号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MI_CARD").focus();
			return false;
		} else {
			$("#MI_CARD").val($.trim($("#MI_CARD").val()));
		}
		
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	//判断医保卡号是否存在
	function hasM(){
		var MI_CARD = $("#MI_CARD").val();
		var USER_AGENT_ID = $("#USER_AGENT_ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>jmxx/hasM.do',
	    	data: {MI_CARD:MI_CARD,USER_AGENT_ID:USER_AGENT_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#MI_CARD").tips({
							side:3,
				            msg:'医保卡号'+MI_CARD+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#MI_CARD').val('');
				 }
			}
		});
	}
	
	//判断身份证号是否存在
	function hasI(){
		var ID_NUMBER = $("#ID_NUMBER").val();
		var USER_AGENT_ID = $("#USER_AGENT_ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>jmxx/hasI.do',
	    	data: {ID_NUMBER:ID_NUMBER,USER_AGENT_ID:USER_AGENT_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#ID_NUMBER").tips({
							side:3,
				            msg:'身份证'+ID_NUMBER+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#ID_NUMBER').val('');
				 }
			}
		});
	}	
	
	
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
</script>
</html>