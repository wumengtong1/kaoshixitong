<%@ page language="java" pageEncoding="UTF-8"%>
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
		
        <script type='text/javascript' src='<%=path %>/dwr/interface/daojishiService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
		
       <script type="text/javascript">
	   function init()
	   {
	         
	   }
	   
	   
	   
	</script>
	</head>

	<body onload="init()">
	        <form action="<%=path %>/shiti_jiaojuan.action" name="form1" method="post">		
			<table cellspacing="2" cellpadding="2">
			   <tr><td><font color="red" style="font-size: 12px;">注意：每道题目都有默认值。请不要被默认值所误导</font></td></tr>
			</table>
			<c:forEach items="${requestScope.timuList}"  varStatus="sta" var="timu">
			<table cellspacing="2" cellpadding="2">
				<tr>
					<td colspan="2">
						${sta.index+1 }：${timu.timuName }
						(
						  <c:if test="${timu.timuLeixing=='danxuan'}">单选题</c:if>
						  <c:if test="${timu.timuLeixing=='duoxuan'}">多选题</c:if>
						  <c:if test="${timu.timuLeixing=='panduan'}">判断题</c:if>
						  <c:if test="${timu.timuLeixing=='jianda'}">简单题</c:if>
						  ,
						  本题${timu.timuFenshu }分
						)
					</td>
				</tr>
				<tr>
					<td>
						<c:if test="${timu.timuLeixing=='danxuan'}">
						    A:<input type="radio" name="${timu.timuId}" value="A" style="border: 0" checked="checked"/>${timu.timuXuanxianga }<br/>
						    B:<input type="radio" name="${timu.timuId}" value="B" style="border: 0"/>${timu.timuXuanxiangb }<br/>
						    C:<input type="radio" name="${timu.timuId}" value="C" style="border: 0"/>${timu.timuXuanxiangc }<br/>
						    D:<input type="radio" name="${timu.timuId}" value="D" style="border: 0"/>${timu.timuXuanxiangd }<br/>
						</c:if>
						<c:if test="${timu.timuLeixing=='duoxuan'}">
						    A:<input type="checkbox" name="${timu.timuId}" value="A" style="border: 0" checked="checked"/>${timu.timuXuanxianga }<br/>
						    B:<input type="checkbox" name="${timu.timuId}" value="B" style="border: 0"/>${timu.timuXuanxiangb }<br/>
						    C:<input type="checkbox" name="${timu.timuId}" value="C" style="border: 0"/>${timu.timuXuanxiangc }<br/>
						    D:<input type="checkbox" name="${timu.timuId}" value="D" style="border: 0"/>${timu.timuXuanxiangd }<br/>
						</c:if>
						<c:if test="${timu.timuLeixing=='panduan'}">
						    A:<input type="radio" name="${timu.timuId}" value="A" style="border: 0" checked="checked"/>${timu.timuXuanxianga }<br/>
						    B:<input type="radio" name="${timu.timuId}" value="B" style="border: 0"/>${timu.timuXuanxiangb }<br/>
						</c:if>
						<c:if test="${timu.timuLeixing=='jianda'}">
						    <input name="${timu.timuId}" type="text" style="width: 300px;"/>
						</c:if>
					</td>
				</tr>
			</table>
			<br/>
			</c:forEach>
			<table cellspacing="2" cellpadding="2">
			    <tr>
			        <td>
			            <input type="hidden" name="shitiId" value="${requestScope.shitiId}"/>
			            <input type="submit" value="交卷" style="width: 120px;"/>
			        </td>
			    </tr>
			</table>
			</form>
	</body>
</html>
