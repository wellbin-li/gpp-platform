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
<!-- 医学影像检查报告列表页面 -->
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
						<!-- 检索  -->
						<form action="risReport/list.do" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="YLJGDM" type="text" name="YLJGDM" value="${pd.YLJGDM }" placeholder="根据医疗机构代码搜索" title="根据医疗机构代码搜索"/>
									</div>
								</td>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="JZLSH" type="text" name="JZLSH" value="${pd.JZLSH }" placeholder="根据就诊流水号搜索" title="根据就诊流水号搜索"/>
									</div>
								</td>
								
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="BRXM" type="text" name="BRXM" value="${pd.BRXM }" placeholder="根据病人姓名搜索" title="根据病人姓名搜索"/>
									</div>
								</td>
								
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="PERSONID" type="text" name="PERSONID" value="${pd.PERSONID }" placeholder="根据院内患者唯一ID号搜索" title="根据院内患者唯一ID号搜索"/>
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
										<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">医疗机构代码</th>
									<th class="center">住院就诊流水号</th>
									<th class="center">卡号</th>
									
									<th class="center">病人姓名</th>
									<th class="center">病人性别</th>
									
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList }" var="varList" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${varList.STUDYUID }" id="${varList.STUDYUID }" class="ace"/><span class="lbl"></span></label>
											</td>
											
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${varList.YLJGDM }</td>
											<td class="center">${varList.JZLSH }</td>
											<td class="center">${varList.KH }</td>
											<td class="center">${varList.BRXM }</td>
                                            <td class="center">${varList.BRXB }</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.cha == 1 }">
														<a class="btn btn-xs btn-success" title="查看详情" onclick="CKXQ('${varList.STUDYUID}','${pd.USER_AGENT_ID }');">
															<i class="ace-icon fa fa-search bigger-120" title="查看详情"></i>查看
														</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<li>
																<a style="cursor:pointer;" onclick="CKXQ('${varList.STUDYUID}','${pd.USER_AGENT_ID }');" class="tooltip-success" data-rel="tooltip" title="查看详情">
																	<span class="green">
																		<i class="ace-icon fa fa-search bigger-120" title="查看详情"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
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
 		
		 
		//检索
		function searchs(){			
			//top.jzts();
			$("#userForm").submit();
		}
		
		//清空查询条件
		function refresh(){
			$("#YLJGDM").val("");
			$("#PERSONID").val("");
			$("#JZLSH").val("");
			$("#BRXM").val("");
		}
		
		//查看详情
		function CKXQ(STUDYUID, user_id){
			 //top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="医学影像检查报告详情";
			 diag.URL = '<%=basePath%>risReport/goCKXQ.do?STUDYUID='+STUDYUID+'&USER_AGENT_ID='+user_id;
			 diag.Width = 950;
			 diag.Height = 700;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}

		</script>
</html>

