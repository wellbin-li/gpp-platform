<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
	<!-- 签约管理--解约页面 -->
	<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<!-- 签约管理 新增修改页面 -->
						<form action="agreementService/jieyue.do" name="Form" id="Form" method="post">
							<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
							<input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="${pd.MEMBER_ID}" style="width:98%;"/><!-- 签约居民ID -->
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:130px;text-align: right;padding-top: 13px;">解约类型:</td>
									<td>
										<select name=RESCIND_TYPE title="解约类型" style="width:98%;">
										<option value="0" <c:if test="${pd.RESCIND_TYPE == '0' }">selected</c:if> >正常解约</option>
										<option value="1" <c:if test="${pd.RESCIND_TYPE == '1' }">selected</c:if> >非正常解约</option>
										</select>
									</td>
									<td style="width:130px;text-align: right;padding-top: 13px;">解约时间:</td>
									<td>
										<c:if test="${pd.STATUS != '3' }">
									   		 <input class="col-sm-11 form-control date-picker" style="width:98%;" name="GMT_RESCIND" id="GMT_RESCIND" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.GMT_RESCIND}" />' readonly="readonly" type="text" data-date-format="yyyy-mm-dd" />
										</c:if>
										<c:if test="${pd.STATUS == '3' }">
											 <input style="width:98%;" name="GMT_RESCIND" id="GMT_RESCIND" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.GMT_RESCIND}" />' readonly="readonly" type="text" placeholder="解约时间" title="解约时间" />
										</c:if>
									</td>
								</tr>
								<tr>
	                                <td style="width:130px;text-align: right;padding-top: 13px;">解约原因:</td>
									<td colspan="3">
									<textarea rows="4" class="form-control" id="RESCIND_REASON" name="RESCIND_REASON" placeholder="这里输入解约原因" <c:if test="${!empty pd.RESCIND_REASON }">readonly='readonly'</c:if>>${pd.RESCIND_REASON}</textarea>
									</td>
								</tr>
								<c:if test="${pd.STATUS != '3' }">
								<tr>
									<td style="text-align: center;" colspan="10">
										<a class="btn btn-mini btn-primary" onclick="save();">确定</a>
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
								</c:if>
							</table>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						</form>
						<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	
	
		<!-- 页面底部js¨ -->
		<%@ include file="../../system/index/foot.jsp"%>
		<!-- 下拉框 -->
		<script src="static/ace/js/chosen.jquery.js"></script>
		<!-- 日期框 -->
		<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
			<script type="text/javascript">
			$(top.hangge());
			
			//保存
		function save(){
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
			
			$(function() {
				//日期框
				$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
				
			});
			
			</script>
	</body>
</html>