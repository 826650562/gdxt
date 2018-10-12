<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<title>工单系统</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
<!--<link href="layui/css/layui.css" rel="stylesheet" type="text/css">-->
<link href="<%=basePath%>js/fontawesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>js/mui-master/examples/hello-mui/css/mui.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/app/z-layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/app/workerStyle.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
html, body {
	height: 100%;
	position: relative;
}
</style>
</head>
<body>

	<div class="topbar mui-bar mui-bar-nav">
		<div class="z-row">
			<div class="topbarleft"  onclick="javascript:history.back();">
				<i class="fa fa-chevron-left fa-fw"></i>返回
			</div>
			<div class="z-col topbarcenter" id="topbarcenter">申请退单</div>
			<div class="topbarright">
				<!-- <a href="wxjd.html" class="colorRed">维修进度</a> -->
			</div>
		</div>
	</div>

	<div class="mui-content">

		<div class="tablebox">
			<div class="z-row">
				<div class="z-col">
					<textarea class="srymarea" id="srymarea" rows="5" placeholder="例如：房屋报修水管，实际存在电路问题。"></textarea>
				</div>
			</div>
			<div class="z-row">
				<div class="z-col">
					<em class="color666">内容长度小于150字</em>
				</div>
			</div>
		</div>

		<div class="bottomblank"></div>
		<!--空div占位置-->
	</div>

	<div class="bottombtnbox">
		<div class="z-row">
			<div class="z-col">
				<button id="submitBtn" class="mui-btn mui-btn-danger xdfjbtn width100">确定</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script src="<%=basePath%>js/mui-master/examples/hello-mui/js/mui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/app/workerOrderComplete.js"></script>
<script type="text/javascript">
var status = '${status}';
var orderId = '${orderId}';
var manageId = '${manageId}';
</script>
</html>