<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<%--<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>--%>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body>
	<input id = "COMPANY_ID" name ="COMPANY_ID" type = "hidden"/>
   <input id = "COMPANY_NAME" name ="COMPANY_NAME" type = "hidden"/>
	<table style="width: 100%;" border="0">
		<tr>
			<td style="width: 15%;" valign="top" bgcolor="#F9F9F9">
				<div class="height-8 bg-white"></div>
				<div class="height-8 bg-white"></div>
			 	<div style="width: 15%;">
			 		<ul id="leftTree" class="ztree"></ul>
			 	</div>
			</td>
		</tr>
	</table>
	<div style="width: 100%;padding-top: 5px;" class="center">
    <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
</div>
	<%@ include file="../../system/index/foot.jsp"%>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<!-- 删除时确认窗口 -->
	<script type="text/javascript" src="static/ace/js/bootbox.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		var zTree;
		$(document).ready(function(){
			//iframe高度自适应子页面高度处理
			$("#treeFrame").load(function(){
				var mainheight = $(this).contents().find("body").height()+40;
				$(this).height(mainheight);
			});
			
			var setting = {
				data: {
					simpleData: {
						enable: true
					}
				}
				,async: {
					enable: true,
					url:"<%=basePath%>/organization/treeData.do",
					autoParam: ["id", "name"]
				},callback:{
					// beforeAsync: zTreeBeforeAsync, // 异步加载事件之前得到相应信息
					asyncSuccess: zTreeOnAsyncSuccess,//异步加载成功的fun
					asyncError: zTreeOnAsyncError//加载错误的fun
					//beforeClick:beforeClick, //捕获单击节点之前的事件回调函数
				},view:{
					selectedMulti: false
				}
			};
			var zTreeNodes = eval('${treeTopJson}');
			zTree = $.fn.zTree.init($("#leftTree"), setting, zTreeNodes);
		});

		function zTreeOnAsyncError(event, treeId, treeNode){
			alert("异步加载失败");
		}
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
			alert("异步加载成功");
		}

		function treeFrameT(){
			var hmainT = document.getElementById("treeFrame");
			var bheightT = document.documentElement.clientHeight;
			hmainT .style.width = '100%';
			hmainT .style.height = (bheightT-26) + 'px';
		}
		treeFrameT();
		window.onresize=function(){
			treeFrameT();
		};
		 function save()
		    {
		        var treeObj = $.fn.zTree.getZTreeObj("leftTree");
		        var nodes = treeObj.getSelectedNodes();
		        if(jQuery.isEmptyObject(nodes))
		        {
		            bootbox.alert("", function() {
		                return;
		            });
		        }
		        $("#COMPANY_ID").val(nodes[0].id);
		        $("#COMPANY_NAME").val(nodes[0].name);
		        top.Dialog.close();
		    }
		

		

	</SCRIPT>
</body>
</html>