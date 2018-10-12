/**
 * workerOrderDetail
 */
if(statusTwo=='0'){
	$('#receive').addClass('mui-btn-danger').removeClass('mui-disabled  mui-btn-defult').removeAttr("disabled");
	$('#getBack').addClass('mui-disabled').removeClass('mui-btn-danger').attr("diabled");
	$('#completion').addClass('mui-disabled').removeClass('mui-btn-danger').attr("diabled");
	recBtn();
}else if(statusTwo=='1'){
	disRec();
}else if(statusTwo=='4'){
	$('#receive').css("display","none");
	$('#getBack').css("display","none");
	$('#completion').removeClass('mui-disabled').addClass('mui-btn-danger').removeAttr("diabled");
}else{
	$('#bottombtnbox').css('display','none');
}

function recBtn(){
	$('#receive').click(function() {
		var el = $(this);
		var date = getDate();
		$.ajax({
			url:'workerAccept',
			data:{
				orderId:orderId,
				manageId:manageId,
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
				disRec();
			},
			error:function(res){
				console.log(res);
			}
		})	
		
	});
}


function comBtn(){
	$('#completion').click(function() {
		window.location.href = "backOrComplete?orderId="+orderId+"&&manageId="+manageId+"&&statusId=2";
	});
}

function backBtn(){
	$('#getBack').click(function() {
		window.location.href = "backOrComplete?orderId="+orderId+"&&manageId="+manageId+"&&statusId=3";
	});
}

function disRec(){
	$('#receive').removeClass('mui-btn-danger').addClass('mui-disabled  mui-btn-defult').attr("disabled", true);
	$('#getBack').removeClass('mui-disabled').addClass('mui-btn-danger').removeAttr("diabled");
	$('#completion').removeClass('mui-disabled').addClass('mui-btn-danger').removeAttr("diabled");
	comBtn();		
	backBtn();
}

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