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
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<body>
	<table style="width: 120%;" border="0">
		<tr>
			<td style="width: 15%;" valign="top" bgcolor="#F9F9F9">
			 	<div style="width: 15%;">
			 		<ul id="leftTree" class="ztree"></ul>
			 	</div>
			</td>
			<td style="width: 105%" valign="top">
				 <iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/payservice/list.do?ID=${null == pd.FLBM || '' == pd.FLBM?'0':pd.FLBM }" "  style="margin:0 auto;width:100%;height:100%;"></iframe> 
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		$(top.hangge());
		var zTree;
		$(document).ready(function(){
			 
			var setting = {
					data: {
					simpleData: {
						enable: true
						}
					}
					,async: {
						enable: true,
						url:"<%=basePath%>/payservice/treeData.do",
						autoParam: ["id", "name"]
					},callback:{
						asyncSuccess: zTreeOnAsyncSuccess,//异步加载成功的fun
						asyncError: zTreeOnAsyncError//加载错误的fun
					}
				};
			var zn = '[{"id":"0","name":"全部","url":"payservice/list.do?ID=0","target":"treeFrame","isParent":true}]';//'${zTreeNodes}';
			var zTreeNodes = eval(zn);
			 
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
</SCRIPT>
</body>
</html>
