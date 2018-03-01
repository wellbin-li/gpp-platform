<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 


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
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					<!-- 团队成员 新增修改页面 -->
					<form action="team/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<input type="hidden" name="LEADER_ID" id="LEADER_ID" value="${pd.LEADER_ID}"/>
						<input type="hidden" name="LEADER_CODE" id="LEADER_CODE" value="${pd.LEADER_CODE}"/>
						<input type="hidden" name="REGION_CODE" id="REGION_CODE" value="${pd.REGION_CODE}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
									<td style="width:150px;text-align: center;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>团队名称：</td>
									<td><input type="text" name="TEAM_NAME" id="TEAM_NAME" value="${pd.TEAM_NAME}" maxlength="255" placeholder="这里输入团队名称" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>成立时间:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker" style="width:98%;" name="GMT_BUILD" id="GMT_BUILD"  value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.GMT_BUILD}" />'  type="text" data-date-format="yyyy-mm-dd" placeholder="成立时间" title="成立时间" />
								</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>人数:</td>
								<td><input type="number" name="NUMBER" id="NUMBER" value="${pd.NUMBER}" maxlength="255" placeholder="这里输入人数" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;"><span style="color:red; font-size:14px">*</span>机构编码:</td>
								<td><input type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="255" placeholder="请选择机构" readonly="readonly" title="id" style="width:98%;" onclick="chooseORG();"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">负责人姓名:</td>
								<td><input type="text" name="LEADER_NAME" id="LEADER_NAME" value="${pd.LEADER_NAME}" readonly="readonly" maxlength="255" placeholder="这里输入负责人姓名" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: center;padding-top: 13px;">负责人电话:</td>
								<td><input type="number" name="LEADER_PHONE" id="LEADER_PHONE" value="${pd.LEADER_PHONE}"  maxlength="255" placeholder="这里输入负责人电话" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
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
		if($("#TEAM_NAME").val()==""){
			$("#TEAM_NAME").tips({
				side:3,
	            msg:'请输入团队名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TEAM_NAME").focus();
			return false;
		}
		if($("#GMT_BUILD").val()==""){
			$("#GMT_BUILD").tips({
				side:3,
	            msg:'请选择成立时间',
	            bg:'#AE81FF',
	            time:3
	        });
	        $("#GMT_BUILD").focus();
			return false;
		}
		if($("#NUMBER").val()==""){
			$("#NUMBER").tips({
				side:3,
	            msg:'请输入团队人数',
	            bg:'#AE81FF',
	            time:3
	        });
	        $("#NUMBER").focus();
			return false;
		}
		if($("#ORG_CODE").val()==""){
			$("#ORG_CODE").tips({
				side:3,
	            msg:'请选择所属机构',
	            bg:'#AE81FF',
	            time:3
	        });
	        $("#ORG_CODE").focus();
			return false;
		}
			$.ajax({
				async : true,
				url : 'team/validateName.do',
				type : "post",
				dataType : "json",
				data : {
					"TEAM_NAME":$("#TEAM_NAME").val(),
					"ID":$("#ID").val()
				},
				success : function(data) { 
					if(data.status==0){       
						$("#TEAM_NAME").tips({
							side:3,
				            msg:'团队名称已存在',
				            bg:'#AE81FF',
				            time:3
				        });
				        $("#TEAM_NAME").focus();
						return false;
	    	        } else{
	    	        	$("#Form").submit();
	    				$("#zhongxin").hide();
	    				$("#zhongxin2").show();
	    	        }
				 }
			 });
			
			 
		}
		
		function validateName(){	
			
		}
		
		function chooseORG(){
			var Title = "选择所属机构";
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = Title;
			diag.URL = '<%=basePath%>/team/chooseORG.do';
			diag.Width = 330;
			diag.Height = 450;
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			};
			diag.show();
		}
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		</script>
</body>
</html>