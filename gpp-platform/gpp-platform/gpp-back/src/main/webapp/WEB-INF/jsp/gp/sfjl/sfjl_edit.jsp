<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 


%>
<!-- 随访记录新增和修改页面 -->
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
								<form action="sfjl/${msg }.do" name="Form" id="Form" method="post">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
								<input type="hidden" name="FSYS_CODE" id="FSYS_CODE" value="${pd.FSYS_CODE}"/>
						<!-- 	<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}"/> -->
								<input type="hidden" value="${pd.JOB_ID }" name = "JOB_ID" id = "JOB_ID">
								<input type="hidden" value="${pd.CASE_ID }" name = "CASE_ID" id = "CASE_ID">	
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<c:if test="${pd.tempPd.FSYS=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">访视医生<span class="red">*</span>:</td>
											<td><input type="text" name="FSYS" id="FSYS" value="${pd.FSYS}" readonly="readonly" placeholder="访视医生" title="访视医生" style="width:83%;"/>
										    <a class="btn btn-mini btn-purple" onclick="chooseFSYS();">医生菜单</a></td>
										    <input type="hidden" name="FSYS_ID" id="FSYS_ID" value="${pd.FSYS_ID }" />
										    <!-- 将模版ID设置为隐藏 -->
											<input type="hidden" name="TEMP_ID" id="TEMP_ID" value="${pd.TEMP_ID }" style="width:98%;"/>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.JM_NAME=='show'}">
										<tr>
										    <td style="width:120px;text-align: right;padding-top: 13px;">居民<span class="red">*</span>:</td>
											<td><input type="text" name="JM_NAME" id="JM_NAME" value="${pd.JM_NAME}" readonly="readonly" placeholder="居民" title="居民" style="width:83%;"/>
										    <a class="btn btn-mini btn-purple" onclick="chooseJMXX();">居民菜单</a></td>    
										</tr>
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">居民社保卡号<span class="red">*</span>:</td>
											<td><input type="text" name="JM_SBKH" id="JM_SBKH" value="${pd.JM_SBKH }" readonly="readonly" maxlength="32" placeholder="居民社保卡号" title="居民社保卡号" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.FSSJ=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">访视时间<span class="red">*</span>:</td>
											<c:if test="${msg == 'save'}">
												<td><input class="span10 date-picker" name="FSSJ" id="FSSJ" value="<%=nowtime%>" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="访视时间"  title="访视时间" style="width:98%;" /></td>
											</c:if>
											<c:if test="${msg == 'edit'}">
												<td><input class="span10 date-picker" name="FSSJ" id="FSSJ" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.FSSJ}" />" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="访视时间"  title="访视时间" style="width:98%;" /></td>
											</c:if>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.XYCFSS=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">下一次访视时间:</td>
											<td><input class="span10 date-picker" name="XYCFSSJ" id="XYCFSSJ" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.XYCFSSJ}" />" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="下一次访视时间"  title="下一次访视时间" style="width:98%;" /></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.SFFS=='show'}">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">随访方式:</td>
											<td>
												<select name="SFFS" id="SFFS" style="width:98%;">
											         <option value="" selected >请选择</option>
										             <c:forEach items="${pd.EnumSfjlSFFS}" var="item">
				                                        <option value="${item.key}" <c:if test="${pd.SFFS == item.key}"> selected="selected" </c:if> >${item.value}</option>
				                                    </c:forEach>
											     </select>
											 </td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.SSY=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">收缩压:</td>
											<td><input type="text" name="SSY" id="SSY" value="${pd.SSY }" maxlength="20" placeholder="这里输入收缩压" title="收缩压" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.SZY=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">舒张压:</td>
											<td><input type="text" name="SZY" id="SZY" value="${pd.SZY }" maxlength="20" placeholder="这里输入舒张压" title="舒张压" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.KFXTZ=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">空腹血糖值:</td>
											<td><input type="text" name="KFXTZ" id="KFXTZ" value="${pd.KFXTZ }" maxlength="20" placeholder="这里输入空腹血糖值" title="空腹血糖值" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.CHXTZ=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">餐后血糖值:</td>
											<td><input type="text" name="CHXTZ" id="CHXTZ" value="${pd.CHXTZ }" maxlength="20" placeholder="这里输入餐后血糖值" title="餐后血糖值" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.SG=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">身高:</td>
											<td><input type="text" name="SG" id="SG" value="${pd.SG }" maxlength="20" placeholder="这里输入身高" title="身高" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.TZ=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">体重(KG):</td>
											<td><input type="text" name="TZ" id="TZ" value="${pd.TZ }" maxlength="20" placeholder="这里输入体重(单位：KG)" title="体重" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.TW=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">体温:</td>
											<td><input type="text" name="TW" id="TW" value="${pd.TW }" maxlength="20" placeholder="这里输入体温" title="体温" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.XL=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">心率:</td>
											<td><input type="text" name="XL" id="XL" value="${pd.XL }" maxlength="20" placeholder="这里输入心率" title="心率" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.HXL=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">呼吸率:</td>
											<td><input type="text" name="HXL" id="HXL" value="${pd.HXL }" maxlength="20" placeholder="这里输入呼吸率" title="呼吸率" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.XYBHD=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">血氧饱和度:</td>
											<td><input type="text" name="XYBHD" id="XYBHD" value="${pd.XYBHD }" maxlength="20" placeholder="这里输入血氧饱和度" title="血氧饱和度" style="width:98%;"/></td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.STZZ=='show'}">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">身体症状<span class="red">*</span>:</td>
											<td>
												<select name="STZZ" id="STZZ" style="width:98%;">
										             <c:forEach items="${pd.EnumSfjlSTZZ}" var="item">
				                                        <option value="${item.key}" <c:if test="${pd.STZZ == item.key}"> selected="selected" </c:if> >${item.value}</option>
				                                    </c:forEach>
											     </select>
											 </td>
										</tr>
										</c:if>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">随访类型<span class="red">*</span>:</td>
											<td>
												<select name="SFLX" id="SFLX" style="width:98%;">
										             <c:forEach items="${pd.EnumSfjlSFLX}" var="item">
				                                        <option value="${item.key}" <c:if test="${pd.SFLX == item.key}"> selected="selected" </c:if> >${item.value}</option>
				                                    </c:forEach>
											     </select>
											 </td>
										</tr>
										<c:if test="${pd.tempPd.YYGY=='show'}">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用药干预:</td>
											<td>
												<select name="YYGY" id="YYGY" style="width:98%;">
										             <c:forEach items="${pd.EnumMzzdwhCRB}" var="item">
				                                        <option value="${item.key}" <c:if test="${pd.YYGY == item.key}"> selected="selected" </c:if> >${item.value}</option>
				                                    </c:forEach>
											     </select>
											 </td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.SFCL=='show'}">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">是否处理:</td>
											<td>
												<select name="SFCL" id="SFCL" style="width:98%;">
										             <c:forEach items="${pd.EnumSfjlSFCL}" var="item">
				                                        <option value="${item.key}" <c:if test="${pd.sfcl == item.key}"> selected="selected" </c:if> >${item.value}</option>
				                                    </c:forEach>
											     </select>
											 </td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.ZT=='show'}">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">状态:</td>
											<td style="vertical-align:top;padding-left:2px;"> 
											 	<select name="ZT" id="ZT" data-placeholder="状态" style="width: 98%;">
													<c:forEach items="${pd.EnumSfjlZT}" var="item">
				                                        <option value="${item.key}" <c:if test="${pd.ZT == item.key}"> selected="selected" </c:if> >${item.value}</option>
				                                    </c:forEach>	
												</select>
											</td>
										</tr>
										</c:if>
										<c:if test="${pd.tempPd.BZ=='show'}">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">备注:</td>
											<td><input type="text" name="BZ" id="BZ" value="${pd.BZ }" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>		
										</tr>
										</c:if>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
