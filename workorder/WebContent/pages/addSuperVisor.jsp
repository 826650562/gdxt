<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>工单系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>js//layui/css/layui.css"
	media="all">
<link href="<%=basePath%>js/fontawesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>css/style.css" media="all">
<link rel="stylesheet" href="<%=basePath%>css/admin.css" media="all">
</head>
<body>
	<div class="layui-fluid">
		<div class="rightbox" id="rightbox">
			<div class="shadowbox">
				<div class="row">
					<div class="col-lg-12">
						<form class="layui-form" name="orderForm" action="sendOrder" method="post">
							<table class="layui-table mar0">
								<colgroup>
									<col>
									<col>
									<col>
								</colgroup>
								<tbody>
									<tr>
										<td>
											<div class="layui-form-item">
												<label class="layui-form-label">管辖小区：</label>
												<div class="layui-input-block">
													<select name="area" lay-filter="area" id="area">
														<option value="" selected=""></option>
														<option :value=i.ID v-for='i in area'>{{i.MANAGE_AREA}}</option>
													</select>
												</div>
											</div>
										</td>										
									</tr>
									<tr>
										<td>
											<div class="layui-form-item">
												<div class="layui-inline">
													<label class="layui-form-label">主管名字：</label>
													<div class="layui-input-block">
														<input id="name" type="text" name="name"  lay-verify="name"
														autocomplete="off" placeholder="请输入" class="layui-input" :value=name>
													</div>
												</div>
											</div>
										</td>
									</tr>									
									<tr>
										<td>
											<div class="layui-form-item">
												<div class="layui-inline">
													<label class="layui-form-label">主管性别：</label>
													<div class="layui-input-block">
														<div class="layui-input-block" style="line-height: 36px;">
															<input type="radio" name="sex" value="男" title="男">
															<input type="radio" name="sex" value="女" title="女">
														</div>
													</div>
												</div>
											</div>
										</td>										
									</tr>
									<tr>
										<td>
											<div class="layui-form-item">
												<div class="layui-inline">
													<label class="layui-form-label">主管电话：</label>
													<div class="layui-input-block">
														<input id="phone" type="text" name="phone" lay-verify="title"
															autocomplete="off" placeholder="请输入" class="layui-input" :value=phone>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="z-row">
				<div class="z-col"></div>
				<div @click.stop="setVisor()">
					<a href="javascript:;" class="layui-btn"><i class="fa fa-hdd-o fa-fw"></i>&nbsp;提交</a>
				</div>
				<div class="z-col"></div>
			</div>
		</div>
	</div>
		<script>
		var manageStr = '${manageArr}';
		var areaArr = ${areaArr};
		</script>
	<script type="text/javascript" src="<%=basePath%>js/layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath%>src/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>src/vue.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/addSuperVisor.js"></script>
</body>
</html>

