package com.clint.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.clint.service.HomeService;
import com.clint.service.MapService;

@Service(value = "homeService")
public class HomeServiceImpl implements HomeService {

	@Resource
	private MapService mapService;

	@Override

	public List confirmInfo(String username, String psw) {
		// TODO Auto-generated method stub
		String loginsql = "select * from T_WORKORDER_ADMIN t where t.LOGINNAME = '" + username + "' and t.PASSWORD = '"
				+ psw + "'";
		List res = this.mapService.getListBySql(loginsql);
		return res;
	}

	public boolean workerInfo(String id, String name, String sex, String yearsofwork, String phonenum, String majorin) {
		// TODO Auto-generated method stub
		String Info = "insert into T_WORKORDER_REPWORKER(ID,NAME,SEX,YEARSOFWORK,PHONE_NUM,MAJORIN) values('" + id
				+ "','" + name + "','" + sex + "','" + yearsofwork + "','" + phonenum + "','" + majorin + "')";
		this.mapService.execute(Info);
		return true;
	}

	@Override
	public List queryBxList(String id) {
		// TODO Auto-generated method stub
		if (id.endsWith("null") || StringUtils.isEmpty(id)) {
			return mapService.getListBySql("select * from T_WORKORDER_ORDERINFO");
		} else {
			return mapService.getListBySql(
					"select o.*,t.TYPENAME ordertype,W.WAYNAME way from T_WORKORDER_ORDERINFO o,T_WORKORDER_ORDERTYPE t,T_WORKORDER_WAYTYPE W WHERE o.id='"
							+ id + "' and o.user_orderway=w.id and o.user_ordertype=t.id");
		}
	}

	@Override
	public List queryBxListBySearch(String minxa) {
		// TODO Auto-generated method stub
		if (minxa.endsWith("null")) {
			return null;
		}
		String sql = "select * from T_WORKORDER_ORDERINFO t where t.USER_ like '%" + minxa
				+ "%' or t.USER_PHONE like '%" + minxa + "%'";
		List listRes = mapService.getListBySql(sql);
		if (listRes.size() > 0)
			return listRes;
		else
			return null;
	}

	@Override
	public List queryAllGDStatus() {
		// TODO Auto-generated method stub
		// 获取所有的一级工单状态
		return mapService.getListBySql("select * from T_WORKORDER_STATUSDIC");
	}

	// 获取工单类型列表
	@Override
	public List<?> getTypeList() {
		// TODO Auto-generated method stub
		String sql = "select * from t_workorder_ordertype";
		List<?> typeList = this.mapService.getListBySql(sql);

		return typeList;
	}

	// 获取工单类型列表
	@Override
	public List<?> getWayList() {
		// TODO Auto-generated method stub
		String sql = "select * from t_workorder_waytype";
		List<?> wayList = this.mapService.getListBySql(sql);
		return wayList;
	}

	// 生成uuid
	@Override
	public String getUUID() {
		// TODO Auto-generated method stub
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		return uuid;
	}

	// 获取维修主管信息
	public List<?> getManageById(String id) {
		String sql = "select * from t_workorder_repsupervisor where id='" + id + "'";
		List res = this.mapService.getListBySql(sql);
		return res;
	}

	// 存储工单
	@Override
	public boolean setOrder(String ordertype, String alarmtime, String area, String phone, String orderway,
			String orderNum, String detail) {
		// 插入工单
		String id = this.getUUID();
		String sql = "insert all into t_workorder_orderinfo(id,workorder_num,user_orderway,user_alarmtime,user_area,user_ordertype,user_detail,user_phone)"
				+ " values ('" + id + "','" + orderNum + "','" + orderway + "','" + alarmtime + "','" + area + "','"
				+ ordertype + "','" + detail + "','" + phone + "') SELECT 1 FROM DUAL";
		this.mapService.execute(sql);

		// 插入状态数据
		String id2 = this.getUUID();
		String sql2 = "insert all into t_workorder_status(id,WORKORDER_NUM,DATETIME,ORDERSTATUS_ONE) values('" + id2
				+ "','" + orderNum + "','" + alarmtime + "','0')  SELECT 1 FROM DUAL";
		this.mapService.execute(sql2);

		return true;
	}

	// 根据工单号查询数据
	@Override
	public int getOrderByOrderNum(String orderNum, String dateTime, String orderPhone) {

		String sql = "select * from t_workorder_orderinfo where workorder_num='" + orderNum + "' and user_alarmtime='"
				+ dateTime + "' and user_phone='" + orderPhone + "'";
		List<?> list = this.mapService.getListBySql(sql);

		return list.size();
	}

