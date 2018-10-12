$(function(){
	function showManagerList(){
		$.ajax({
			type : "POST",
			url :  window.path+"home/showorderManageList",
			async : false,
			cache : false,
			contentType : "application/x-www-form-urlencoded",
			success : function(data) {
				var res = JSON.parse(data);
				$(".orderM"). append('');
				var html = '<table class="layui-table">'+
				 '<colgroup>'+
				    '<col width="150">'+
				    '<col width="200">'+
				    '<col>'+
				  '</colgroup>'+
				  '<thead>'+
				     '<tr>'+
				      '<th>姓名</th>'+
				      '<th>性别</th>'+
				      '<th>管理小区</th>'+
				      '<th>联系方式</th>'+
				      '<th>人员管理</th>'+
				    '</tr>'+ 
				  '</thead>'+
				  '<tbody id="managerContent">'+
				    
				  '</tbody>'+
				'</table>';
				$(".orderM").append("<div class='layui-elem-quote'><h4>维修主管信息列表</h4></div>");
				$(".orderM"). append(html);
				for(var i =0;i<res.length;i++){
					$('#managerContent').append('<tr>'+
				      '<td>'+res[i].NAME+'</td>'+
				      '<td>'+res[i].SEX+'</td>'+
				      '<td>'+res[i].MANAGE_AREA+'</td>'+
				      '<td>'+res[i].PHONE_NUM+'</td>'+
				      '<td><button class="layui-btn layui-btn-xs" id="ManagerEdit" data-editId='+res[i].ID+'>编辑</button><button class="layui-btn layui-btn-xs layui-btn-danger data-delId='+res[i].ID+'" id="manaegerDel">删除</button></td>'+
				     '</tr>');
				}
			    //点击执行编辑事件
				editClick();
				
			},
			error : function(data) {
				console.log("error:" + data.responseText);
			}
		});
	}
	
	function editClick(){
		$('#ManagerEdit').unbind().click(function(){
			var id = $(this).attr('data-editId');
			window.location.href="../addSuperVisor/index?id="+id;
			/*$.ajax({
				type : "POST",
				url :  window.path+"home/showmanagerEdit",
				async : false,
				cache : false,
				data : {
					_id : id
				},
				contentType : "application/x-www-form-urlencoded",
				success:function(res){		
					var data = JSON.parse(res);
					for(var i=0;i<data.length;i++){
						
					}
						

				},
				error:function(){
					console.log("登陆失败");
				}	
			});*/

		})
		$('#manaegerDel').unbind().click(function(){
			var id = $(this).attr('data-delId');
			$.ajax({
			type : "POST",
			url :  window.path+"home/showmanagerEdit",
			async : false,
			cache : false,
			data : {
				_id : id
			},
			contentType : "application/x-www-form-urlencoded",
			success:function(res){		
				console.log*(res);
			},
			error:function(){
				console.log("登陆失败");
			}	
			});
		})
		
	}
	showManagerList(); //提交工单信息
})


 
