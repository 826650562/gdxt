<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<title>工单系统</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=basePath %>js/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>js/mui-master/examples/hello-mui/css/mui.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>css/app/z-layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>css/app/style.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->   
</head>
<body class="loginbg">
<div class="loginbox">   
       <div class="z-row">
          <div class="z-col"> </div>
          <div class="loginlogo"><img src="<%=basePath %>images/loginlogo.png"></div>
          <div class="z-col"></div>
       </div>
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-phone fa-fw"></i>
          </div>
          <div class="z-col">
             <input type="text" placeholder="手机号码" class="zInput">
          </div>
       </div>
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-commenting fa-fw"></i>
          </div>
          <div class="z-col">
             <input type="text" placeholder="短信验证码" class="zInput">
          </div>
          <div>
             <button class="mui-btn mui-btn-success mui-btn-outlined hqyzm">获取验证码</button>
          </div>
       </div>
       <div class="z-row loginInput">
          <div class="loginInputXtb">
             <i class="fa fa-tag fa-fw"></i>
          </div>
          <div class="z-col">
             <input type="text" placeholder="请输入密码" class="zInput">
          </div>
       </div>
       <div class="z-row marT30">
          <div id="submitBtn" class="z-col">
             <button class="mui-btn mui-btn-danger width100">登录</button>
          </div>
       </div>
     </div>
</body>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$('#submitBtn').click(function(){
	window.location.href="<%=basePath%>appManage/orderList";
})
</script>
</html>