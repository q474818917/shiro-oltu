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
              <li class="active"><a href="<%=path%>/delete/index">Delete Document</a></li>
              <li><a href="<%=path%>/rebuild/index">Rebuild Document</a></li>
              <li><a href="<%=path%>/log/index">Log Watching</a></li>
            </ul>
          </div>
        </div>
      </nav>
      
	<div class="well"> 
	  <h3>solr delete all document</h3>
	  <form class="form-inline" id="updateForm">
		  <div>
		  	  <label>Core Selector</label>
			  <div class="form-group">
			  	<select class="form-control" id="coreSelect">
				</select>
			  </div>
			  <input type="button" value="delete" class="btn btn-danger" onclick="deleteFunc()"/>
		  </div>
		  <h1></h1>
	  </form>
	</div>	
	
	<div class="well"> 
	  <h3>solr delete document by id</h3>
	  <form class="form-inline" id="updateForm">
		  <div>
		  	  <label>Core Selector</label>
			  <div class="form-group">
			  	<select class="form-control" id="coreSelect">
				</select>
			  </div>
			  <input type="button" value="delete" class="btn btn-danger" onclick="deleteFunc()"/>
		  </div>
		  <h1></h1>
	  </form>
	</div>		  
  </div>
  <hr>
</body>
  <script type="text/javascript">
  
  	function deleteFunc(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/delete/data?coreName=" + $('#coreSelect').val(),
            dataType: "json",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	$(function(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/core/list",
            dataType: "json",
            success: function(data) {
            	$('#coreSelect').empty();
            	for(var i = 0; i < data.length; i++){
            		$("<option value="+ data[i] +">"+ data[i]+"</option>").appendTo($('#coreSelect'));
            	}
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	})
  	
  	
  </script>
</html>
