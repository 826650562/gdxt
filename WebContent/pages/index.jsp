<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>工单系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="<%=basePath %>js/layui/css/layui.css" media="all">
  <link href="<%=basePath %>js/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="<%=basePath %>css/admin.css" media="all">
  <link rel="stylesheet" href="<%=basePath %>css/style.css" media="all">
  
  <script>
  ///^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
  </script>
</head>
<body class="layui-layout-body">
  
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
        </ul>
        <ul class="layui-nav layui-layout-right padR15" lay-filter="layadmin-layout-right">
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
              <img src="<%=basePath %>images/head.png" class="layui-nav-img">
              <cite>ADMIN新用户</cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a lay-href="set/user/password.html">修改密码</a></dd>
              <hr>
              <dd layadmin-event="logout" style="text-align: center;"><a>退出</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
            <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo">
            <div class="z-row">
              <div class="logoimg"><img src="<%=basePath %>images/logo.png"></div>
            </div>
          </div>
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="gdlb" class="layui-nav-item">
              <a href="javascript:;"  lay-tips="工单列表" lay-direction="2">
                <i class="fa fa-home fa-fw"></i>
                <cite>工单列表</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="orderList" class="layui-this"><a lay-href="orderList"  class="layui-nav-erjinav">工单列表</a></dd>
              </dl>
            </li>
            <li data-name="user" class="layui-nav-item">
              <a href="javascript:;" lay-tips="人员管理" lay-direction="2">
                <i class="fa fa-cubes fa-fw"></i>
                <cite>人员管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd><a lay-href="<%=basePath %>/addSuperVisor/index" class="layui-nav-erjinav" >添加维修主管</a></dd>
                <dd><a lay-href="orderWorker" class="layui-nav-erjinav" >添加维修工人</a></dd>
                <dd><a lay-href="orderManageList" class="layui-nav-erjinav" >维修主管信息列表</a></dd>
                <dd><a lay-href="orderworkerList" class="layui-nav-erjinav" >维修工人信息列表</a></dd>
              </dl>
            </li>
            <li data-name="user" class="layui-nav-item">
              <a href="javascript:;" lay-tips="工单管理" lay-direction="2">
                <i class="fa fa-cubes fa-fw"></i>
                <cite>工单管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd><a lay-href="orderReg" class="layui-nav-erjinav" >工单登记</a></dd>
                <!--<dd><a href="javascript:;" class="layui-nav-erjinav" onclick="layer.tips('暂无页面', this);">工单受理</a> </dd>-->
                <dd><a href="javascript:;" class="layui-nav-erjinav" onclick="layer.tips('暂无页面', this);">工单评估</a></dd>
                <dd><a href="javascript:;" class="layui-nav-erjinav" onclick="layer.tips('暂无页面', this);">工单综合查询</a></dd>
              </dl>
            </li>
            <li data-name="user" class="layui-nav-item">
              <a href="javascript:;" lay-tips="维修报表管理" lay-direction="2" onclick="layer.tips('暂无页面', this);">
                <i class="fa fa-magnet fa-fw"></i>
                <cite>维修报表管理</cite>
              </a>
            </li>
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <!-- <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div> -->
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="orderList" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

  <script src="<%=basePath %>js/layui/layui.js"></script>
  <script>
  layui.config({
    base: '<%=basePath %>' //静态资源所在路径
  }).extend({
    index: 'js/lib/index' //主入口模块
  }).use('index');
  </script>
</body>
</html>