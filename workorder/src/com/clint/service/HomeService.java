package com.clint.service;

import java.util.List;

public interface HomeService {
	
	/*提交登陆信息*/
   List confirmInfo(String username,String psw);
   
   /*提交维修工人信息*/
   boolean workerInfo(String id,String name,String sex,String yearsofwork,String phonenum,String majorin);
   
   //提交维修工人信息
   List showorderWorkerList();
   List showWorkerType();	
	//获取工单类别列表
	public  List<?> getTypeList();
	
	//获取报修渠道
	public  List<?> getWayList();
	
	//生成不含'-'的uuid
	public String getUUID();
	
	//插入工单
	public  boolean setOrder(String ordertype,String dateTime,String  orderAddress,String orderPhone,String wayType,String orderNum,String troubleDes);

	//获取小区列表
	public  List<?> getManageArea();
	
	//根据维修主管id获取维修主管信息
	public  List<?> getManageById(String id);
 
	//存储主管信息
	public  boolean  setVisor(String name,String sex,String phone,String area);
	
	//更新主管信息
	public  boolean  updateVisor(String id,String name,String sex,String phone,String area);
	
	//通过主管名字 管辖小区获取主管信息
	public  List<?>  getVisor(String name,String area);
	
	//获取维修主管列表
	List showorderManageList();
	
	List showManagerEdit(String id);
	
	public boolean managerDel(String id);
	
	//通过小区获取主管列表
	public  List<?>  getVisorList(String area);
		
 
	
	List queryBxList(String id);
	
	List queryBxListBySearch(String minxa);
	
	//获取工单的所有的状态字段
	List  queryAllGDStatus();
	
	List queryBxListByStatus(String id );
	
	List queryStatusByOrderId(String id );
 
	//根据工单号获取工单详情
	public int getOrderByOrderNum(String orderNum,String dateTime,String orderPhone);
	
	void insertWorkOrderToStatus(String workOrderId,String managerId);
}
