/**
 * backOrComplete
 */
if(status=='2'){
	$('#topbarcenter').text("申请结单");
	$('#srymarea').attr('placeholder','例如：房屋报修水管，实际存在电路问题。');
}else if(status=='3'){
	$('#topbarcenter').text("申请退单");
	$('#srymarea').attr('placeholder','例如：房屋问题修理完成，申请退单。');
}

$('#submitBtn').click(function(){
	if($('#srymarea').val().length>150){
		mui.alert("文字描述超过150字！","提示","确定",null,'div');
	}else if($('#srymarea').val().length<=150){
		var date = getDate();
		$.ajax({
			url:'setOrderWorkerStatus',
			data:{
				orderId:orderId,
				manageId:manageId,
				status:status,
				detail:$('#srymarea').val(),
				date:date
			},
			dataType:'JSON',
			type:'POST',
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