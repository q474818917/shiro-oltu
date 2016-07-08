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
	<style>
		body { 
			padding:20px;
		}
		#console { 
			height: 400px; 
			overflow: auto; 
		}
		.username-msg {color:orange;}
		.connect-msg {color:green;}
		.disconnect-msg {color:red;}
		.send-msg {color:#888}
	</style>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/socket.io/socket.io.js"></script>
	<script type="text/javascript" src="<%=path%>/js/moment.min.js"></script>
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
              <li><a href="<%=path%>/rebuild/index">Rebuild Document</a></li>
              <li><a href="<%=path%>/log/index">Log Watching</a></li>
            </ul>
          </div>
        </div>
      </nav>
      
      <div id="console" class="well">
   </div>
   
    
  	<script type="text/javascript">
  		$(function(){
  			var socket =  io.connect('http://localhost:9092');
  			
  			socket.on('connect', function() {
  				output('<span class="connect-msg">Client has connected to the server!</span>');
  			});
  			
  			socket.on('chatevent', function(data) {
  				output('<span class="username-msg">' + data + ':</span> ');
  			});
  			
  			function output(message) {
                var currentTime = "<span class='time'>" +  moment().format('HH:mm:ss.SSS') + "</span>";
                var element = $("<div>" + currentTime + " " + message + "</div>");
				$('#console').prepend(element);
			}
  		})
  	</script>
  </body>
</html>
