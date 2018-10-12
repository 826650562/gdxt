//$(function(){
//	function submitWorkinfo(){
//		$('#submitworkinfo').click(function(){
//			var name = $('#name').val();
//			var sex = $('input[name="sex"]:checked').val();
//			var yearsOfWork = $('#yearsOfWork').val();
//			var majorIn = $('#majorIn').val();
//			var phoneNum = $('#phoneNum').val();
//			$.ajax({
//				type : "POST",
//				url :  window.path+"workerInfomation/workerInfo",
//				async : false,
//				cache : false,
//				data : {
//					_name : name,
//					_sex : sex,
//					_yearsOfWork : yearsOfWork,
//					_majorIn : majorIn,
//					_phoneNum :　phoneNum
//				},
//				contentType : "application/x-www-form-urlencoded",
//				success:function(res){
//						alert("填表成功");	
//				},
//				error:function(res){
//						alert("填表失败");
//				}	
//			});
//		})
//	}
//	submitWorkinfo(); //提交工单信息
//})
layui.use([ 'form', 'laypage', 'element', 'jquery', 'laydate' ], function() {
	var form = layui.form;
	var laypage = layui.laypage;
	var element = layui.element,
		$ = layui.jquery;
	var laydate = layui.laydate;

});

$(function(){
	function submitWorkinfo(){
		$.ajax({
			type : "POST",
			url :  window.path+"home/showWorkerType",
			async : false,
			cache : false,
			contentType : "application/x-www-form-urlencoded",
			success : function(data) {
				console.log(data);
				var res = JSON.parse(data);
				$('#majorIn').append('');
				for(var i=0;i<res.length;i++){
					var html = '<option value='+res[i].ID+'>'+res[i].TYPENAME+'</option>';
					$('#majorIn').append(html);
				}
			},
			error : function(data) {
				console.log("error:" + data.responseText);
			}
		});
		$('#submitworkinfo').click(function(){
            if (!$('#name').val()){
				layer.msg('请填写维修工人姓名！');
			}else if(!$('#sex').val()){
				layer.msg('请填写维修人员性别！');
			}else if(!$('#yearsOfWork').val()){
				layer.msg('请输入维修人员工作年限！');
			}else if(!$('#majorIn').val()){
				layer.msg('请输入维修人员专业！');
			}else if(!isPoneAvailable($('#phoneNum').val())){
				layer.msg('手机号无效！');
			}else{
                var name = $('#name').val();
                var sex = $('#sex').val();
                var yearsOfWork = $('#yearsOfWork').val();
                var majorIn = $('#majorIn option:selected').attr("value");
                var phoneNum = $('#phoneNum').val();
                $.ajax({
                    type : "POST",
                    url :  window.path+"workerInfomation/workerInfo",
                    async : false,
                    cache : false,
                    data : {
                        _name : name,
                        _sex : sex,
                        _yearsOfWork : yearsOfWork,
                        _phoneNum :　phoneNum,
                        _majorIn : majorIn
                    },
                    contentType : "application/x-www-form-urlencoded",
                    success:function(res){
                    	layer.msg("填表成功");	
                    },
                    error:function(res){
                    	layer.msg("填表失败");
                    }	
                });
            }
			
		})
    }
    
    function isPoneAvailable(str) {
        var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test(str)) {
            return false;
        } else {
            return true;
        }
    }
	submitWorkinfo(); //提交工单信息
})


 



 
