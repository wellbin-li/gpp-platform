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
    <title>多行文本框</title>
    <!-- jsp文件头和头部 -->
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
        <th><span>字体大小</span> </th>
        <th><span>流程变量</span> </th>
    </tr>
    <tr>
        <td><input id="orgfontsize" type="text"  value="" class="input-small span1" placeholder="auto"/> px</td>
        <td><label class="checkbox inline"><input id="fieldflow" type="checkbox"/> 流程变量</label></td>
    </tr>
    <tr>
        <th><span>输入框样式</span> </th>
        <th><span>增强</span> </th>
    </tr>
    <tr>
        <td>
            宽 <input id="orgwidth" type="text" value="300" class="input-small span1" placeholder="auto"/> px
            &nbsp;&nbsp;
            高 <input id="orgheight" type="text" value="80" class="input-small span1" placeholder="auto"/> px
        </td>
        <td> <label class="checkbox"><input id="orgrich" type="checkbox"  /> 富文本形式 </label> </td>
    </tr>
    <tr>
        <td colspan="2">
            <label for="orgvalue">默认值</label>
            <textarea class="input-block-level" rows="3" id="orgvalue" placeholder="多行文本框默认值..."></textarea>
        </td>
    </tr>
    </table>
</div>
<script type="text/javascript">
var oNode = null,thePlugins = 'textarea';;
window.onload = function() {
    if( UE.plugins[thePlugins].editdom ){
        oNode = UE.plugins[thePlugins].editdom;
        var gValue = oNode.getAttribute('value').replace(/&quot;/g,"\""),gName=oNode.getAttribute('fieldname'),gFlow=oNode.getAttribute('fieldflow'),gTitle=oNode.getAttribute('title').replace(/&quot;/g,"\""),gFontSize=oNode.getAttribute('orgfontsize'),gWidth=oNode.getAttribute('orgwidth'),gHeight=oNode.getAttribute('orgheight'),gRich=oNode.getAttribute('orgrich');
        
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
        if ( gRich == '1' ) {
            $G('orgrich').checked = true ;
        }
        $G('orgfontsize').value = gFontSize;
        $G('orgwidth').value = gWidth;
        $G('orgheight').value = gHeight;
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
    var gValue=$G('orgvalue').value.replace(/\"/g,"&quot;"),gTitle=$G('orgname').value.replace(/\"/g,"&quot;"),gName=$G('fieldname').value,gFontSize=$G('orgfontsize').value,gWidth=$G('orgwidth').value,gHeight=$G('orgheight').value;

    if( !oNode ) {
        try {
            var html = '<textarea ';
            html += ' title = "' + gTitle + '"';
            html += ' name = "NEWFIELD"';
            html += ' plugins = "'+thePlugins+'"';
            html += ' value = "' + gValue + '"';
            html += ' fieldname = "' + gName + '"';
            if ( $G('fieldflow').checked ) {
                html += ' fieldflow = "1"';
            } else {
                html += ' fieldflow = "0"';
            }
            if ( $G('orgrich').checked ) {
                html += ' orgrich = "1"';
            } else {
                html += ' orgrich = "0"';
            }
            if( gFontSize != '' ) {
                html += ' orgfontsize = "' + gFontSize + '"';
            } else {
                html += ' orgfontsize = ""';
            }
            if( gWidth != '' ) {
                html += ' orgwidth = "' + gWidth + '"';
            } else {
                html += ' orgwidth = ""';
            }
            if(gHeight != '') {
                html += ' orgheight = "' + gHeight + '"';
            } else {
                html += ' orgheight = ""';
            }
            
            html += ' style = "';
            if( gFontSize != '' ) {
                html += 'font-size:' + gFontSize + 'px;';
            }
            if( gWidth != '' ) {
                html += 'width:' + gWidth + 'px;';
            }
            if( gHeight != '' ) {
                html += 'height:' + gHeight + 'px;';
            }
            html += '">';
            html += gValue + '</textarea>';
            editor.execCommand('insertHtml',html);
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
        oNode.setAttribute('value',gValue);
        oNode.setAttribute('fieldname',gName);
        oNode.innerHTML = gValue;
        if( $G('orgrich').checked ) {
            oNode.setAttribute('orgrich', 1);
        } else {
            oNode.setAttribute('orgrich', 0);
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
            oNode.setAttribute('orgfontsize', '');
        }
        if( gWidth != '' ) {
            oNode.style.width = gWidth+ 'px';
            oNode.setAttribute('orgwidth',gWidth );
        }else{
            oNode.setAttribute('orgwidth', '');
        }
        if( gHeight != '' ) {
            oNode.style.height = gHeight+ 'px';
            oNode.setAttribute('orgheight',gHeight );
        }else{
            oNode.setAttribute('orgheight', '');
        }
        delete UE.plugins[thePlugins].editdom;
    }
};
</script>
</body>
</html>