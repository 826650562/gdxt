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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>工单系统</title>
<!--<link rel="icon" href="images/ico.png" type="image/x-icon">-->
<!--<link href="layui/css/layui.css" rel="stylesheet" type="text/css">-->
<link href="<%=basePath %>js/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>js/mui-master/examples/hello-mui/css/mui.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>css/app/z-layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>css/app/workerStyle.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->   
    <style type="text/css">
      html,body{ height:100%; position:relative;}
	  .mui-table-view-cell{padding:0px;}
	  .mui-table-view-cell:after{ background:none;}
    </style>
</head>
<body>

<div class="topbar mui-bar mui-bar-nav">
 <div class="z-row">
    <div class="topbarleft"  onclick="javascript:history.back();"><i class="fa fa-chevron-left fa-fw"></i>返回</div>
    <div class="z-col topbarcenter">工单列表</div>
    <div class="topbarright"></div>
 </div>
</div>

<div class="mui-content" id="content"> 

 <div class="gdlbsx">
   <div class="z-row">
     <div class="z-col pad5"  v-for="(i,index) in statusList"><div class="gdlbjssxtj mui-table-view-cell" :class="{gdlbActive:i.ID=='0'}" @click="getOther($event,i.ID)">{{i.VALUE}}</div></div>
     <!-- <div class="z-col pad5"><div class="gdlbjssxtj mui-table-view-cell gdlbActive"  @click="getOther($event,'0')">最新</div></div>
     <div class="z-col pad5"><div class="gdlbjssxtj mui-table-view-cell">已退单</div></div>
     <div class="z-col pad5"><div class="gdlbjssxtj mui-table-view-cell">已结单</div></div> -->
   </div>
 </div>


 <div class="bsgditembox" v-for="i in orderList">  
  <div class="bsgdbitemnew"><img src="<%=basePath %>images/new.png"></div>
  <div class="z-row bsgdbh">
    <div>工单编号：</div>
    <div class="z-col">{{i.NUM}}</div>
    <div><a href="JavaScript:;" @click="orderDetail(i.NUM,i.ORDERSTATUS_TWO,i.VISOR)"><i class="fa fa-eye fa-f2"></i>&nbsp;工单详情</a></div>
  </div>
  <div class="z-row fwxxms">
    <div>工单类型：</div><div class="z-col">{{i.TYPENAME}}</div>
  </div>
  <div class="z-row fwxxms">
    <div>报修时间：</div><div class="z-col">{{i.DATETIME}}</div>
  </div>
  <div class="z-row fwxxms">
    <div>工单状态：</div><div class="z-col">{{i.VALUETWO}}</div>
  </div>
</div>
  
 
<div class="bsgditembox" v-show="orderList.length==0">  
  <div>暂无数据</div>
</div>

<!--  <div class="bsgditembox">  
  <div class="z-row bsgdbh">
    <div>工单编号：</div>
    <div class="z-col">GD_PSXT_20180923</div>
    <div><a href="orderDetail"><i class="fa fa-eye fa-f2"></i>&nbsp;工单详情</a></div>
  </div>
  <div class="z-row fwxxms">
    <div>工单类型：</div><div class="z-col">给排水</div>
  </div>
  <div class="z-row fwxxms">
    <div>报修时间：</div><div class="z-col">2018-09-28 16:43:03</div>
  </div>
  <div class="z-row fwxxms">
    <div>故障类型：</div><div class="z-col">损坏</div>
  </div>
</div> -->



</div>  
</body>
<script>
	var orderArr = '${orderArr}';
	var statusStr = '${statusArr}'
</script>
<script src="<%=basePath %>js/mui-master/examples/hello-mui/js/mui.js"></script>
<script src="<%=basePath %>js/jquery-1.11.0.min.js"></script>
<script src="<%=basePath %>src/vue.js"></script>
<script src="<%=basePath %>js/app/workerOrderList.js"></script>

</html>