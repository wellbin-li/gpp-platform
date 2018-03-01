<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
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
						<form action="agreementService/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text"  name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="start" id="start"  value="${pd.start}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="签订时间起" title="签订时间"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="end" id="end"  value="${pd.end}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="签订时间止" title="签订时间"/></td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="form-control" id="STATUS" name="STATUS" style="width:120px;">
								 		<option value="" >请选择状态</option>
                                        <c:forEach items="${pd.enumService}" var="item">
                                             <option value="${item.key}" <c:if test="${pd.STATUS == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                         </c:forEach>
                                    </select>
								</td>
								<td><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="refresh();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">协议名称</th>
									<th class="center">签约医生</th>
									<th class="center">居民姓名</th>
									<th class="center">医保卡号</th>
									<th class="center">身份证号</th>
									<th class="center">协议状态</th>
									<th class="center">签约时间</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.AGREEMENT_NAME}</td>
											<td class='center'>${var.GEN_PRACTITIONER_NAME}</td>
											<td class='center'>${var.MEMBER_NAME}</td>
											<td class='center'>${var.MI_CARD}</td>
											<td class='center'>${var.ID_CARD}</td>
											<td class='center'>
                                                <c:forEach items="${pd.enumService}" var="s">
                                                    <c:if test="${s.key == var.STATUS}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
                                            <td class="center">
                                            	<fmt:formatDate pattern="yyyy-MM-dd"  value="${var.GMT_SIGNED}"/>
											</td>
											<td class="center">
												<div class="hidden-sm hidden-xs btn-group">
														<!-- 查看 -->  
	                                                   <a class="btn btn-xs btn-success" title="查看" onclick="view('${var.ID}');">
	                                                      	查看
	                                                   </a>
														<!-- 编辑 -->
														 <c:if test="${var.STATUS != '1' }">
	                                                        <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}','${var.STATUS}');">
	                                                           	编辑
	                                                        </a>
	                                                      </c:if> 
                                                         <a class="btn btn-xs btn-success" title="续约" onclick="createRenew('${var.ID}','${var.MEMBER_ID }');">
                                                          		续约
                                                        </a>
                                                      
                                                        <!-- 解约 -->
                                                       <c:if test="${var.STATUS != '0' }">
                                                        <a class="btn btn-xs btn-success" title="解约" onclick="jieyue('${var.ID}','${var.STATUS}','${var.MEMBER_ID }');">
                                                           	解约
                                                        </a>
                                                      </c:if>
                                                       <!-- 转签 -->  
                                                        <a class="btn btn-xs btn-success" title="转签" onclick="transfer('${var.ID}');">
                                                        	转签
                                                        </a>
                                                        <!-- 删除（逻辑删除） -->
                                                        <c:if test="${var.STATUS == '0' }">
	                                                        <a class="btn btn-xs btn-danger" onclick="del('${var.ID}','${var.STATUS}');">
	                                                            	删除
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
																<a style="cursor:pointer;" class="btn btn-xs btn-success" title="查看" onclick="view('${var.ID}');">
			                                                      	查看
			                                                   </a>
															</li>
															<c:if test="${var.STATUS != '1' }">
																<li>
		                                                        <a style="cursor:pointer;" class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}','${var.STATUS}');">
		                                                           	编辑
		                                                        </a>
		                                                     	</li>   
	                                                      	</c:if> 
                                                            <li>
																 <a style="cursor:pointer;" class="btn btn-xs btn-success" title="续约" onclick="createRenew('${var.ID}','${var.MEMBER_ID }');">
                                                          			续约
                                                       			 </a>
															</li>
															 
															<c:if test="${var.STATUS != '0' }">
																<li>
		                                                        <a style="cursor:pointer;" class="btn btn-xs btn-success" title="解约" onclick="jieyue('${var.ID}','${var.STATUS}','${var.MEMBER_ID }');">
		                                                           	解约
		                                                        </a>
		                                                        </li>
		                                                    </c:if>
															<li>
																 <a style="cursor:pointer;" class="btn btn-xs btn-success" title="转签" onclick="transfer('${var.ID}');">
		                                                        	转签
		                                                        </a>
															</li>
															<c:if test="${var.STATUS == '0' }">
																<li>
		                                                        <a class="btn btn-xs btn-danger" onclick="del('${var.ID}','${var.STATUS}');">
		                                                            	删除
		                                                        </a>
		                                                        </li>
	                                                        </c:if>
														</ul>
													</div>
												</div>
										 		
											</td>
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
								<td style="vertical-align:top;">
									<a class="btn btn-sm btn-success" onclick="add();">
									<i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>
									新增</a>
									<!-- <a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a> -->
								</td>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
		});
		
		//新增
		function add(){
                 var diag = new top.Dialog();
                 diag.Drag=true;
                 diag.Title ="新增";
                 diag.URL = '<%=basePath%>agreementService/toAdd.do';
                 diag.Width = 650;
                 diag.Height = 700;
                 diag.CancelEvent = function(){ //关闭事件
                     if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                         if('${page.currentPage}' == '0'){
                             top.jzts();
                             setTimeout("self.location=self.location",100);
                         }else{
                             //nextPage(${page.currentPage});
                             window.location.reload();
                         }
                    }
                    diag.close();
                 };
                 diag.show();
            }
		
		//删除
		function del(id,st){
			if(st==0){
				bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>agreementService/delete.do?ID="+id;
					$.get(url,function(data){
						//nextPage(${page.currentPage});
						 window.location.reload();
					});
				}
			});
		}else{
			alert("协议处于保存状态下才可以删除");
		}
		}
		
		//修改
		function edit(id,st){
			
			if(st==1){
				alert("协议处于签约状态不能被编辑");
			}else{
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="编辑";
				 diag.URL = '<%=basePath%>agreementService/update.do?ID='+id;
				 diag.Width = 950;
				 diag.Height = 700;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
				}
		}
		
		//解约
		function jieyue(id,st,USER_AGENT_ID){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="解约";
				 diag.URL = '<%=basePath%>agreementService/toJieYue.do?ID='+id+'&st='+st+'&USER_AGENT_ID='+USER_AGENT_ID;
				 diag.Width = 750;
				 diag.Height = 500;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
		}

		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>agreementService/deleteAll.do',
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
										 window.location.reload();
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//续约
		function createRenew(id, USER_AGENT_ID){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="续约";
				 diag.URL = '<%=basePath%>agreementService/createRenew.do?ID='+id+'&USER_AGENT_ID='+USER_AGENT_ID;
				 diag.Width = 650;
				 diag.Height = 700;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
				}
		
		//变更
		function change(id){
			
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="变更";
				 diag.URL = '<%=basePath%>agreementService/change.do?ID='+id;
				 diag.Width = 950;
				 diag.Height = 700;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
				
		}
		
		
		//转签
		function transfer(id){
			
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="转签";
				 diag.URL = '<%=basePath%>agreementService/transfer.do?ID='+id;
				 diag.Width = 650;
				 diag.Height = 600;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
		}
		//清空查询条件
		function refresh(){
			$("#start").val("");
			$("#nav-search-input").val("");
			$("#end").val("");
			$("#STATUS").find("option:selected").attr("selected",false);
			$("#STATUS").find("option[text='']").attr("selected",true);
		}
		function view(id){
			  var diag = new top.Dialog();
              diag.Drag=true;
              diag.Title ="查看";
              diag.URL = '<%=basePath%>agreementService/toView.do?ID='+id;
              diag.Width = 650;
              diag.Height = 700;
              diag.CancelEvent = function(){ //关闭事件
                  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                      if('${page.currentPage}' == '0'){
                          top.jzts();
                          setTimeout("self.location=self.location",100);
                      }else{
                          //nextPage(${page.currentPage});
                          window.location.reload();
                      }
                 }
                 diag.close();
              };
              diag.show();
		}
		</script>


</body>
</html>