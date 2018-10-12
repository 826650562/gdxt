/**
 * workerOrderList
 */
/*----------    vue --------------*/
var orderList = JSON.parse(orderArr);
var statusList = JSON.parse(statusStr);
var vm =new Vue({
	el:'#content',
	data:{
		statusList:statusList,
		orderList:orderList
	},
	methods:{
		orderDetail:function(id,status,manageId){
			window.location.href="orderDetail?id="+id+"&&status="+status+"&&manageId="+manageId;
		},
		getOther:function(el,status){
			$('.gdlbjssxtj').removeClass('gdlbActive');
			$(el.target).addClass('gdlbActive');
			$.ajax({
				url:'orderListOther',
				data:{
					status:status
				},
				dataType:'JSON',
				type:'POST',
				success:function(res){
					vm.orderList = res.orderArr;
				},
				error:function(res){
					console.log(res);
				}
			})
		}
	}
})

/*----------    vue --------------*/