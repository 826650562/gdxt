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
		<div class="rightbox" id="rightbox" v-cloak>
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
												<label class="layui-form-label">工单类型：</label>
												<div class="layui-input-block">
													<select name="ordertype" lay-filter="ordertype" id="ordertype">
														<option value="" selected=""></option>
														<option :value=i.ID v-for='i in orderType'>{{i.TYPENAME}}</option>
														<!-- <option value="1">电梯</option>
														<option value="2">设施设备</option>
														<option value="3">电力</option> -->
													</select>
												</div>
											</div>
										</td>
										<td>
											<div class="layui-form-item">
												<div class="layui-inline">
													<label class="layui-form-label">报修时间：</label>
													<div class="layui-input-block">
														<div class="layui-input" id="orderTime"
															style="line-height: 38px;"></div>
													</div>
												</div>
											</div>
										</td>
										<td>
											<div class="layui-form-item">
												<label class="layui-form-label">详细故障地址：</label>
												<div class="layui-input-block">
													<input id="orderAddress" type="text" name="orderAddress" lay-verify="title"
														autocomplete="off" placeholder="请输入" class="layui-input">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="layui-form-item">
												<div class="layui-inline">
													<label class="layui-form-label">报修人电话：</label>
													<div class="layui-input-block">
														<input id="orderPhone" type="text" name="orderPhone" lay-verify="title"
															autocomplete="off" placeholder="请输入" class="layui-input">
													</div>
												</div>
											</div>
										</td>
										<td>
											<div class="layui-form-item">
												<label class="layui-form-label">报修渠道：</label>
												<div class="layui-input-block">
													<select name="wayType" lay-filter="wayType" id="wayType">
														<option value="" selected=""></option>
														<option :value=i.ID v-for="i in wayType">{{i.WAYNAME}}</option>
														<!-- <option value="1">客服报修</option>
														<option value="2">电话报修</option>
														<option value="3">员工端报修</option>
														<option value="4">服务端报修</option> -->
													</select>
												</div>
											</div>
										</td>
										<td>
											<div class="z-row">
												<div class="z-col">
													<div class="layui-form-item">
														<div class="layui-inline">
															<label class="layui-form-label">工单编号：</label>
															<div class="layui-input-block">
																<input id="orderNum" type="text" name="orderNum" lay-verify="title"
																	autocomplete="off" placeholder="请输入"
																	class="layui-input" disabled :value=orderNum>
															</div>
														</div>
													</div>
												</div>
												<div @click.stop.prevent="getOrderNum()">
													<a href="javascript:;" class="layui-btn layui-btn-danger"><i
														class="fa fa-hdd-o fa-fw" ></i>&nbsp;获取</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div class="layui-form-item">
												<div class="layui-inline">
													<label class="layui-form-label">故障描述：</label>
													<div class="layui-input-block">
														<textarea id="troubleDes" placeholder="请输入内容" class="layui-textarea"
															name="troubleDes"></textarea>
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
				<div @click.stop="sendOrder()">
					<a href="javascript:;" class="layui-btn"><i class="fa fa-hdd-o fa-fw"></i>&nbsp;生成工单</a>
				</div>
				<div class="z-col"></div>
			</div>
		</div>
	</div>
		<script>
		var orderType = ${typeArr};
		var wayType = ${wayArray};
		</script>
	<script type="text/javascript" src="<%=basePath%>js/layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath%>src/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>src/vue.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/orderReg.js"></script>
</body>
</html>

