<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>工单系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="<%=basePath %>js/bootstrap/css/bootstrap.css" media="all">
  <link rel="stylesheet" href="<%=basePath %>js/layui/css/layui.css" media="all">
  <link href="<%=basePath %>js/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="<%=basePath %>css/style.css" media="all">
  <link rel="stylesheet" href="<%=basePath %>css/admin.css" media="all">
</head>
<body>
  
<div class="layui-fluid">
     
<c:forEach items= "${bxListJson}"   var="i"  begin="0" >
<div class="shadowbox">
<div class="row">
  <div class="col-lg-12 shadowboxtitle">
      <div class="z-row">
        <div class="z-col">工单详情</div>
        <div>
           <a href='orderDistribute?work_id=<c:out value="${i.WORKORDER_NUM}"/>' class="layui-btn layui-btn-sm gdpfbtn">工单派发</a>
        </div>
      </div>
  </div>
  
</div>
<div class="row">
  <div class="col-lg-12">
    <table class="layui-table mar0">
    <colgroup>
      <col>
      <col>
      <col>
    </colgroup>
    
    <tbody>
    

      <tr>
        <td>
          <div class="z-row">
            <div>工单类型：</div>
            <div class="z-col color333"><c:out value="${i.ORDERTYPE}"/> 
            </div>
          </div>
        </td>
        <td>
          <div class="z-row">
            <div>报修时间：</div>
            <div class="z-col color333"><c:out value="${i.USER_ALARMTIME}"/></div>
          </div>
        </td>
        <td>
          <div class="z-row">
            <div>保修渠道：</div>
            <div class="z-col color333"><c:out value="${i.WAY}"/></div>
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <div class="z-row">
            <div>故障地址：</div>
            <div class="z-col color333"><c:out value="${i.USER_AREA}"/></div>
          </div>
        </td>
        <%-- <td>
          <div class="z-row">
            <div>故障报修来源：</div>
            <div class="z-col color333"><c:out value="${i.USER_ORDERWAY}"/></div>
          </div>
        </td> --%>
        <td>
          <div class="z-row">
            <div>报修人联系电话：</div>
            <div class="z-col color333"><c:out value="${i.USER_PHONE}"/></div>
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <div class="z-row">
            <div>故障描述：</div>
            <div class="z-col color333"><c:out value="${i.USER_DETAIL}"/></div>
          </div>
        </td>
      </tr>
      </c:forEach>
      
      
      
    </tbody>
  </table>
  </div>
</div>
</div>  

<div class="shadowbox">
<div class="row">
  <div class="col-lg-12 shadowboxtitle">
      <div class="z-row">
        <div class="z-col">工单流程</div>
        <div>
         <a href="orderDistribute" class="layui-btn layui-btn-danger layui-btn-sm gdpfbtn">完成工单</a>
        </div>
      </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-12">

  <ul class="layui-timeline">
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title"><strong class="colorGreen">工单接单</strong></h3>
      <p>
        2018-04-21  17：99：34
        <br>接单派发：维修主管（工号：104）
      </p>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title"><strong class="colorRed">工单回退</strong></h3>
      <p>2018-04-21  17：99：34<br>
      回退对象：维修主管（工号：104）<br/>
回退理由：电线漏电是由于旁边的排水管漏水导致
，请派维修排水管道的技师协助处理。
      </p>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title"><strong class="colorGreen">工单接单</strong></h3>
      <p>
        2018-04-21  17：99：34
        <br>接单人：技工（孙科）
      </p>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title"><strong class="colorYellow">工单派发</strong></h3>
      <p>
        2018-04-21  17：99：34
        <br>派法人：维修主管（工号：104）<br>
派发对象：技工（孙科）
      </p>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title"><strong class="colorGreen">工单接单</strong></h3>
      <p>
        2018-04-21  17：99：34
        <br>接单派发：维修主管（工号：104）
      </p>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title"><strong class="colorYellow">工单派发</strong></h3>
      <p>
        2018-04-21  17：99：34
        <br>工单派发：值班员（工号：001）<br>
派发对象：维修主管（工号：104）
      </p>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title"><strong class="colorGreen">工单生成</strong></h3>
      <p>
        2018-04-21  17：99：34
        <br>工单生成：值班员（工号：001）<br>
工单编号：GD20180421-867<br>
工单类型：弱电系统<br>
报修时间：2018-04-21  17：99：34<br>
处理方式：立即<br>
设备名称：路灯<br>
设备编号：LD079<br>
故障类型：损坏<br>
故障详细地址：保障房02（东区）2#东侧<br>
紧急程度：高<br>
备注说明：路灯被认为损坏
      </p>
    </div>
  </li>
  
</ul>  
  </div>
</div>
 </div>

</div>
<script type="text/javascript" src="<%=basePath %>js/layui/layui.js"></script>
<script>
layui.use('element', function(){
  var element = layui.element;
});
</script>



</body>
</html>
