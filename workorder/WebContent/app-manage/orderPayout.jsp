<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="<%=basePath%>js/mui-master/examples/hello-mui/css/mui.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/app/z-layout.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/app/style.css" rel="stylesheet"
	type="text/css">
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

.mui-input-group .mui-input-row:after {
	background-color: #eee;
}

.mui-checkbox.mui-left input[type=checkbox], .mui-radio.mui-left input[type=radio]
	{
	left: 10px;
}

.mui-checkbox input[type=checkbox]:checked:before, .mui-radio input[type=radio]:checked:before
	{
	color: #53cc33;
}
</style>
</head>
<body>
	<div class="topbar mui-bar mui-bar-nav">
		<div class="z-row">
			<div class="topbarleft">
				<i class="fa fa-chevron-left fa-fw"></i>返回
			</div>
			<div class="z-col topbarcenter">技师列表</div>
			<div class="topbarright"></div>
		</div>
	</div>

	<div class="mui-content" id="content" v-cloak>
		<form class="mui-input-group">
			<!-------->
			<div v-for="(item,index) in workerList">
				<div class="jslbzmindex">{{Object.keys(item)[0]}}</div>
				<div class="jsxmbox">
					<div class="z-row jsxmitem" v-for="(items,index) in Object.values(item)[0]">
						<div class="jsname">{{items.NAME}}</div>
						<div>
							<em class="jsfl">{{items.TYPE}}</em>
						</div>
						<div class="z-col">
							<!-- <span class="swfzr"><i class="fa fa-star-o fa-lg"></i>&nbsp;<font class="swfzrlabel">设为负责人</font></span> -->
						</div>
						<div class="jsxmitemfxk">
							<div class="mui-input-row mui-checkbox mui-left">
								<input name="checkbox" :value=items.ID type="checkbox">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="bottomblank"></div>
		<!--空div占位置-->
	</div>

	<div class="bottombtnbox">
		<a href="#" class="mui-btn mui-btn-danger xdfjbtn width100">工单派发&nbsp;<i class="fa fa-long-arrow-right fa-fw"></i></a>
	</div>
</body>
<script type="text/javascript">
	var workerArr = ${workerArray};
	var orderId = '${orderId}';
</script>
<script src="<%=basePath%>js/Convert_Pinyin.js"></script>
<script src="<%=basePath%>js/mui-master/examples/hello-mui/js/mui.js"></script>
<script src="<%=basePath%>src/vue.js"></script>
<script type="text/javascript" src="<%=basePath%>js/app/orderPayout.js"></script>
</html>