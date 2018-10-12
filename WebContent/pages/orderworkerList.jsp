<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>工单系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="<%=basePath %>js/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="<%=basePath %>js/layui/css/layui.css" media="all">
  <link href="<%=basePath %>js/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="<%=basePath %>css/style.css" media="all">
  <script src="<%=basePath %>js/jquery-1.11.0.min.js"></script>
  <script src="<%=basePath %>js/orderWorkerList.js"></script>
  
  <script>
  ///^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
  </script>
  <script>window.path='<%=basePath %>'</script>
</head>
<body>
<div class="container showlist">
   <div class="orderW"></div>
</div>

</body>
</html>