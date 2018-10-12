/**
 * orderReg页面
 * 
 */
/*---------------------layui部分-----------------------------*/
layui.use([ 'form', 'laypage', 'element', 'jquery', 'laydate' ], function() {
	var form = layui.form;
	var laypage = layui.laypage;
	var element = layui.element,
		$ = layui.jquery;
	var laydate = layui.laydate;

	//总页数大于页码总数
	laypage.render({
		elem : 'demo1',
		count : 70, //数据总数
		jump : function(obj) {
			console.log(obj)
		}
	});


	//日期
	//日期时间选择器
	laydate.render({
		elem : '#orderTime',
		type : 'datetime',
		done : function(value, date, endDate) {
			vm.dateTime = value;
		//        console.log(value); //得到日期生成的值，如：2017-08-18
		//        console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
		//        console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
		},
		trigger: 'click',
		value: new Date(),
		showBottom: true,
		zIndex: 9999
	
	});
});
/*---------------------layui部分-----------------------------*/

/*---------------------vue部分-----------------------------*/
var vm = new Vue({
	el : '#rightbox',
	data : {
		orderType : orderType,
		wayType : wayType,
		orderNum : '',
		dateTime : ''
	},
	methods : {
		getOrderNum : function() {
			$.ajax({
				url : 'getOrderNumber',
				type : 'POST',
				dataType : 'JSON',
				success : function(res) {
					vm.orderNum = res.orderNum;
				},
				error : function(res) {
					console.log(res);
				}
			})
		},
		sendOrder : function() {
			if (!$('#ordertype').val()){
				layer.msg('请选择报修类型！');
			}else if(!vm.dateTime){
				layer.msg('请选择保修时间！');
			}else if(!$('#orderAddress').val()){
				layer.msg('请输入报修地址！');
			}else if(!$('#orderPhone').val()){
				layer.msg('请输入描述！');
			}else if(!$('#wayType').val()){
				layer.msg('请选择报修渠道！');
			}else if(!$('#orderNum').val()){
				layer.msg('请获取工单编号！');
			}else if(!$('#troubleDes').val()) {
				layer.msg('请输入描述！');
			}else if(!isPoneAvailable($('#orderPhone').val())){
				layer.msg('手机号无效！');
			}else{
				//document.orderForm.submit();
				$.ajax({
					url:'sendOrder',
					data:{
						ordertype:$('#ordertype').val(),
						dateTime:vm.dateTime,
						orderAddress:$('#orderAddress').val(),
						orderPhone:$('#orderPhone').val(),
						wayType:$('#wayType').val(),
						orderNum:vm.orderNum,
						troubleDes:$('#troubleDes').val()
					},
					dataType:'JSON',
					type:'POST',
					success:function(res){
						if(res.success){
							layer.msg(res.success);
						}else if(res.has){
							layer.msg(res.has);
						}
						
					},
					error:function(res){
						console.log(res);
					}
						
				})
			}
		}
	}
})

function isPoneAvailable(str) {
	var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
	if (!myreg.test(str)) {
		return false;
	} else {
		return true;
	}
}

/*---------------------vue部分-----------------------------*/