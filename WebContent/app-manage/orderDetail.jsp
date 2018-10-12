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
<script>
var statusOne = '${statusOne}';
var statusTwo = '${statusTwo}';
</script>
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
<c:forEach items= "${orderDetailArr}"   var="i"  begin="0" >
	<div class="topbar mui-bar mui-bar-nav">
		<div class="z-row">
			<div class="topbarleft" onclick="javascript:history.back();">
				<i class="fa fa-chevron-left fa-fw"></i>返回
			</div>
			<div class="z-col topbarcenter">工单列表</div>
			<div class="topbarright">
				<a href="repairProgress" class="colorRed">维修进度</a>
			</div>
		</div>
	</div>
	<div class="mui-content">		
		<div class="tablebox">
			<div class="z-row fwxxmstitle">
				<div>
					<i class="fa fa-sticky-note-o fa-fw"></i>&nbsp;
				</div>
				<div class="z-col">工单信息</div>
			</div>
			<div class="z-row fwxxms">
				<div>工单编号：</div>
				<div class="z-col"><c:out value="${i.WORKORDER_NUM}"/></div>
			</div>
			<div class="z-row fwxxms">
				<div>工单类型：</div>
				<div class="z-col"><c:out value="${i.ORDERTYPE}"/></div>
			</div>
			<div class="z-row fwxxms">
				<div>报修时间：</div>
				<div class="z-col"><c:out value="${i.USER_ALARMTIME}"/></div>
			</div>
			<!-- <div class="z-row fwxxms">
				<div>处理方式：</div>
				<div class="z-col">疏通</div>
			</div> -->
			<div class="z-row fwxxms">
				<div>故障地址：</div>
				<div class="z-col"><c:out value="${i.USER_AREA}"/></div>
			</div>
			<div class="z-row fwxxms">
				<div>故障报修来源：</div>
				<div class="z-col"><c:out value="${i.WAY}"/></div>
			</div>
			<div class="z-row fwxxms">
				<div>报修人联系电话：</div>
				<div class="z-col"><c:out value="${i.USER_PHONE}"/></div>
			</div>
			<div class="z-row fwxxms">
				<div>故障描述：</div>
				<div class="z-col"><c:out value="${i.USER_DETAIL}"/></div>
			</div>
			<c:if test="${i.STATUSTWONAME!='无状态'}">
				<div class="z-row fwxxms">
					<div>工单二级状态：</div>
					<div class="z-col"><c:out value="${i.STATUSTWONAME}"/></div>
				</div>		
			</c:if>			
			<c:if test="${i.DETAIL!='null'}">
				<div class="z-row fwxxms">
					<div>备注：</div>
					<div class="z-col"><c:out value="${i.DETAIL}"/></div>
				</div>			
			</c:if>
			<%-- <div class="z-row fwxxms">
				<div>备注：</div>
				<div class="z-col"><c:out value="${i.DETAIL}"/></div>
			</div> --%>
		</div>




		<div class="bottomblank"></div>
		<!--空div占位置-->
	</div>
	<div class="bottombtnbox" id="bottombtnbox">
		<a href="orderPayout?id=${i.WORKORDER_NUM}"  class="mui-btn mui-btn-danger xdfjbtn width100">工单派发&nbsp;<i
			class="fa fa-long-arrow-right fa-fw"></i></a>
	</div>	
	<%-- <c:choose>  
		<c:when test="${i.ORDERSTATUS_TWO=='2'}">
			<div class="bottombtnbox" id="bottombtnbox">
				<a href="orderComplete?id=${i.WORKORDER_NUM}&&workerId=${i.WORKERID}" class="mui-btn mui-btn-danger xdfjbtn width100">工单完结&nbsp;<i class="fa fa-long-arrow-right fa-fw"></i></a>
			</div>			
		</c:when>
		<c:otherwise>
			<div class="bottombtnbox" id="bottombtnbox">
			<a href="orderPayout?id=${i.WORKORDER_NUM}"  class="mui-btn mui-btn-danger xdfjbtn width100">工单派发&nbsp;<i
				class="fa fa-long-arrow-right fa-fw"></i></a>
			</div>			
		</c:otherwise>
	</c:choose> --%>  
	</c:forEach>
</body>
<script src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script>
	if(statusOne!='1'&& statusTwo!='3' && statusTwo!='2'){
		$('#bottombtnbox').css('display','none');
	}
</script>
<script src="<%=basePath%>src/vue.js"></script>
</html>