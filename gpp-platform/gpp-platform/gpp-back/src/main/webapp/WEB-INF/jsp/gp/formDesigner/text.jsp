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
    <title>文本框</title>
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp"%>
    <link href="plugins/Ueditor_Formdesign_Plugins/formdesign/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="plugins/Ueditor_Formdesign_Plugins/formdesign/leipi.style.css">
    <script type="text/javascript" src="plugins/Ueditor_Formdesign_Plugins/dialogs/internal.js"></script>
    <script type="text/javascript">
/* Thank you by  
http://www.alt-tag.com/blog/2006/02/ie-dom-bugs/ */
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
    </script>
</head>
<body>
<div class="content">
    <table class="table table-bordered table-striped table-hover">
     <tr>
        <th><span>字段名称</span><span class="label label-important">*</span></th>
        <th><span>字段标题</span><span class="label label-important">*</span> </th>
    </tr>
    <tr>
        <td><input type="text" id="fieldname" placeholder="必填项" value="${element.fieldname }"></td>
        <td><input type="text" id="orgname" placeholder="必填项" value="${element.orgname }"></td>
    </tr>
     <tr>
        <th><span>默认值</span> </th>
        <th><span>流程变量</span> </th>
    </tr>
    <tr>
        <td><input type="text" id="orgvalue" placeholder="无则不填"></td>
        <td><label class="checkbox inline"><input id="fieldflow" type="checkbox"/> 流程变量</label></td>
    </tr>
    <tr>
        <th><span>数据类型</span> </th>
        <th><span>对齐方式</span> </th>
    </tr>
    <tr>
        <td>
             <select id="orgtype">
                <option value="text">普通文本</option>
                <option value="email">邮箱地址</option>
                <option value="int">整数</option>
                <option value="float">小数</option>
                <option value="idcard">身份证号码</option>
            </select>   
        </td>
        <td>
            <select id="orgalign">
                <option value="left" >左对齐</option>
                <option value="center">居中对齐</option>
                <option value="right">右对齐</option>
            </select>
        </td>
    </tr>
    <tr>
        <th><span>&nbsp;&nbsp;&nbsp;&nbsp;长&nbsp;&nbsp;X&nbsp;&nbsp;宽&nbsp;&nbsp;&nbsp;&&nbsp;&nbsp;&nbsp;字体大小</span> </th>
        <th><span>可见性</span> </th>
    </tr>
    <tr>
        <td>
            <input id="orgwidth" type="text" value="150" class="input-small span1" placeholder="auto"/>
            X
            <input id="orgheight" type="text" value="" class="input-small span1" placeholder="auto"/>
            &
            <input id="orgfontsize" type="text"  value="" class="input-small span1" placeholder="auto"/> px

        </td>
        <td>
            <label class="checkbox inline"><input id="orghide" type="checkbox"/> 隐藏 </label>
        </td>
    </tr>

    </table>
