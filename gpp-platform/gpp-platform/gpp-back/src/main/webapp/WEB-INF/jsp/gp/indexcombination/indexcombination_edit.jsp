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
<% java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 
%>

<!DOCTYPE html>
<!-- 指标组合范围编辑与添加 -->
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
						<form action="indexCombination/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                             <div class="widget-body col-xs-12">
	                              	
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="INDEX_COMBINATION_CODE">指标组合编码:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="text" name="INDEX_COMBINATION_CODE" id="INDEX_COMBINATION_CODE" value="${pd.INDEX_COMBINATION_CODE }" placeholder="请输入指标组合编码" title="组合编码" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="INDEX_COMBINATION_NAME">指标组合名称:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="INDEX_COMBINATION_NAME" id=INDEX_COMBINATION_NAME  value="${pd.INDEX_COMBINATION_NAME }" placeholder="请输入指标组合名称"  title="指标组合名称"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="PY_CODE">拼音简码:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="text" name="PY_CODE" id="PY_CODE" value="${pd.PY_CODE }" placeholder="请输入拼音简码" title="拼音简码" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="DEPARTMENT">科室:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            	<input type="text" name="DEPARTMENT" id="DEPARTMENT"  value="${pd.DEPARTMENT }" placeholder="请输入科室"  title="科室"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="INDEX_COMBINATION_ORDER">排序号:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="number" name="INDEX_COMBINATION_ORDER" id="INDEX_COMBINATION_ORDER" value="${pd.INDEX_COMBINATION_ORDER }" placeholder="请输入排序号" title="排序号" style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <label class="col-sm-4 control-label no-padding-right" for="REMARKS">备注:</label>
                                        <div class="col-sm-8">
                                            <span  class="col-sm-12 from-control-span">
                                            		<input type="text" name="REMARKS" id="REMARKS"  value="${pd.REMARKS }" placeholder="请输入备注"  title="备注"  style="width:98%;" />
                                            </span>
                                        </div>
                                    </div>
                           	</div>
                           	<div class="form-group">
                                 <div class="col-xs-12 col-sm-6">
                                     <label class="col-sm-4 control-label no-padding-right" for="FIT_SEX">适合的性别:</label>
                                     <div class="col-sm-8">
                                         <span  class="col-sm-12 from-control-span">
                                          <select class="form-control"  name="FIT_SEX" id="FIT_SEX" style="width:98%">
								         <option value="" selected="selected">--请选择--</option>
								         <c:forEach items="${FITSEX}" var="tw">
                                                 <option value="${tw.key}" <c:if test="${tw.key == pd.FIT_SEX}"> selected="selected" </c:if> >${tw.value}</option>
                                            </c:forEach>
								    </select>
                                         </span>
                                     </div>
                                 </div>
                           	</div>
                           	
                           		<div align="center">
									<a class="btn btn-mini btn-primary" onclick="save();" >保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</div>
							</div>
						   <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						</div>
						</div>
						</div>
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
	<script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
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

	//保存
	function save(){
		if($("#INDEX_COMBINATION_CODE").val()==""){
			$("#INDEX_COMBINATION_CODE").tips({
				side:3,
	            msg:'请输入指标组合编码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INDEX_COMBINATION_CODE").focus();
			return false;
		} else {
			$("#INDEX_COMBINATION_CODE").val($.trim($("#INDEX_COMBINATION_CODE").val()));
		}
		
		if($("#INDEX_COMBINATION_NAME").val()==""){
			$("#INDEX_COMBINATION_NAME").tips({
				side:3,
	            msg:'请输入指标组合名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#INDEX_COMBINATION_NAME").focus();
			return false;
		}else{
			$("#INDEX_COMBINATION_NAME").val($.trim($("#INDEX_COMBINATION_NAME").val()));
		}	
		if($("#DEPARTMENT").val()==""){
			$("#DEPARTMENT").tips({
				side:3,
	            msg:'请选择科室',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#DEPARTMENT").focus();
			return false;
		}else{
			$("#DEPARTMENT").val($.trim($("#DEPARTMENT").val()));
		}
		if($("#FIT_SEX").val()==""){
			$("#FIT_SEX").tips({
				side:3,
	            msg:'请选择是否限制性别',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FIT_SEX").focus();
			return false;
		}else{
			$("#FIT_SEX").val($.trim($("#FIT_SEX").val()));
		}
		if($("#INDEX_COMBINATION_ORDER").val()==""){
			$("#INDEX_COMBINATION_ORDER").tips({
				side:3,
	            msg:'请输入指标组合排序',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#INDEX_COMBINATION_ORDER").focus();
			return false;
		}else{
			$("#INDEX_COMBINATION_ORDER").val($.trim($("#INDEX_COMBINATION_ORDER").val()));
		}
		
		if($("#REMARKS").val()==""){
			$("#REMARKS").tips({
				side:3,
	            msg:'请输入备注',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#REMARKS").focus();
			return false;
		}else{
			$("#REMARKS").val($.trim($("#REMARKS").val()));
		}
		if($("#PY_CODE").val()==""){
			$("#PY_CODE").tips({
				side:3,
	            msg:'请输入拼音编码',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PY_CODE").focus();
			return false;
		}else{
			$("#PY_CODE").val($.trim($("#PY_CODE").val()));
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	
	
	//科室菜单
	function chooseDepart(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "科室菜单";
		 diag.URL = '<%=basePath%>autoRegister/getDepartData.do';
		 diag.Width = 320;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //关闭事件
			 var name = diag.innerFrame.contentWindow.document.getElementById('DEP_NAME').value;
	         	if(id !=''){
		         	$("#DEPARTMENT").val(name);
	         	}
	         	diag.close();
		 };
		 diag.show();
	}

	
	function choosejbhig(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "疾病列表";
		 diag.URL = '<%=basePath%>kcf/jbzd_list.do';
		 diag.Width = 800;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
	         	var id = diag.innerFrame.contentWindow.document.getElementById('JBBM').value;
	         	if(id !=''){
		         	$("#HIG_DISEASE_ID").val(id);
	         	}
	         	diag.close();
	      };
		 diag.show();
	}
	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
			language: 'zh',
		        format:'YYYY-MM-DD HH:mm:ss '
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	
});
</script>
</html>