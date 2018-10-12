<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>工单系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>js/layui/css/layui.css"
	media="all">
<link rel="stylesheet"
	href="<%=basePath%>js/fontawesome/css/font-awesome.css" media="all">
<link rel="stylesheet" href="<%=basePath%>css/admin.css" media="all">
<link rel="stylesheet" href="<%=basePath%>css/style.css" media="all">
</head>
<body>
	<div class="layui-fluid">
		<div class="sxkuang">
			<div class="z-row tiaojianbox">
				<div>
					<button class="layui-btn sxkuangbtn sxkbtn_active">全部工单</button>
				</div>
				<div>
					<button class="layui-btn sxkuangbtn">已派送工单</button>
				</div>
				<div>
					<button class="layui-btn sxkuangbtn">进行中工单</button>
				</div>
				<div>
					<button class="layui-btn sxkuangbtn">已完成工单</button>
				</div>
				<div class="z-col"></div>
				<div class="z-col">
					<input type="text" placeholder="报修人姓名、报修电话" class="layui-input">
				</div>
				<div>
					<button class="layui-btn layui-btn-danger">
						<i class="fa fa-search fa-fw"></i> 搜索
					</button>
				</div>
			</div>

			<div class="layui-col-lg12 pad15">
				<div class="layui-row layui-col-space15">
					<!---->
					<div class="layui-col-md3 layui-col-lg3">
						<div class="layui-card">
							<div class="newsc">
								<img src="<%=basePath%>images/new.png" width="32" height="32">
							</div>
							<div class="layui-card-header">
								<div class="z-row">
									<div>工单编号：</div>
									<div class="z-col">GD_PSXT_20180923</div>
									<div>
										<a href="orderDetail" class="xxcl"><i
											class="fa fa-eye fa-f2"></i>&nbsp;工单详情</a>
									</div>
								</div>
							</div>
							<div class="layui-card-body">
								<div class="layui-carousel layadmin-carousel layadmin-shortcut">
									<div class="z-row">
										<div>报修时间：</div>
										<div class="z-col">2018-09-28 16:13:34</div>
									</div>
									<div class="z-row">
										<div>工单类型：</div>
										<div class="z-col">给排水</div>
									</div>
									<div class="z-row">
										<div>故障类型：</div>
										<div class="z-col">损坏</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---->
					<div class="layui-col-md3 layui-col-lg3">
						<div class="layui-card">
							<div class="layui-card-header">
								<div class="z-row">
									<div>工单编号：</div>
									<div class="z-col">GD_PSXT_20180923</div>
									<div>
										<a href="orderDetail" class="xxcl"><i
											class="fa fa-eye fa-f2"></i>&nbsp;工单详情</a>
									</div>
								</div>
							</div>
							<div class="layui-card-body">
								<div class="layui-carousel layadmin-carousel layadmin-shortcut">
									<div class="z-row">
										<div>报修时间：</div>
										<div class="z-col">2018-09-28 16:13:34</div>
									</div>
									<div class="z-row">
										<div>工单类型：</div>
										<div class="z-col">给排水</div>
									</div>
									<div class="z-row">
										<div>故障类型：</div>
										<div class="z-col">损坏</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---->
					<div class="layui-col-md3 layui-col-lg3">
						<div class="layui-card">
							<div class="layui-card-header">
								<div class="z-row">
									<div>工单编号：</div>
									<div class="z-col">GD_PSXT_20180923</div>
									<div>
										<a href="orderDetail" class="xxcl"><i
											class="fa fa-eye fa-f2"></i>&nbsp;工单详情</a>
									</div>
								</div>
							</div>
							<div class="layui-card-body">
								<div class="layui-carousel layadmin-carousel layadmin-shortcut">
									<div class="z-row">
										<div>报修时间：</div>
										<div class="z-col">2018-09-28 16:13:34</div>
									</div>
									<div class="z-row">
										<div>工单类型：</div>
										<div class="z-col">给排水</div>
									</div>
									<div class="z-row">
										<div>故障类型：</div>
										<div class="z-col">损坏</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

