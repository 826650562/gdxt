/**
 * orderList
 */
var vm = new Vue({
	el:"#main",
	data:{
		orderArr:orderArr
	},
	methods:{
		orderDetail:function(id){
			window.location.href = basePath + "appManage/orderDetail?id="+id;
			console.log(id);
		}
	}
})