/**
 * addSuperVisor
 * 
 */
/*---------------------layui部分-----------------------------*/
layui.use([ 'form', 'laypage', 'element', 'jquery', 'laydate' ], function() {
	var form = layui.form;
	var laypage = layui.laypage;
	var element = layui.element,
		$ = layui.jquery;
	var laydate = layui.laydate;

});
/*---------------------layui部分-----------------------------*/

/*---------------------vue部分-----------------------------*/
var vm = new Vue({
	el : '#rightbox',
	data : {
		area : areaArr,
		phone:'',
		name:'',
		id:''
	},
	methods : {
		setVisor : function() {
			if (!$('#area').val()){
				layer.msg('请选择管辖小区！');
			}else if(!$('#name').val()){
				layer.msg('请输入主管姓名！');
			}else if(!$('input[name="sex"]:checked').val()){
				layer.msg('请选择主管性别！');
			}else if(!$('#phone').val()){
				layer.msg('请主管输入手机号！');
			}else if(!isPoneAvailable($('#phone').val())){
				layer.msg('手机号无效！');
			}else if(!vm.id){
				//document.orderForm.submit();
				$.ajax({
					url:'setVisor',
					data:{
						name:$('#name').val(),
						sex:$('input[name="sex"]:checked').val(),
						phone:$('#phone').val(),
						area:$('#area').val(),
					},
					dataType:'JSON',
					type:'POST',
					success:function(res){
						if(res.success){
							layer.msg(res.success);
						}else if(res.error){
							layer.msg(res.error);
						}
						
					},
					error:function(res){
						console.log(res);
					}
						
				})
			}else if(vm.id){
				$.ajax({
					url:'updateVisor',
					data:{
						id:vm.id,
						name:$('#name').val(),
						sex:$('input[name="sex"]:checked').val(),
						phone:$('#phone').val(),
						area:$('#area').val(),						
					},
					dataType:'JSON',
					type:'POST',
					success:function(res){
						if(res.success){
							layer.msg(res.success);
						}else if(res.error){
							layer.msg(res.error);
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

if(manageStr){
	var manageArr = JSON.parse( manageStr );
	vm.phone = manageArr[0].PHONE_NUM;
	vm.id =  manageArr[0].ID;
	vm.name =  manageArr[0].NAME;
	$(":radio[value=" +manageArr[0].SEX+ "]").attr("checked","checked");
	$("option[value=" +manageArr[0].MANAGE_AREA + "]").attr("selected","selected");
}

function isPoneAvailable(str) {
	var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
	if (!myreg.test(str)) {
		return false;
	} else {
		return true;
	}
}

/*---------------------vue部分-----------------------------*/