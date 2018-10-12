package com.clint.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.clint.service.AppService;
import com.clint.service.MapService;


@Service(value="appService")
public class AppServiceImpl implements AppService {

	@Resource
	private MapService mapService;

	//生成uuid
	@Override
	public String getUUID() {
		// TODO Auto-generated method stub
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");	
		return uuid;
	}
	@Override
	//获取工单列表
	public List getOrderList(String id) {
		// TODO Auto-generated method stub
		String orderListString = "SELECT *  FROM ("+
"SELECT ROW_NUMBER () OVER (PARTITION BY s.workorder_num ORDER BY s.DATETIME DESC ) rn,"+
	"s.workorder_num num, s.DATETIME, s.ORDERSTATUS_ONE, s.ORDERSTATUS_TWO, d.VALUE valueone, t.TYPENAME,s.repsupervisorId visor "+
"FROM T_WORKORDER_STATUS s, T_WORKORDER_STATUSDIC d, T_WORKORDER_ORDERINFO o, T_WORKORDER_ORDERTYPE t "+
"WHERE s.REPSUPERVISORID = '"+ id +"'  AND d.id = s.ORDERSTATUS_ONE  AND s.WORKORDER_NUM = o.WORKORDER_NUM  AND o.USER_ORDERTYPE = t.ID ) a WHERE a.rn =1";
		List res = this.mapService.getListBySql(orderListString);
		return res;
	}
	
	//获取工单详情
	public List getOrderDetailById(String id) {
		// TODO Auto-generated method stub
		//String orderDetailString = "select o.*,t.TYPENAME ordertype,W.WAYNAME way from T_WORKORDER_ORDERINFO o,T_WORKORDER_ORDERTYPE t,T_WORKORDER_WAYTYPE W where o.USER_ORDERTYPE = t.ID AND o.USER_ORDERWAY = w.ID AND o.workorder_num='"+ id +"'";
		String orderDetailString = "SELECT * from (select o.*,t.TYPENAME ordertype,W.WAYNAME way,d.value statusOnename,d2.value statustwoname,s.datetime as datenew,s.orderstatus_one,s.orderstatus_two,s.detail,s.workerid from T_WORKORDER_ORDERINFO o,T_WORKORDER_ORDERTYPE t,T_WORKORDER_WAYTYPE W,t_workorder_statusdic d,t_workorder_statusdic2 d2,t_workorder_status s where o.USER_ORDERTYPE = t.ID AND o.USER_ORDERWAY = w.ID AND o.workorder_num='"+id+"' and s.orderstatus_one=d.id and s.orderstatus_two=d2.id and s.workorder_num=o.workorder_num order by datenew desc) where rownum=1";		
		List res = this.mapService.getListBySql(orderDetailString);
		return res;
	}
	
	//获取维修工人列表
	public List getWorkerList(){
		String workerSql = "select r.name,r.id,o.typename type from t_workorder_repworker r,t_workorder_ordertype o where r.majorin = o.id";
		List res = this.mapService.getListBySql(workerSql);
		return res;
	}
	
	//获取工单一级状态为已派发
	@Override
	public List getOrderWorker(String workorder_num,String orderstatus_one) {
		String sql = "select * from (select * from t_workorder_status where workorder_num='"+ workorder_num +"' order by datetime desc) where rownum=1 and orderstatus_one='2'";
		List i = this.mapService.getListBySql(sql);
		return i;
	}
	
	//维修主管派单
	@Override
	public void setOrderWorker(String manageId,String orderId,String time,String worker, String status) {
		String uuid = this.getUUID();
		String sql = "insert into t_workorder_status(id,workorder_num,datetime,orderstatus_one,orderstatus_two,repsupervisorid,workerid) values('"+ uuid +"','"+ orderId +"','"+ time +"','"+ status +"','0','"+ manageId +"','"+ worker+ "')";
		this.mapService.execute(sql);
	}
	
	//维修主管结单
	@Override
	public void setOrderComplete(String manageId,String orderId,String time,String worker) {
		String uuid = this.getUUID();
		String sql = "insert into t_workorder_status(id,workorder_num,datetime,orderstatus_one,orderstatus_two,repsupervisorid,workerid) values('"+ uuid +"','"+ orderId +"','"+ time +"','4','4','"+ manageId +"','"+ worker+ "')";
		this.mapService.execute(sql);
	}
	
