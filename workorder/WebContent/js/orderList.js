/*
 * 工单列表主功能
 * 王新亮
 */
$(function(){
	
var orderList = function() {}
orderList.prototype = {
	updateList : function(res) {
		//更新div列表
		var that=this;
		if (res.length <= 0) {
			$("#orderListOfContent").html("");
			return;	
		}
		var html='';
		res.map(function(item) {
			html+=that.fillListHtml(item);
		});
		$("#orderListOfContent").html("").html(html);

	},
	fillListHtml:function(item){
	  //填充div列表
	 return '<div class="layui-col-md3 layui-col-lg3">'+
		'<div class="layui-card">'+
		'<div class="newsc"> <img src="http://localhost:8080/workorder/images/new.png" width="32" height="32">'+
		'</div> <div class="layui-card-header"> <div class="z-row"> <div>工单编号：</div>'+
	    '<div class="z-col">'+item.WORKORDER_NUM+'</div> <div>'+
		'<a href="orderDetail?id='+item.ID+'" class="xxcl"><i class="fa fa-eye fa-f2"></i>&nbsp;工单详情</a> </div> </div> </div>'+
		'<div class="layui-card-body"><div class="layui-carousel layadmin-carousel layadmin-shortcut">'+
		 '<div class="z-row"> <div>报修人：</div> <div class="z-col">'+item.USER+'</div>'+
		 '</div> <div class="z-row"> <div>报修电话：</div> <div class="z-col">'+item.USER_PHONE +'</div> </div>'+
		 '<div class="z-row"> <div>报修时间：</div> <div class="z-col">'+item.USER_ALARMTIME+'</div> </div> </div> </div> </div> </div>';
	},
	searchForList:function(t){
		//通过搜索 获取列表
		var that=this;
		var data={
			 'minxAttribute':t
		};
	    this.ajaxForcontent("searchOfContent",data,function(res){
	    	that.updateList(JSON.parse(res));
	    },function(){});
	},
	updateListByStatus:function(_id){
		var that=this;
		 this.ajaxForcontent("searchOfContentByStatus",{_id:_id},function(res){
		     that.updateList(JSON.parse(res));
			 //console.info(res);
		    },function(){});
	},
	ajaxForcontent:function(url,data,sfn,efn){
		 $.ajax({
		   	    type: 'POST',
		   	    url: url ,
		   	    data: data ,
		        success: function(r){
		        	if(typeof  sfn=='function')sfn(r);
		        },
		   	    error: function(e){
		        	if(typeof  efn=='function')efn(e);
		        } 
		   	});
	}
}


var  control=new orderList();
control.updateList(resList);

$("#searchForlist").unbind().click(function(){
	//触发搜索按钮
	var searchText=$.trim($(".searchText").val());
	if(searchText.length<=0) return ;
	control.searchForList(searchText);
});

$(".sxkuangbtn").each(function(index,item){
	$(item).click(function(){
		$(".sxkuangbtn").removeClass("sxkbtn_active");
		$(this).addClass("sxkbtn_active");
		var _id=$(this).attr("_id");
		control.updateListByStatus(_id);
	});
});




})