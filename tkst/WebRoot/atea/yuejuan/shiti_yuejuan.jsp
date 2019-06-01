<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.ArrayList"/>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
        </script>
	</head>

	<body>
			<c:forEach items="${requestScope.timuList}"  varStatus="sta" var="timu">
				<c:if test="${timu.timuLeixing=='danxuan'}">
				    <table cellspacing="2" cellpadding="2" border="0">
						<tr>
							<td colspan="2">
								${sta.index+1 }：${timu.timuName }
								(
								   本题${timu.timuFenshu }分
								  ,标准答案：<font color="red">${timu.timuDaan}</font>
								  ,考生答案：<font color="red">${timu.timuDaanAsStu}</font>
								)
								<c:if test="${timu.timuDaan==timu.timuDaanAsStu}">正确：得<font style="font-size: 32px;">${timu.timuFenshu}</font>分</c:if>
								<c:if test="${timu.timuDaan!=timu.timuDaanAsStu}">正确：得<font style="font-size: 32px;">0</font>分</c:if>
							</td>
						</tr>
						<tr>
						   <td>
						        A:<input type="radio" name="${timu.timuId}" value="A" style="border: 0"/>${timu.timuXuanxianga }<br/>
							    B:<input type="radio" name="${timu.timuId}" value="B" style="border: 0"/>${timu.timuXuanxiangb }<br/>
							    C:<input type="radio" name="${timu.timuId}" value="C" style="border: 0"/>${timu.timuXuanxiangc }<br/>
							    D:<input type="radio" name="${timu.timuId}" value="D" style="border: 0"/>${timu.timuXuanxiangd }<br/>
						   </td>
						</tr>
					</table>
				</c:if>
				<c:if test="${timu.timuLeixing=='duoxuan'}">
				    <table cellspacing="2" cellpadding="2" border="0">
						<tr>
							<td colspan="2">
								${sta.index+1 }：${timu.timuName }
								(
								   本题${timu.timuFenshu }分
								  ,标准答案：<font color="red">${timu.timuDaan}</font>
								  ,考生答案：<font color="red">${timu.timuDaanAsStu}</font>
								)
								<c:if test="${timu.timuDaan==timu.timuDaanAsStu}">正确：得<font style="font-size: 32px;">${timu.timuFenshu}</font>分</c:if>
								<c:if test="${timu.timuDaan!=timu.timuDaanAsStu}">正确：得<font style="font-size: 32px;">0</font>分</c:if>
							</td>
						</tr>
						<tr>
						   <td>
						        A:<input type="checkbox" name="${timu.timuId}" value="A" style="border: 0"/>${timu.timuXuanxianga }<br/>
							    B:<input type="checkbox" name="${timu.timuId}" value="B" style="border: 0"/>${timu.timuXuanxiangb }<br/>
							    C:<input type="checkbox" name="${timu.timuId}" value="C" style="border: 0"/>${timu.timuXuanxiangc }<br/>
							    D:<input type="checkbox" name="${timu.timuId}" value="D" style="border: 0"/>${timu.timuXuanxiangd }<br/>
						   </td>
						</tr>
					</table>
				</c:if>
				<c:if test="${timu.timuLeixing=='jianda'}">
				    <table cellspacing="2" cellpadding="2" border="0">
						<tr>
							<td colspan="2">
								${sta.index+1 }：${timu.timuName }
								(
								   本题${timu.timuFenshu }分
								  ,参考答案：<font color="red">${timu.timuDaan}</font>
								)
								
							</td>
						</tr>
						<tr>
						   <td>
						        <input name="${timu.timuId}" type="text" size="74" value="${timu.timuDaanAsStu}"/>
						   </td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			
			
			<br/>
			
			<fieldset style="width:400px; margin-left:0px;"><legend class="fieldtitle">添加成绩</legend>
				<table class="bill" width="100%">
				    <form action="<%=path %>/shiti_fenshu_add.action" name="" method="post">		
						<input type="hidden" name="shitiId" value="${requestScope.shitiId}"/>
						<input type="hidden" name="stuId" value="${requestScope.stuId}"/>
						输入分数：<input type="text" name="fenshu" size="10" value="100" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
						<input type="submit" value="打分"/>
					</form>
				</table>
			</fieldset>
	</body>
</html>
