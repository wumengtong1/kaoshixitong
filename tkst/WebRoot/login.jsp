<%@ page language="java" pageEncoding="utf-8"%>
<%
  String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<link href="<%=path%>/css/mainlogin.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
      
 <script language="javascript">
 function check1()
 {                                                                                         
     if(document.ThisForm.userName.value=="")
	 {
	 	alert("请输入用户名");
		document.ThisForm.userName.focus();
		return false;
	 }
	 if(document.ThisForm.userType.value=="-1")
	 {
	 	alert("请选择登陆身份");
		document.ThisForm.userType.focus();
		return false;
	 }
	 document.getElementById("indicator").style.display="block";
	 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,document.ThisForm.userType.value,callback);
 }

 function callback(data)
 {
    document.getElementById("indicator").style.display="none";
    if(data=="no")
    {
        alert("用户名或密码错误");
    }
    if(data=="yes")
    {
        alert("通过验证,系统登录成功");
        window.location.href="<%=path %>/loginSuccess.jsp";
    }
 }
 </script>
</head>

<body>
	<noscript>
	<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:007FFF; text-align:center;">
	     <img src="images/001.jpg" alt='抱歉，请开启脚本支持！' />
	</div>
	</noscript>


	<div id="LoginCircle">
		<div id="LoginDoc">
	    	<div id="SysName" style="margin-top: 100px;">
	    	       题库系统
	    	</div>    	
	        <form action="<%=path %>/admin/index.jsp" method="post" name="ThisForm">
		        <input type="hidden" name="method" value="isExist">      
		        <div id="SysInput">
		            <table align="left" border="0" cellpadding="2" cellspacing="2">
						 <tr align='center'>
							<td style="width: 55px;font-family: 楷体;font-size: 15px;font-weight: 700 " align="left">
								账号：										    
							</td>
							<td align="left">
								<input name="userName" type="text" style="width: 127px;"/>
							</td>
						</tr>
						<tr align='center'>
							<td style="width: 55px;font-family: 楷体;font-size: 15px;font-weight: 700 " align="left">
								密码：										    
							</td>
							<td align="left">
								<input name="userPw" type="text" style="width: 127px;"/>
							</td>
						</tr>
						<tr align='center'>
							<td style="width: 55px;font-family: 楷体;font-size: 15px;font-weight: 700 " align="left">
								类型：										    
							</td>
							<td align="left">
								<select name="userType" style="width: 134px;">
								    <option value="0">管理员</option>
								    <option value="1">老师</option>
								    <option value="2">学生</option>
								</select>
							</td>
						</tr>
						<tr align='center'>
						   <td style="width: 55px;" align="left"></td>
						   <td align="left">
						      <input type="button" value="登陆" onclick="check1()"/>&nbsp; 
						      <input type="reset" value="重置"/>&nbsp;
						      <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>	
						   </td>
						</tr>
					</table>
		            <div id="error">
		                 <!-- 提示密码错误 -->
		            </div>
		        </div>
	        </form>
	        <div class="clear"></div>
	    </div>
	</div>
    <div id="Copy"></div>
</body>
</html>