</div>
<script type="text/javascript">
var oNode = null,thePlugins = 'text';
window.onload = function() {
    if( UE.plugins[thePlugins].editdom ){
        oNode = UE.plugins[thePlugins].editdom;
		var gValue = oNode.getAttribute('value').replace(/&quot;/g,"\""),gName=oNode.getAttribute('fieldname'),gFlow=oNode.getAttribute('fieldflow'),gTitle=oNode.getAttribute('title').replace(/&quot;/g,"\""),gHidden=oNode.getAttribute('orghide'),gFontSize=oNode.getAttribute('orgfontsize'),gAlign=oNode.getAttribute('orgalign'),gWidth=oNode.getAttribute('orgwidth'),gHeight=oNode.getAttribute('orgheight'),gType=oNode.getAttribute('orgtype');
		gValue = gValue==null ? '' : gValue;
        gTitle = gTitle==null ? '' : gTitle;
        gName = gName==null ? '' : gName;
		$G('orgvalue').value = gValue;
        $G('orgname').value = gTitle;
        $G('fieldname').value = gName;
        if (gFlow == '1')
        {
            $G('fieldflow').checked = true;
        }
        if (gHidden == '1')
        {
            $G('orghide').checked = true;
        }
        $G('orgfontsize').value = gFontSize;
        $G('orgwidth').value = gWidth;
        $G('orgheight').value = gHeight;
        $G('orgalign').value = gAlign;
        $G('orgtype').value = gType;
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
    var gValue=$G('orgvalue').value.replace(/\"/g,"&quot;"),gTitle=$G('orgname').value.replace(/\"/g,"&quot;"),gName=$G('fieldname').value,gFontSize=$G('orgfontsize').value,gAlign=$G('orgalign').value,gWidth=$G('orgwidth').value,gHeight=$G('orgheight').value,gType=$G('orgtype').value;
    
    if( !oNode ) {
        try {
            oNode = createElement('input','NEWFIELD');
            oNode.setAttribute('type','text');
            oNode.setAttribute('title',gTitle);
            oNode.setAttribute('value',gValue);
            oNode.setAttribute('name','NEWFIELD');
            oNode.setAttribute('fieldname',gName);
            oNode.setAttribute('plugins',thePlugins);
            if ( $G('orghide').checked ) {
                oNode.setAttribute('orghide',1);
            } else {
                oNode.setAttribute('orghide',0);
            }
            if ( $G('fieldflow').checked ) {
                oNode.setAttribute('fieldflow',1);
            } else {
                oNode.setAttribute('fieldflow',0);
            }
            if( gFontSize != '' ) {
                oNode.style.fontSize = gFontSize + 'px';
                //style += 'font-size:' + gFontSize + 'px;';
                oNode.setAttribute('orgfontsize',gFontSize );
            }
            if( gAlign != '' ) {
                //style += 'text-align:' + gAlign + ';';
                oNode.style.textAlign = gAlign;
                oNode.setAttribute('orgalign',gAlign );
            }
            if( gWidth != '' ) {
                oNode.style.width = gWidth+ 'px';
                //style += 'width:' + gWidth + 'px;';
                oNode.setAttribute('orgwidth',gWidth );
            }
            if( gHeight != '' ) {
                oNode.style.height = gHeight+ 'px';
                //style += 'height:' + gHeight + 'px;';
                oNode.setAttribute('orgheight',gHeight );
            }
            if( gType != '' ) {
                oNode.setAttribute('orgtype',gType );
            }
            //oNode.setAttribute('style',style );
            //oNode.style.cssText=style;//ie7
            editor.execCommand('insertHtml',oNode.outerHTML);
        } catch (e) {
            try {
                editor.execCommand('error');
            } catch ( e ) {
                alert('控件异常，请联系技术支持');
            }
            return false;
        }
    } else {
        
        oNode.setAttribute('title', gTitle);
        oNode.setAttribute('value', $G('orgvalue').value);
        oNode.setAttribute('fieldname',gName);
        if( $G('orghide').checked ) {
            oNode.setAttribute('orghide', 1);
        } else {
            oNode.setAttribute('orghide', 0);
        }
        if ( $G('fieldflow').checked ) {
            oNode.setAttribute('fieldflow',1);
        } else {
            oNode.setAttribute('fieldflow',0);
        }
        if( gFontSize != '' ) {
            oNode.style.fontSize = gFontSize+ 'px';
            oNode.setAttribute('orgfontsize',gFontSize );
        }else{
            oNode.style.fontSize = '';
            oNode.setAttribute('orgfontsize', '');
        }
        if( gAlign != '' ) {
            oNode.style.textAlign = gAlign;
            oNode.setAttribute('orgalign',gAlign );
        }else{
            oNode.setAttribute('orgalign', '');
        }
        if( gWidth != '' ) {
            oNode.style.width = gWidth+ 'px';
            oNode.setAttribute('orgwidth',gWidth );
        }else{
            oNode.style.width = '';
            oNode.setAttribute('orgwidth', '');
        }
        if( gHeight != '' ) {
            oNode.style.height = gHeight+ 'px';
            oNode.setAttribute('orgheight',gHeight );
        }else{
            oNode.style.height = '';
            oNode.setAttribute('orgheight', '');
        }
        if( gType != '' ) {
            oNode.setAttribute('orgtype',gType );
        }else{
            oNode.setAttribute('orgtype', '');
        }
        delete UE.plugins[thePlugins].editdom;
    }
};
</script>
</body>
</html>