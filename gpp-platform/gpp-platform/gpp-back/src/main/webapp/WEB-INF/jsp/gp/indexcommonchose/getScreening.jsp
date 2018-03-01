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
<!-- 居民信息页面 -->
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
						<input type="hidden" id="ID"/>
						<input type="hidden" id="NAME"/>
						<!-- 检索  -->
						<form action="indexScreeningQues/list.do" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td style="padding-left:2px;"><input name="keywords" id="keywords" value="${pd.keywords }" type="text" placeholder="请输入关键字" title="关键 字"/></td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置">
                               	<i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center">序号</th>
									<th class="center">名称</th>
									<th class="center">类型</th>
									<th class="center">适用的性别</th>
									<th class="center">单位</th>	
									<th class="center">科室</th>	
									<th class="center">显示排序</th>
									<th class="center">修改时间</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty screeningList}">
									<c:forEach items="${screeningList }" var="screeningList" varStatus="vs">
									<tr GH="${screeningList.ID}" NAME="${screeningList.QUESTIONNAIRE_NAME}">
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${screeningList.QUESTIONNAIRE_NAME }</td>
											<td class="center">
								                <c:forEach items="${CHROICDISEASETYPE}" var="s">
                                                    <c:if test="${s.value.ADDITIONAL == screeningList.CHRONIC_DISEASE_TYPE}">${s.value.NAME}</c:if>
                                                </c:forEach>
											</td>
											<td class="center">
												<c:forEach items="${FITSEX}" var="s">
                                                    <c:if test="${s.key == screeningList.FIT_SEX}">${s.value}</c:if>
                                                </c:forEach>
											</td>
											<td class="center">${screeningList.COMPANY }</td>
											<td class="center">${screeningList.DEPARTMENT }</td>
											<td class="center">${screeningList.QUESTIONNAIRE_ORDER  }</td>
											<td class="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${screeningList.EDIT_TIME }"/></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						 	<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
 	<script type="text/javascript">
 		
		$(top.hangge());
		
		$(function () {
			
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
	        var active_class = 'success';
	        
	      	// 选择行变色 
	        $("#simple-table > tbody > tr").click(function (){ 
	            var trThis = this; 
	            $("#simple-table > tbody > tr").removeClass(active_class); 
	            $(trThis).addClass(active_class);
	            $("#ID").val($(trThis).attr("GH"));
	            $("#NAME").val($(trThis).attr("NAME"));
	          
	        });
	    }) 
		
		
		//检索
		function searchs(){
			top.jzts();
			$("#userForm").submit();
		}
		
		
		//清空查询条件
		function reset(){
			$("#keywords").val("");
			
		}
		
		</script>
</html>

