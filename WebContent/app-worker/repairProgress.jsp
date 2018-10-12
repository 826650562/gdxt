<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>工单系统</title>
<!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
<!--<link href="layui/css/layui.css" rel="stylesheet" type="text/css">-->
<link href="<%=basePath%>js/fontawesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=basePath%>js/mui-master/examples/hello-mui/css/mui.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>js/layui/css/layui.css"
	media="all">
<link href="<%=basePath%>css/app/z-layout.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/app/workerStyle.css" rel="stylesheet"
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
</style>
</head>
<body>

	<div class="topbar mui-bar mui-bar-nav">
		<div class="z-row">
			<div class="topbarleft" onclick="javascript:history.back();">
				<i class="fa fa-chevron-left fa-fw"></i>返回
			</div>
			<div class="z-col topbarcenter">维修进度</div>
			<div class="topbarright"></div>
		</div>
	</div>

	<div class="mui-content">
		<div class="tablebox">

			<div class="row">
				<div class="col-lg-12">

					<ul class="layui-timeline">
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">
									<strong class="colorGreen">工单接单</strong>
								</h3>
								<p>
									2018-04-21 17：99：34 <br>接单派发：维修主管（工号：104）
								</p>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">
									<strong class="colorRed">工单回退</strong>
								</h3>
								<p>
									2018-04-21 17：99：34<br> 回退对象：维修主管（工号：104）<br />
									回退理由：电线漏电是由于旁边的排水管漏水导致 ，请派维修排水管道的技师协助处理。
								</p>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">
									<strong class="colorGreen">工单接单</strong>
								</h3>
								<p>
									2018-04-21 17：99：34 <br>接单人：技工（孙科）
								</p>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">
									<strong class="colorYellow">工单派发</strong>
								</h3>
								<p>
									2018-04-21 17：99：34 <br>派法人：维修主管（工号：104）<br>
									派发对象：技工（孙科）
								</p>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">
									<strong class="colorGreen">工单接单</strong>
								</h3>
								<p>
									2018-04-21 17：99：34 <br>接单派发：维修主管（工号：104）
								</p>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">
									<strong class="colorYellow">工单派发</strong>
								</h3>
								<p>
									2018-04-21 17：99：34 <br>工单派发：值班员（工号：001）<br>
									派发对象：维修主管（工号：104）
								</p>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">
									<strong class="colorGreen">工单生成</strong>
								</h3>
								<p>
									2018-04-21 17：99：34 <br>工单生成：值班员（工号：001）<br>
									工单编号：GD20180421-867<br> 工单类型：弱电系统<br> 报修时间：2018-04-21
									17：99：34<br> 处理方式：立即<br> 设备名称：路灯<br> 设备编号：LD079<br>
									故障类型：损坏<br> 故障详细地址：保障房02（东区）2#东侧<br> 紧急程度：高<br>
									备注说明：路灯被认为损坏
								</p>
							</div></li>

					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12 bottomblank"></div>
			</div>


		</div>
	</div>

	<!-- <div class="bottombtnbox">
		<button id="btn" class="mui-btn mui-btn-danger xdfjbtn width100">完工申请</button>
	</div> -->
	<script type="text/javascript" src="<%=basePath%>js/layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
	<script>
	layui.use('element', function(){
	  var element = layui.element;
	});
</script>
</body>
</html>