</body>
<script type="text/javascript">
    $(top.hangge());
    $(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
    }
	
	/* $(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		} 
	}*/
	);
	//保存
	function save(){
		if($("#FSYS").val()==""){
			$("#FSYS").tips({
				side:3,
	            msg:'请录入访视医生',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FSYS").focus();
			return false;
		}
		if($("#JM_NAME").val()==""){
			$("#JM_NAME").tips({
				side:3,
	            msg:'请录入居民',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#JM_NAME").focus();
			return false;
		}
		if($("#FSSJ").val()==""){
			$("#FSSJ").tips({
				side:3,
	            msg:'请录入访视时间',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FSSJ").focus();
			return false;
		}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	
	}

	
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
	
	//从医护人员表中选择访视医生及访视医生ID
	function chooseFSYS(){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "医生列表";
		 diag.URL = '<%=basePath%>yhry/getChooseYhryList.do';
		 diag.Width = 850;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
		  
           	var GEN_PRACTITIONER_ID = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
           	if(GEN_PRACTITIONER_ID!=''){
           		$("#FSYS_ID").val(GEN_PRACTITIONER_ID);
               	$("#FSYS").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
               	$("#FSYS_CODE").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_CODE').value);
              //$("#GEN_PRACTITIONER_PHONE").val(diag.innerFrame.contentWindow.document.getElementById('TELECOM').value);
              //$("#ORG_CODE").val(diag.innerFrame.contentWindow.document.getElementById('ORG_CODE').value);
               	diag.close();
           	}
        };
		 diag.show();
	}
	
	//从居民信息表中选择居民及社保卡号
	function chooseJMXX(){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "居民列表";
		 diag.URL = '<%=basePath%>agreementApply/getJMXX.do';
		 diag.Width = 1000;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
		  
           	var APPLICANT_ID = diag.innerFrame.contentWindow.document.getElementById('USER_AGENT_ID').value;
           	if(APPLICANT_ID!=''){
               	$("#JM_NAME").val(diag.innerFrame.contentWindow.document.getElementById('USER_NAME').value);
               	$("#JM_SBKH").val(diag.innerFrame.contentWindow.document.getElementById('MI_CARD').value);
               	diag.close();
           	}
        };
		 diag.show();
	}
	
</script>
</html>