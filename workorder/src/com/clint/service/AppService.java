package com.clint.service;

import java.util.List;

public interface AppService {
	
	//获取工单列表
	 List<?> getOrderList(String id);
	 
	 //获取工单详情
	 List<?> getOrderDetailById(String id);
	 
	 //获取工人列表
	 List<?> getWorkerList();
	 
	 //获取工单一级状态是否为已派发
	 List<?> getOrderWorker(String workorder_num,String orderstatus_one);
	
	 //维修主管派单
	 void setOrderWorker(String manageId,String orderId,String time,String worker, String status);
	 
	 String getUUID();
	 
	 //获取二级状态列表
	 List<?> getStatusTwoList();
	 
	 //获取维修工人的未处理的工单
	 List<?> getWOrkerOrderList(String id,String status);
	 
	 //根据工单号获取状态表中是否有二级接单状态
	 List<?> getOrderStatusById(String orderId);
	 
	 //插入维修工状态
	 void setOrderWorkerStatus(String orderId,String manageId,String workerId,String date);
	 
	 //根据工单号获取工单状态
	 List<?> getOrderSatusDetailById(String id, String manageId);

	 //插入维修工结单退单状态
	void setOrderWorkerDetail(String orderId, String manageId, String workerId, String date, String status, String detail);

	List getStatusDetailById(String statusId);

	List<?> getOrderSatusDetailById2(String id);

	void setOrderComplete(String manageId, String orderId, String time, String worker);
}
