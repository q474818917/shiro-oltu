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
              <li class="active"><a href="<%=path%>/add/index">Add Document</a></li>
              <li><a href="<%=path%>/update/index">Update Document</a></li>
              <li><a href="<%=path%>/delete/index">Delete Document</a></li>
              <li><a href="<%=path%>/rebuild/index">Rebuild Document</a></li>
              <li><a href="<%=path%>/log/index">Log Watching</a></li>
            </ul>
          </div>
        </div>
      </nav>
      

  <div class="well" style="height:768px;border:1px solid #B8B8A3;"> 
  
  	  <div class="alert alert-success" role="alert" style="display:none" id="modal">
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>Warning!</strong> 
		  <span>Better check yourself, you're not looking too good.</span>
	  </div>
	  
	  <h3>solr add document</h3>
	  <form class="form-inline" id="addForm">
	  	  <div>
			  <div class="form-group">
			    <label for="exampleInputName2">Key</label>
			    <input type="text" class="form-control" name="key" >
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail2">Value</label>
			    <input type="text" class="form-control" name="value" >
			  </div>
			  <button type="button" class="btn btn-danger btn-sm" onclick="funcM(this)">
			  	<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
			  </button>
			  <button type="button" class="btn btn-success btn-sm" onclick="funcP(this)">
			  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			  </button>
		  </div>
		  
	  </form>
	  
	  <form class="form-inline">
		  <div class="form-group">
			  <select class="form-control" id="coreSelect">
			  </select>
		  </div>
		  <div class="form-group">
		   <button type="button" class="btn btn-default" onclick="addAjax()">submit</button> 
		  </div>
	  </form>
</div>

	
</body>
  <script type="text/javascript">
  	function funcM(_ele){
  		if($('#addForm').find('>div').size() > 1){
  			$(_ele).parent().remove();
  		}
  	}
  	
  	function funcP(_ele){
  		var cloneNode = $(_ele).parent().clone();
  		$(cloneNode).find('input[name=\'key\']').val('');
  		$(cloneNode).find('input[name=\'value\']').val('');
  		$(cloneNode).appendTo($('#addForm'));
  	}
  	
  	var map = {};
  	function addAjax(){
		$('input[name=\'key\']').each(function(i){
			map[$(this).val()] = $('input[name=\'value\']').eq(i).val();
		})  
		$.ajax({
            type: "post",
            url: "<%=path%>/add/oper?n=" + Math.random(),
            dataType: "json",
            data: {'map' : JSON.stringify(map), 'core':$('#coreSelect').val()},
            success: function (data) {
            	if(data.type == 'success'){
            		$('#modal').attr('class', 'alert alert-success');
            	}else{
            		$('#modal').attr('class', 'alert alert-danger');
            	}
            	$('#modal').find('>span').html(data.content);
            	$('#modal').show();
            },
            error: function () {
                alert("System error");
            }
        });
		map = {};
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
