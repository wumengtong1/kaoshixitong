<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="<%=path %>/css/default.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/themes/icon.css" />
	
	<script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.easyui.min.1.2.2.js"></script>
	<script type="text/javascript" src='<%=path %>/js/outlook2.js'> </script>
</head>


<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
	<noscript>
	    <div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;"> <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' /> </div>
	</noscript>
	
	<div region="north" split="true" border="false" style="overflow: hidden; height: 120px;background: url() #7f99be repeat-x center 50%;line-height: 30px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
	    <div style="margin-top: 40px;">
	         <span style="float:right; padding-right:20px;font-size: 16px;font-family: 楷体">
		                                欢迎您:${sessionScope.stu.stuRealname}
		         <a href="#" id="loginOut" style="font-size: 16px;font-family: 楷体">安全退出</a>
		     </span> 
		     <span style="padding-left:20px; font-size: 30px;">题库系统</span>   
	    </div>
	</div>

	<div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
	    <div class="footer" style="text-align:right">&nbsp;</div>
	</div>
	
	<div region="west" hide="true" split="true" title="" style="width:190px;" id="west">
	    <div id="nav" class="easyui-accordion" fit="true" border="false">
	        <!--  导航内容 -->
	    </div>
	</div>
	
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
            <!--  信息显示 -->
        </div>
    </div>


	<div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;background: #fafafa;">
	    <div class="easyui-layout" fit="true">
		    <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
		     
		    </div>
	    </div>
	</div>
</body>
</html>