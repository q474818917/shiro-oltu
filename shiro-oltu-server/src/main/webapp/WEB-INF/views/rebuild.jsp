<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a href="<%=path%>/index" class="navbar-brand">SolrIndex</a>
          </div>
          <div class="navbar-collapse collapse" id="navbar">
            <ul class="nav navbar-nav">
              <li><a href="<%=path%>/add/index">Add Document</a></li>
              <li><a href="<%=path%>/update/index">Update Document</a></li>
              <li><a href="<%=path%>/delete/index">Delete Document</a></li>
              <li class="active"><a href="<%=path%>/rebuild/index">Rebuild Document</a></li>
              <li><a href="<%=path%>/log/index">Log Watching</a></li>
            </ul>
          </div>
        </div>
      </nav>
      
<div class="well"> 
  <h3>solr rebuild index</h3>
  
  <form data-example-id="btn-tags" class="bs-example">
    <input type="button" value="userIndex" onclick="userIndex(this)" class="btn btn-default"/>
    <input type="button" value="feedIndex" onclick="feedIndex(this)" class="btn btn-default"/>
    <input type="button" value="groupIndex" onclick="groupIndex(this)" class="btn btn-default"/>
    <!-- <input type="button" value="followIndex" onclick="followIndex(this)" class="btn btn-default"/> -->
    <input type="button" value="poiIndex" onclick="poiIndex(this)" class="btn btn-default"/>
    <input type="button" value="cloudIndex" onclick="cloudIndex(this)" class="btn btn-default"/>
  </form>
  <hr>
</body>
  <script type="text/javascript">
  
  	function userIndex(e){
  		$(e).attr("disabled","disabled");
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/userIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function feedIndex(e){
  		$(e).attr("disabled","disabled");
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/feedIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function groupIndex(e){
  		$(e).attr("disabled","disabled");
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/groupIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function followIndex(e){
  		$(e).attr("disabled","disabled");
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/followIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function poiIndex(e){
  		$(e).attr("disabled","disabled");
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/poiIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function cloudIndex(e){
  		$(e).attr("disabled","disabled");
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/cloudIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  </script>
</html>
