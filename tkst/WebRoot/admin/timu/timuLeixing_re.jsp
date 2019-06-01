<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
      <%
          String timuLeixing=request.getParameter("timuLeixing");
          request.setAttribute("timuLeixing",timuLeixing);
          
          int kechengId=Integer.parseInt(request.getParameter("kechengId"));
          request.setAttribute("kechengId",kechengId);
      %>
      <script type="text/javascript">
           function tiao()
           {
               <s:if test="#request.timuLeixing=='danxuan'">
                    window.location.href="<%=path %>/admin/timu/timu_danxuan_Add.jsp?timuLeixing=danxuan&kechengId=<%=kechengId%>";
               </s:if>
               <s:if test="#request.timuLeixing=='duoxuan'">
                    window.location.href="<%=path %>/admin/timu/timu_duoxuan_Add.jsp?timuLeixing=duoxuan&kechengId=<%=kechengId%>";
               </s:if>
               <s:if test="#request.timuLeixing=='panduan'">
                    window.location.href="<%=path %>/admin/timu/timu_panduan_Add.jsp?timuLeixing=panduan&kechengId=<%=kechengId%>";
               </s:if>
               <s:if test="#request.timuLeixing=='jianda'">
                    window.location.href="<%=path %>/admin/timu/timu_jianda_Add.jsp?timuLeixing=jianda&kechengId=<%=kechengId%>";
               </s:if>
           }
           
           setTimeout(tiao,10)
       </script>
  </body>
</html>