	@Override
	public List queryBxListByStatus(String id) {
		// TODO Auto-generated method stub
		String sql = "";
		if (id.endsWith("null")) {
			sql = "select * from T_WORKORDER_ORDERINFO y  ";
		} else {
			sql = "SELECT *  FROM ( SELECT ROW_NUMBER ( ) OVER ( PARTITION BY s.workorder_num ORDER BY s.DATETIME DESC ) rn, s.workorder_num, s.DATETIME,o.id,o.user_phone,o.user_alarmtime,s.orderstatus_one"
					+ " FROM T_WORKORDER_STATUS s, T_WORKORDER_STATUSDIC d,T_WORKORDER_STATUSDIC2 n,T_WORKORDER_ORDERINFO o,T_WORKORDER_ORDERTYPE t "
					+ "WHERE d.id = s.ORDERSTATUS_ONE and n.id=s.orderstatus_two AND s.WORKORDER_NUM = o.WORKORDER_NUM  AND o.USER_ORDERTYPE = t.ID  ) a WHERE a.rn =1 and a.ORDERSTATUS_ONE='"+id+"'";
		}
		List<?> list = this.mapService.getListBySql(sql);
		return list;
	}

	@Override
	public List queryStatusByOrderId(String id) {

		String sql = "select * from   T_WORKORDER_STATUS t  join T_WORKORDER_STATUSDIC y on t.ORDERSTATUS_ONE=y.ID   where t.WORKORDER_NUM='"
				+ id + "'";
		List<?> list = this.mapService.getListBySql(sql);
		return list;
	}

	@Override
	public List getManageArea() {

		String sql = "select * from t_workorder_area";
		List<?> list = this.mapService.getListBySql(sql);

		return list;
	}

	// 插入主管数据
	@Override
	public boolean setVisor(String name, String sex, String phone, String area) {

		String id = this.getUUID();
		String sql = "insert all into T_WORKORDER_REPSUPERVISOR(id,name,sex,manage_area,phone_num) values('" + id
				+ "','" + name + "','" + sex + "','" + area + "','" + phone + "') select 1 FROM DUAL ";
		this.mapService.execute(sql);

		return true;

	}

	// 修改主管数据
	@Override
	public boolean updateVisor(String id, String name, String sex, String phone, String area) {
		String sql = "update T_WORKORDER_REPSUPERVISOR set(name,sex,manage_area,phone_num) = ( select '" + name + "','"
				+ sex + "','" + area + "','" + phone + "' from dual) where id='" + id + "'";
		this.mapService.execute(sql);

		return true;

	}

	// 获取主管数据
	@Override
	public List<?> getVisor(String name, String area) {

		String sql = "select * from T_WORKORDER_REPSUPERVISOR where name='" + name + "' and manage_area='" + area + "'";
		List<?> list = this.mapService.getListBySql(sql);

		return list;

	}

	// 获取主管列表数据
	@Override
	public List<?> getVisorList(String area) {

		String sql = "select * from T_WORKORDER_REPSUPERVISOR where manage_area = '" + area + "'";
		List<?> list = this.mapService.getListBySql(sql);

		return list;

	}

	@Override
	public void insertWorkOrderToStatus(String workOrderId, String managerId) {
		// TODO Auto-generated method stub
		String id = this.getUUID();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String now = df.format(new Date());
		String sql = "INSERT INTO T_WORKORDER_STATUS (id, WORKORDER_NUM,DATETIME,ORDERSTATUS_ONE,REPSUPERVISORID) VALUES "
				+ "('" + id + "', '" + workOrderId + "','" + now + "','1','" + managerId + "')";
		this.mapService.execute(sql);
	}

	// lx 在前端获取主管列表数据
	@Override
	public List<?> showorderManageList() {

		String sql = "select * from T_WORKORDER_REPSUPERVISOR";
		List<?> Managerlist = this.mapService.getListBySql(sql);

		return Managerlist;

	}

	// lx 在前端获取主管编辑条目
	public List<?> showManagerEdit(String id) {

		String sql = "select * from T_WORKORDER_REPSUPERVISOR where ID = '" + id + "'";
		List<?> managerEdit = this.mapService.getListBySql(sql);

		return managerEdit;

	}

	public boolean managerDel(String id) {

		String sql = "delete T_WORKORDER_REPSUPERVISOR where ID = '" + id + "'";
		this.mapService.execute(sql);
		return true;

	}

	// lx 在前端获取工人列表数据
	public List<?> showorderWorkerList() {

		String sql = "select * from T_WORKORDER_REPWORKER";
		List<?> Workerlist = this.mapService.getListBySql(sql);

		return Workerlist;

	}

	// lx 在前端获取工人工作类别
	public List<?> showWorkerType() {

		String sql = "select * from T_WORKORDER_ORDERTYPE";
		List<?> Workerlist = this.mapService.getListBySql(sql);

		return Workerlist;

	}

}
