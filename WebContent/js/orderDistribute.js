/**
 * orderDistribute
 * 
 */
/*---------------------layui部分-----------------------------*/
layui.use([ 'form', 'laypage', 'element', 'jquery', 'laydate' ], function() {
	var form = layui.form;
	var laypage = layui.laypage;
	var element = layui.element,
		$ = layui.jquery;
	
	form.on('select(area)', function(data){
	  //console.log(data.value);
	  vm.area = data.value;
	  $.ajax({
			url:'getVisorList',
			data:{
				area:data.value
			},
			dataType:'JSON',
			type:'POST',
			success:function(res){
				vm.visorList =[];	
				vm.visorList = res;				
				setTimeout(function(){					
					form.render('radio');
				},0.1);				
			},
			error:function(res){
				console.log(res);
			}					
		})
	});

});
/*---------------------layui部分-----------------------------*/

/*---------------------vue部分-----------------------------*/
var vm = new Vue({
	el : '#rightbox',
	data : {
		areaList : areaArr,
		area:'',
		visorList:[]
	},
	methods : {
		paifa:function(event){
			 var id= $(".layui-form-radioed").prev('[name="visorName"]').attr("_id"); 
			 $.ajax({
			   	    type: 'POST',
			   	    url: "sendWorkOrderTomanager" ,
			   	    data: {
			   	    	workOrderId:work_id,
			   	    	managerId:id
			   	    } ,
			        success: function(r){
			        	if(r=='100010') alert("派发成功");
			        },
			   	    error: function(e){
			   	 	     alert("派发失败");
			        } 
			   	});
		}
	}
})

/*---------------------vue部分-----------------------------*/