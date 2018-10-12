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
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>js//layui/css/layui.css" media="all">
<link href="<%=basePath%>js/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/orderWorker.js"></script>
<script>window.path='<%=basePath %>'</script>
</head>
<body>

		<div class="layui-fluid">
		<div class="rightbox">
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
											<div class="layui-form-item" style="margin-bottom:0px">
												<div class="layui-inline">
													<label class="layui-form-label">姓名：</label>
													<div class="layui-input-block">
														<input id="name" type="text" name="name"  lay-verify="name"
														autocomplete="off" placeholder="请输入姓名" class="layui-input">
													</div>
												</div>
											</div>
										</td>										
									</tr>
									<tr>
										<td>
											<div class="layui-form-item" style="margin-bottom:0px">
												<div class="layui-inline">
													<label class="layui-form-label">性别：</label>
													<div class="layui-input-block">
														<input id="sex" type="text" name="title"  lay-verify="name"
														autocomplete="off" placeholder="请输入性别" class="layui-input">
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="layui-form-item" style="margin-bottom:0px">
												<div class="layui-inline">
													<label class="layui-form-label">工作年限：</label>
													<div class="layui-input-block">
														<input id="yearsOfWork" type="text" name="title"  lay-verify="name"
														autocomplete="off" placeholder="请输入工作年限" class="layui-input">
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="layui-form-item" style="margin-bottom:0px">
												<div class="layui-inline">
													<label class="layui-form-label">联系方式：</label>
													<div class="layui-input-block">
														<input id="phoneNum" type="text" name="title"  lay-verify="phone"
														autocomplete="off" placeholder="请输入电话号码" class="layui-input">
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="layui-form-item" style="margin-bottom:0px">
												<div class="layui-inline">
													<label class="layui-form-label">专业：</label>
													<div class="layui-input-block">
														<!-- <input id="majorIn" type="text" name="title"  lay-verify="name"
														autocomplete="off" placeholder="请输入维修专业" class="layui-input"> -->
														<select name="city" input id="majorIn"></select>
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
	  			<div class="layui-form-item">
			    <div class="layui-input-block">
			    <button class="layui-btn" lay-submit lay-filter="formDemo" id="submitworkinfo">立即提交</button>
			    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			    </div>
				<div class="z-col"></div>
			</div>
		</div>
	</div> 
	
	
</body>
</html>

