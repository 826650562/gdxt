$(function(){
	function showWorkerList(){
		$.ajax({
			type : "POST",
			url :  window.path+"home/showorderWorkerList",
			async : false,
			cache : false,
			contentType : "application/x-www-form-urlencoded",
			success : function(data) {
				console.log(data);
				var res = JSON.parse(data);
				$(".orderW").append('');
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
				      '<th>维修专业</th>'+
				      '<th>联系方式</th>'+
				      '<th>工作年限</th>'+
				      '<th>人员管理</th>'+
				    '</tr>'+ 
				  '</thead>'+
				  '<tbody id ="workerContent">'+
				   
				  '</tbody>'+
				'</table>';
				$(".orderW").append("<div class='layui-elem-quote'><h4>维修人员信息列表</h4></div>")
				$(".orderW"). append(html);
				for(var i =0;i<res.length;i++){
					$("#workerContent"). append( '<tr>'+
						      '<td>'+res[i].NAME+'</td>'+
						      '<td>'+res[i].SEX+'</td>'+
						      '<td>'+res[i].MAJORIN+'</td>'+
						      '<td>'+res[i].PHONE_NUM+'</td>'+
						      '<td>'+res[i].YEARSOFWORK+'</td>'+
						      '<td><button class="layui-btn layui-btn-xs">编辑</button><button class="layui-btn layui-btn-xs layui-btn-danger">删除</button></td>'+
						      '</tr>');
				}
			},
			error : function(data) {
				console.log("error:" + data.responseText);
			}
		});
	}
	showWorkerList(); //提交工单信息
})


 
