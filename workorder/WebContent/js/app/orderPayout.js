/**
 * orderPayout.js
 */
/*---     mui      ------*/
mui.init({
	swipeBack : true //启用右滑关闭功能
});
/*mui('.mui-input-group').on('change', 'input', function() {
	var value = this.checked ? "true" : "false";
	var id = this.value;
	
});*/

mui(document.body).on('click','.bottombtnbox', function(){
	var arr = [];
	//遍历复选框
	mui(".mui-input-group input").each(function () {
		if (this.checked) {
			arr.push(this.value);
		}
	});
	var checkedStr;
	if(arr.length<=0){
		mui.toast("请至少选择一位维修人员！"); 
	}else{
		checkedStr = arr.join(',');
		var date = getDate();
		mui.ajax('setWorker',{
			data:{
				orderId:orderId,
				worker:checkedStr,
				date:date
			},
			type:'POST',
			dataType:'json',
			success:function(res){
				if(res.success){
					mui.toast(res.success);
				}else if(res.error){
					mui.toast(res.error);
				}
				
			},
			error:function(res){
				console.log(res);
			}
		})
	}
	
})


/*---     mui      ------*/



var cameArr = [];
var workerCame = [];

workerArr.map(function(item){
	var came = pinyin.getCamelChars(item.NAME.substring(0,1));
	var _index = cameArr.indexOf(came);
	if(_index<0){
		cameArr.push(came);
		var obj = {};
		obj[came] = [item];
		workerCame.push(obj);
	}else{			
		workerCame[_index][came].push(item);
	}
});
function getDate(){
	var date = new Date();
	var year = date.getFullYear();
	var month = (date.getMonth() + 1>=10?(date.getMonth() + 1):'0'+(date.getMonth() + 1));
    var strDate = (date.getDate()>=10?date.getDate():'0'+(date.getDate()));
    
    var hour = date.getHours();
    var min = (date.getMinutes()>=10?date.getMinutes():'0'+date.getMinutes());
    var sec = (date.getSeconds()>=10?date.getSeconds():'0'+date.getSeconds());
    
    var dateFull = year + '-' +month + '-' + strDate + ' ' +hour + ':' + min +':' + sec;
	return dateFull;
}

/*---     vue      ------*/

var vm = new Vue({
	el:'#content',
	data:{
		workerList:workerCame
	}
})

/*---     vue      ------*/
	