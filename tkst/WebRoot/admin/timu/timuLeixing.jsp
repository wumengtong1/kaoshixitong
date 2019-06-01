<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
        
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script language="javascript">
           var i=0;
           function kechengSelect()
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   loginService.kechengSelect(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("kechengId",data,"kechengId","kechengName");
           }
           
           function check()
           {
               if(document.formAdd.kechengId.value==0)
               { 
                   alert("请选择课程");
                   return false;
               }
               document.formAdd.submit();
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/admin/timu/timuLeixing_re.jsp" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>&nbsp;</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        课程选择：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <table border="0">
						           <tr> 
						               <td>  
						                  <select name="kechengId" id="kechengId" onclick="kechengSelect()" style="width:222px;">
								              <option value="0">请选择课程</option>
								          </select>
						               </td>
						               <td><img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/></td>
						           </tr>
						        </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        题目类型：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						         <table border="0">
						           <tr> 
						               <td>  
						                  <select name="timuLeixing" style="width:222px;">
								             <option value="danxuan" selected="selected">单选题</option>
								             <option value="duoxuan">多选题</option>
								             <option value="jianda">简答题</option>
								          </select>
						               </td>
						               <td></td>
						           </tr>
						        </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						      <input type="button" value="确定" onclick="check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
