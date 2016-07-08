<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Head first Solr Cloud !!!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=path%>/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
  </head>
  
  <body>
 <div class="container">
 	<table class="table">
      <caption>Optional table caption.</caption>
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Company</th>
          <th>Post</th>
          <th>是否好友</th>
          <th>是否联系人</th>
        </tr>
      </thead>
      <tbody>
       <c:forEach var="user" items="${solrPage.list}">
        <tr>
          <th scope="row">${user.id }</th>
          <td>${user.name }</td>
          <td>${user.company }</td>
          <td>${user.post }</td>
          <td><c:if test="${user.friendStatus=='1'}">是</c:if></td>
          <td><c:if test="${user.contactStatus=='1'}">是</c:if></td>
        </tr>
 	  </c:forEach>
      </tbody>
    </table>
 </div>     
</html>
