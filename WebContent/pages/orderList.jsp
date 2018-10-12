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
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"> </script>
<script type="text/javascript">
  var resList=${listOfBx}
</script>
<script type="text/javascript" src="<%=basePath%>/js/common.config.js"> </script>
<script type="text/javascript" src="<%=basePath%>/js/orderList.js"> </script>
</head>
<body>
	<div class="layui-fluid">
		<div class="sxkuang">
			<div class="z-row tiaojianbox">
				<div>
					<button class="layui-btn sxkuangbtn sxkbtn_active">全部工单</button>
				</div>
				
			   <c:forEach items= "${listOfStatus}"   var="i"  begin="0" >
				<div>
					<button _id='<c:out value="${i.ID}"/>'  class="layui-btn sxkuangbtn"><c:out value="${i.VALUE}"/></button>
				</div>
			 
			   </c:forEach>
				
				<div class="z-col"></div>
				<div class="z-col">
					<input type="text" placeholder="报修人姓名、报修电话" class="layui-input searchText">
				</div>
				<div>
					<button id="searchForlist" class="layui-btn layui-btn-danger">
						<i class="fa fa-search fa-fw"></i> 搜索
					</button>
				</div>
			</div>

			<div class="layui-col-lg12 pad15">
				<div class="layui-row layui-col-space15" id="orderListOfContent">


				</div>
			</div>
		</div>
	</div>
</body>
</html>


