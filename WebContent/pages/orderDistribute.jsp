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
<link rel="stylesheet"
	href="<%=basePath%>js/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" href="<%=basePath%>js//layui/css/layui.css"
	media="all">
<link href="<%=basePath%>js/fontawesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>css/style.css" media="all">
<link rel="stylesheet" href="<%=basePath%>css/admin.css" media="all">
</head>
<body>
	<div class="layui-fluid" id="rightbox" v-cloak>
		<div class="shadowbox">
			<div class="row">
				<div class="col-lg-12 shadowboxtitle">维修主管</div>
			</div>
			<form class="layui-form">
				<div class="row">
					<div class="col-lg-3">
						<select name="area" id="area" lay-filter="area">
							<option value="">请选择小区名</option>
							<option :value=i.ID  v-for = "i in areaList">{{i.MANAGE_AREA}}</option>
						</select>
					</div>
					<div class="col-lg-12 padT10">
						<div class="z-row padTB5" v-for="i in visorList">
							<div>
								<input  type="radio" :_id=i.ID  name="visorName"  :value=i.NAME  :title=i.NAME>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="z-row">
			<div class="z-col"></div>
			<div>
				<a href="#" v-on:click="paifa()" class="layui-btn layui-btn-danger"><i
					class="fa fa-hdd-o fa-fw"></i>&nbsp;确定派发</a>
			</div>
			<div class="z-col"></div>
		</div>
	</div>
	<script>
	  var areaArr = ${areaArr};
	  var work_id='${work_id}';
	</script>
	<script type="text/javascript" src="<%=basePath%>js/layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath%>src/vue.js"></script>
	<script type="text/javascript" src="<%=basePath%>src/jquery-1.9.1.min.js"></script>	
	<script type="text/javascript" src="<%=basePath%>js/orderDistribute.js"></script>	
</body>
</html>


