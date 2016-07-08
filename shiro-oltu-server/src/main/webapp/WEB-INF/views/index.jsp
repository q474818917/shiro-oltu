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
      
      <div class="jumbotron">
		  <h1>Welcome !</h1>
		  <p>             Solr is the popular, blazing-fast, open source enterprise search platform built on Apache Lucene</p>
		  <p><a class="btn btn-primary btn-lg" href="http://lucene.apache.org/solr/" role="button">Learn more</a></p>
		</div>
 <%--     
<div class="well"> 
  <h3>solr rebuild index</h3>
  <div>
    <input type="button" value="clipIndex" onclick="clipIndex()" class="btn btn-default"/>
    <input type="button" value="courseIndex" onclick="courseIndex()" class="btn btn-default"/>
    <input type="button" value="paperIndex" onclick="paperIndex()" class="btn btn-default"/>
    <input type="button" value="simulIndex" onclick="simulIndex()" class="btn btn-default"/>
    <input type="button" value="quizIndex" onclick="quizIndex()" class="btn btn-default"/>
    <input type="button" value="videoIndex" onclick="videoIndex()" class="btn btn-default"/>
  </div>  
  
  <div>
  	<input type="button" value="clipIndexContent" onclick="clipIndexContent()" class="btn btn-primary"/>
    <input type="button" value="courseIndexContent" onclick="courseIndexContent()" class="btn btn-primary"/>
    <input type="button" value="paperIndexContent" onclick="paperIndexContent()" class="btn btn-primary"/>
    <input type="button" value="simulIndexContent" onclick="simulIndexContent()" class="btn btn-primary"/>
    <input type="button" value="quizIndexContent" onclick="quizIndexContent()" class="btn btn-primary"/>
  </div> 
  </div>
  <div class="well"> 
  <h3>solr add document</h3>
  <form class="form-inline">
  	  <div>
		  <div class="form-group">
		    <label for="exampleInputName2">Key</label>
		    <input type="text" class="form-control" id="key1" >
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail2">Value</label>
		    <input type="text" class="form-control" id="value1" >
		  </div>
		  <button type="button" class="btn btn-danger">
		  	<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
		  </button>
		  <button type="button" class="btn btn-success">
		  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		  </button>
	  </div>
	  
	  <h1></h1>
	  <input type="submit" value="submit" class="btn btn-default">
  </form>
</div>

<div class="well"> 
  <h3>solr update document</h3>
  <form class="form-inline" id="updateForm">
  	  <div>
		  <div class="form-group">
		    <label for="exampleInputName2">Key</label>
		    <input type="text" class="form-control" id="key1" >
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail2">Value</label>
		    <input type="text" class="form-control" id="value1" >
		  </div>
		  <button type="button" class="btn btn-danger" onclick="onMinus(this)">
		  	<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
		  </button>
		  <button type="button" class="btn btn-success" onclick="onPlus(this)">
		  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		  </button>
	  </div>
	  
	  <h1></h1>
	  <div>
	  	  <label>Core Selector</label>
		  <div class="form-group">
		  	<select class="form-control" >
			  <option>res_courseware</option>
			  <option>2</option>
			  <option>3</option>
			  <option>4</option>
			  <option>5</option>
			</select>
		  </div>
		  <div class="form-group">
		    <label>host</label>
		    <input type="text" class="form-control" id="value1" >
		  </div>
	  </div>
	  <h1></h1>
	  <input type="submit" value="submit" class="btn btn-default">
  </form>
</div>	

<div class="well"> 
  <h3>solr delete document</h3>
  <form class="form-inline" id="updateForm">
	  <div>
	  	  <div class="form-group">
		    <label>host</label>
		    <input type="text" class="form-control" id="updateHost" value="http://10.60.0.35:7001/solr" onblur="getCores(this)">
		  </div>
	  	  <label>Core Selector</label>
		  <div class="form-group">
		  	<select class="form-control" id="coreSelect">
			  <option>-请选择-</option>
			</select>
		  </div>
		  <input type="button" value="delete" class="btn btn-danger" onclick="deleteFunc()"/>
	  </div>
	  <h1></h1>
  </form>
</div>		  
  </div>
  <hr> --%>
</body>
  <script type="text/javascript">
  
  	<%-- function deleteFunc(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/core/delData?coreName=" + $('#coreSelect').val(),
            dataType: "json",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function getCores(e){
  		var _select = document.getElementById("coreSelect");
  		$.ajax({
	        type: "get",
            url: "<%=path%>/core/list?host=" + $(e).val(),
            dataType: "json",
            success: function(data) {
            	$(_select).empty();
            	for(var i = 0; i < data.length; i++){
            		_select.options.add(new Option(data[i], data[i])); 
            	}
            	_select[0].selected = true;
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function onPlus(){
  	}
  	
  	function onMinus(){
  		if($('#updateForm').find('>div').size() < 2){
  			return false;
  		}
  	}
  	
  	function courseIndexContent(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/index/wareContent",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function paperIndexContent(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/index/paperContent",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function clipIndexContent(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/index/clipContent",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function simulIndexContent(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/index/simulContent",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function quizIndexContent(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/index/quizContent",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	//----
  	
  	function courseIndex(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/wareIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function paperIndex(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/paperIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function clipIndex(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/clipIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function simulIndex(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/simulIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function quizIndex(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/quizIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	}
  	
  	function videoIndex(){
  		$.ajax({
	        type: "get",
            url: "<%=path%>/rebuild/videoIndex",
            dataType: "html",
            success: function(data) {
            	
            },
            error: function(e) {
            	alert(e);
            }
    	});
  	} --%>
  </script>
</html>
