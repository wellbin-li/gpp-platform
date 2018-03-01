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

<!DOCTYPE html>

<html lang="en">
<head>
	<base href="<%=basePath%>">
    <title>复选框</title>
 <link href="plugins/Ueditor_Formdesign_Plugins/formdesign/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="plugins/Ueditor_Formdesign_Plugins/formdesign/leipi.style.css">
    <script type="text/javascript" src="plugins/Ueditor_Formdesign_Plugins/dialogs/internal.js"></script>
   <script type="text/javascript">
function createElement(type, name)
{     
    var element = null;     
    try {        
        element = document.createElement('<'+type+' name="'+name+'">');     
    } catch (e) {}   
    if(element==null) {     
        element = document.createElement(type);     
        element.name = name;     
    } 
    return element;     
}


//checkboxs
function isIE()
{
    if(window.attachEvent){   
        return true;
    }
    return false;
}
//moveRow在IE支持而在火狐里不支持！以下是扩展火狐下的moveRow
if (!isIE()) {
    function getTRNode(nowTR, sibling) {
        while (nowTR = nowTR[sibling]) if (nowTR.tagName == 'TR') break;
        return nowTR;
    }
    if (typeof Element != 'undefined') {
        Element.prototype.moveRow = function(sourceRowIndex, targetRowIndex) //执行扩展操作
        {
            if (!/^(table|tbody|tfoot|thead)$/i.test(this.tagName) || sourceRowIndex === targetRowIndex) return false;
            var pNode = this;
            if (this.tagName == 'TABLE') pNode = this.getElementsByTagName('tbody')[0]; //firefox会自动加上tbody标签，所以需要取tbody，直接table.insertBefore会error
            var sourceRow = pNode.rows[sourceRowIndex],
            targetRow = pNode.rows[targetRowIndex];
            if (sourceRow == null || targetRow == null) return false;
            var targetRowNextRow = sourceRowIndex > targetRowIndex ? false: getTRNode(targetRow, 'nextSibling');
            if (targetRowNextRow === false) pNode.insertBefore(sourceRow, targetRow); //后面行移动到前面，直接insertBefore即可
            else { //移动到当前行的后面位置，则需要判断要移动到的行的后面是否还有行，有则insertBefore，否则appendChild
                if (targetRowNextRow == null) pNode.appendChild(sourceRow);
                else pNode.insertBefore(sourceRow, targetRowNextRow);
            }
        }
    }
}

/*删除tr*/
function fnDeleteRow(obj)
{
    var oTable = document.getElementById("options_table");
    while(obj.tagName !='TR')
    {
        obj = obj.parentNode;
    }
    oTable.deleteRow(obj.rowIndex);
}
/*上移*/
function fnMoveUp(obj)
{
    var oTable = document.getElementById("options_table");
    while(obj.tagName !='TR')
    {
        obj = obj.parentNode;
    }
    var minRowIndex = 1;
    var curRowIndex = obj.rowIndex;
    if(curRowIndex-1>=minRowIndex)
    {
        oTable.moveRow(curRowIndex,curRowIndex-1); 
    }
    
}
/*下移*/
function fnMoveDown(obj)
{
    var oTable = document.getElementById("options_table");
    while(obj.tagName !='TR')
    {
        obj = obj.parentNode;
    }
    var maxRowIndex = oTable.rows.length;
    var curRowIndex = obj.rowIndex;
    if(curRowIndex+1<maxRowIndex)
    {
        oTable.moveRow(curRowIndex,curRowIndex+1); 
    }
}

/*生成tr*/
function fnAddComboTr(obj)
{
    var oTable = document.getElementById('options_table');
    var new_tr_node= oTable.insertRow(oTable.rows.length);
    var new_td_node0 = new_tr_node.insertCell(0),new_td_node1 = new_tr_node.insertCell(1),new_td_node2 = new_tr_node.insertCell(2);

    var sChecked = '';
    if(obj.checked) sChecked = 'checked="checked"';
    if(!obj.name) obj.name = '';
    if(!obj.value) obj.value = '';
    new_td_node0.innerHTML = '<td><input type="checkbox" '+sChecked+'></td>';
    new_td_node1.innerHTML = '<td><input type="text" value="'+obj.value+'" name="'+obj.name+'" placeholder="选项值"></td>';
    new_td_node2.innerHTML ='<td><div class="btn-group"><a title="上移" class="btn btn-small btn-info" href="javascript:void(0);" onclick="fnMoveUp(this)"><i class="icon-white icon-arrow-up"></i></a><a title="下移" class="btn btn-small btn-info" href="javascript:void(0);" onclick="fnMoveDown(this)"><i class="icon-white icon-arrow-down"></i></a><a title="删除" class="btn btn-small btn-default" href="javascript:void(0);" onclick="fnDeleteRow(this)"><i class="icon-ban-circle"></i></a></div></td>';
    return true;
}
function fnAdd() {
    fnAddComboTr({
        "checked":false,
        "name":'NEWFIELD',
        "value":''
    });
}
/*组合checkbox*/
function fnParseOptions(gChecked)
{
    var oTable = document.getElementById('options_table');
    var nTr = oTable.getElementsByTagName('tr'),trLength = nTr.length,html="";
    for(var i=0;i<trLength;i++)
    {
        var inputs = nTr[i].getElementsByTagName('input');
        if(inputs.length>0)
        {
            if(!inputs[1].value) continue;
            var sChecked = '';
            if(inputs[0].checked) sChecked = 'checked="checked"';
            html += '<input name="'+inputs[1].name+'" value="'+inputs[1].value+'" '+sChecked+' type="checkbox" fieldname="_' + i + '"/>'+inputs[1].value+'&nbsp;';
            if(gChecked=='orgchecked1')//竖排
                html+='<br/>';
        }
    }
    //alert(html);
    return html;

}
    </script>
