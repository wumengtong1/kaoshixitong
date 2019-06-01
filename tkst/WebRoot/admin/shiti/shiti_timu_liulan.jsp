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
		
        <script language="javascript">
           function timuDetail(timuId)
           {
				var strUrl = "<%=path %>/timuDetail.action?timuId="+timuId;
				var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:600px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="29" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="10%">课程</td>
					<td width="10%">题目类型</td>
					<td width="40%">题目名称</td>
					<td width="10%">分数</td>
		        </tr>	
				<s:iterator value="#request.timuList" id="timu" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ss.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#timu.kecheng.kechengName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:if test="#timu.timuLeixing=='danxuan'">
						    单选题
						</s:if>
						<s:if test="#timu.timuLeixing=='duoxuan'">
						    多选题
						</s:if>
						<s:if test="#timu.timuLeixing=='panduan'">
						    判断题
						</s:if>
						<s:if test="#timu.timuLeixing=='jianda'">
						    简单题
						</s:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a style="color: red" href="#" onclick="timuDetail(<s:property value="#timu.timuId"/>)">
						   <s:property value="#timu.timuName"/>
						</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#timu.timuFenshu"/>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
