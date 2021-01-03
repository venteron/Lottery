package DAO;

import Bean.Order;
import Util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public class OrderDAO {
    public static void savaOrder(Order order){//保存订单
        String sql="insert into orders (date,period,payment,u_id,l_id,red,blue) values(?,?,?,?,?,?,?)";
        Connection conn=null;
        PreparedStatement ps=null;
        try {
            conn= DBUtil.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setObject(1,order.getDate());
            ps.setObject(2,order.getPeriod());
            ps.setObject(3,order.getPayment());
            ps.setObject(4,order.getU_id());
            ps.setObject(5,order.getL_id());
            ps.setObject(6,order.getRed());
            ps.setObject(7,order.getBlue());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(conn,ps,null);
        }
    }
    public static List<Order> getOrdersByUid(int uid){
        String sql="select o_id,date,period,payment,u_id,l_id,red,blue from orders where u_id=?";
        return DBUtil.getList(Order.class,sql,uid);
    }
}
