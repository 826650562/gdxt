/**
 * orderList
 */
var vm = new Vue({
	el:"#main",
	data:{
		orderArr:orderArr
	},
	methods:{
		orderDetail:function(id,orderStatus,statusTwo){
			window.location.href = basePath + "appManage/orderDetail?id="+id;
		}
	}
})