</head>
<body>
<div class="content">
    <table class="table table-bordered table-striped">
     <tr>
        <th><span>字段名称</span><span class="label label-important">*</span></th>
        <th><span>字段标题</span><span class="label label-important">*</span> </th>
    </tr>
    <tr>
 	 <td><input type="text" id="fieldname" placeholder="必填项" value="${element.fieldname }"></td>
        <td><input type="text" id="orgname" placeholder="必填项" value="${element.orgname }"></td>
    </tr>
     <tr>
        <th><span>流程变量</span></th>
        <th><span>排列方式</span></th>
    </tr>
    <tr>
        <td><label class="checkbox inline"><input id="fieldflow" type="checkbox"/> 流程变量</label></td>
        <td>
            <label class="radio" title="选项一 选项二"><input id="orgchecked0" checked="checked" name="checked" type="radio"> 横排 </label>
            <label class="radio" title="选项一&#10;选项二"><input id="orgchecked1" name="checked" type="radio" > 竖排 </label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table class="table table-hover table-condensed" id="options_table">
                <tr>
                    <th>选中</th>
                    <th>选项值</th>
                    <th>操作</th>
                </tr>
                 <c:forEach items="${value }" var="list" >
                	<tr>
                		<td><input type="checkbox" ></td>
                		<td><input type="text" value="${list}"></td>
                		<td>
                        <div class="btn-group">
                            <a title="上移" class="btn btn-small btn-info" href="javascript:void(0);" onclick="fnMoveUp(this)"><i class="icon-white icon-arrow-up"></i></a>
                            <a title="下移" class="btn btn-small btn-info" href="javascript:void(0);" onclick="fnMoveDown(this)"><i class="icon-white icon-arrow-down"></i></a>
                            <a title="删除" class="btn btn-small btn-default" href="javascript:void(0);" onclick="fnDeleteRow(this)"><i class="icon-ban-circle"></i></a>
                        </div>
                    </td>
                	</tr>
                </c:forEach>
                <!--tr>
                    <td><input type="checkbox" checked="checked"></td>
                    <td><input type="text" value="选项一"></td>
                    <td>
                        <div class="btn-group">
                            <a title="上移" class="btn btn-small btn-info" href="#"><i class="icon-white icon-arrow-up"></i></a>
                            <a title="下移" class="btn btn-small btn-info" href="#"><i class="icon-white icon-arrow-down"></i></a>
                            <a title="删除" class="btn btn-small btn-default"><i class="icon-ban-circle"></i></a>
                        </div>
                    </td>
                </tr-->
				
            </table>
            <a title="添加选项" class="btn btn-primary" onclick="fnAdd();">添加选项</a>
        </td>
    </tr>


    </table>
</div>
<script type="text/javascript">
var oNode = null,thePlugins = 'checkboxs';
window.onload = function() {
    if( UE.plugins[thePlugins].editdom ){
        oNode = UE.plugins[thePlugins].editdom;
        var gTitle=oNode.getAttribute('title').replace(/&quot;/g,"\"");
        var gFlow=oNode.getAttribute('fieldflow');
        $G('orgname').value = gTitle;
        $G('fieldname').value = oNode.getAttribute('fieldname');
        if (gFlow == '1')
        {
            $G('fieldflow').checked = true;
        }
        var checked = oNode.getAttribute('orgchecked');
        checked=='orgchecked1' ? $G('orgchecked1').checked = true : $G('orgchecked0').checked = true;

        var inputTags = oNode.getElementsByTagName('input');
        var length = inputTags.length;
        var aInputs = [];
        for(var i=0;i<length;i++)
        {
            if(inputTags[i].type =='checkbox')
                fnAddComboTr(inputTags[i]);
        }
    }
}
dialog.oncancel = function () {
    if( UE.plugins[thePlugins].editdom ) {
        delete UE.plugins[thePlugins].editdom;
    }
};
dialog.onok = function (){
    if($G('fieldname').value==''){
        alert('请输入字段名称');
        return false;
    }
    if($G('orgname').value==''){
        alert('请输入控件名称');
        return false;
    }
    var gTitle=$G('orgname').value.replace(/\"/g,"&quot;"),gName=$G('fieldname').value;
    
    var gChecked = 'orgchecked0';
    var gFlow = '0';
    if ($G('orgchecked1').checked) gChecked = 'orgchecked1';
    if ($G('fieldflow').checked ) gFlow = '1';

    if( !oNode ) {
        try {
            var gTimestamp = new Date().getTime();//相同的gTimestamp为同一组checkbox
            var options = fnParseOptions(gTitle,gChecked,gTimestamp);
            if(!options)
            {
                alert('请添加选项');
                return false;
            }
            //{|- 使用边界，防止用户删除了span标签，程序处理要把边界替换为空
            var html = '{|-<span plugins="checkboxs" title="'+gTitle+'" fieldname="' + gName + '" fieldflow="' + gFlow + '">';
                html +=options;
                html +='</span>-|}';
            editor.execCommand('insertHtml',html);
            return true ;
        } catch ( e ) {
            try {
                editor.execCommand('error');
            } catch ( e ) {
                alert('控件异常，请联系技术支持');
            }
            return false;
        }
    } else {
        oNode.setAttribute('title',gTitle);
        oNode.setAttribute('orgchecked',gChecked);
        oNode.setAttribute('fieldname',gName);
        oNode.setAttribute('fieldflow',gFlow);
        oNode.innerHTML = fnParseOptions(gChecked);
        delete UE.plugins[thePlugins].editdom; 
        return true;
    }
};
</script>
</body>
</html>