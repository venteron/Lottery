package DAO;

import Bean.Lottery;
import Util.DBUtil;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LotteryDAO {
    public static List<List<Lottery>> getLotterys(){
        List<List<Lottery>> lotterys=new ArrayList<>();
        String sql="select lottery.id,period,information,lottery.date,pool,red,blue,sale,close,name\n" +
                "from lottery,lottery_type\n" +
                "where tid=? and tid=lottery_type.id\n" +
                "order by lottery.date desc";
        for(int i=1;i<=8;i++){
            List<Lottery> list=null;
            list=DBUtil.getList(Lottery.class,sql,i);
            lotterys.add(list);
        }
        return lotterys;
    }
    public static List<Lottery> getLotteriesByName(String name){
        String sql="select lottery.id,period,information,lottery.date,pool,red,blue,sale,close,name\n" +
                "from lottery,lottery_type\n" +
                "where tid=lottery_type.id and lottery_type.name=?\n" +
                "order by lottery.date desc";
        return DBUtil.getList(Lottery.class,sql,name);
    }
    public static int getIdByName(String name){
        String sql="select id from lottery_type where name=?";
        Connection conn= null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        int id = 0;
        try {
            conn = DBUtil.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setObject(1,name);

            rs=ps.executeQuery();

            if(rs.next())
                id=rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            DBUtil.close(conn,ps,rs);
        }
        return id;
    }
}