	//获取维修工人的未处理的工单
	public List<?> getWOrkerOrderList(String id,String status) {
		String sql = "SELECT *  FROM ("+
				"SELECT ROW_NUMBER () OVER (PARTITION BY s.workorder_num ORDER BY s.DATETIME DESC ) rn,"+
				"s.workorder_num num, s.DATETIME, s.ORDERSTATUS_ONE, s.ORDERSTATUS_TWO, d.VALUE valueTwo, t.TYPENAME,s.repsupervisorId visor,s.workerid "+
			"FROM T_WORKORDER_STATUS s, T_WORKORDER_STATUSDIC2 d, T_WORKORDER_ORDERINFO o, T_WORKORDER_ORDERTYPE t "+
			"WHERE s.workerid = '"+ id +"'  AND d.id = s.ORDERSTATUS_TWO  AND s.WORKORDER_NUM = o.WORKORDER_NUM  AND o.USER_ORDERTYPE = t.ID ) a WHERE a.rn =1 and a.orderstatus_two='"+ status +"'";
		List res  = this.mapService.getListBySql(sql);		
		return res;
	}
	
	//获取二级状态字典表
	@Override
	public List<?> getStatusTwoList() {
		String sql = "select * from t_workorder_statusdic2 where id!='10' order by id";
		List res = this.mapService.getListBySql(sql);
		return res;
	}
	
	//根据工单id查工单状态表 是否存在存在二级状态为接单的数据
	@Override
	public List<?> getOrderStatusById(String orderId) {
		String sql = "select * from (select * from t_workorder_status where workorder_num='"+ orderId +"' and orderstatus_two='1' order by datetime desc) where rownum=1";
		List<?> res = this.mapService.getListBySql(sql);
		return res;
	}
	
	//插入维修工状态
	@Override
	public void setOrderWorkerStatus(String orderId, String manageId, String workerId,String date) {
		String uuid = this.getUUID();
		String sql = "insert into t_workorder_status(id,workorder_num,datetime,orderstatus_one,repsupervisorid,orderstatus_two,workerid) values('"+ uuid +"','"+ orderId +"','"+ date +"','3','"+ manageId +"','1','"+ workerId +"')";
		this.mapService.execute(sql);		
	}
	
	//获取工单最新状态
	@Override
	public List<?> getOrderSatusDetailById(String id,String workerId) {
		String sql = "select * from (select * from t_workorder_status where workorder_num='"+ id +"' and  (workerid is null or workerid='"+ workerId +"') order by datetime desc) where rownum=1";
		List res = this.mapService.getListBySql(sql);
		return res;
	}
	
	//获取工单最新状态
	@Override
	public List<?> getOrderSatusDetailById2(String id) {
		String sql = "select *  from (select q.id,q.WORKORDER_NUM,r.VALUE as statustwo,t.VALUE as statusone,q.DETAIL,q.DATETIME    from t_workorder_status q    join  T_WORKORDER_STATUSDIC t on q.ORDERSTATUS_ONE=t.ID  join  T_WORKORDER_STATUSDIC2 r on r.id =q.ORDERSTATUS_TWO where  workorder_num='"+id+"'   order by datetime desc)  where rownum=1";
		List res = this.mapService.getListBySql(sql);
		return res;
	}
		
	
	
	//插入维修工结单退单状态
	@Override
	public void setOrderWorkerDetail(String orderId, String manageId, String workerId, String date, String status,
			String detail) {
		String uuid = this.getUUID();
		String sql = "insert into t_workorder_status(id,workorder_num,datetime,orderstatus_one,repsupervisorid,orderstatus_two,workerid,detail) values('"+ uuid +"','"+ orderId +"','"+ date +"','3','"+ manageId +"','"+ status +"','"+ workerId +"','"+ detail +"')";
		this.mapService.execute(sql);
	}
	
	//通过二级状态id获取状态value
	@Override
	public List getStatusDetailById(String statusId) {
		String sql = "select * from t_workorder_statusdic2 where id='"+ statusId +"'";
		List res = this.mapService.getListBySql(sql); 
		return res;
	}
}
