package Util;

import java.io.IOError;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class DBUtil {
    public static Connection getConnection() throws Exception {
        //加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");

        //获取链接
        String url="jdbc:mysql://localhost:3306/Lottery?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8";
        String username="root";
        String password="000429";

        Connection conn=DriverManager.getConnection(url,username,password);
        return conn;
    }
    public static void close(Connection conn, Statement ps, ResultSet rs) {

        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(ps!=null){
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static <T> List<T> getList(Class<T> clazz, String sql, Object... args){//泛型方法，根据SQL语句查找数据并返回指定类型的对象
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        List<T> list=new ArrayList<>();
        try {
            conn=getConnection();//获取链接
            ps=conn.prepareStatement(sql);//预设查询语句

            if(args!=null &&args.length>0)
                for(int i=0;i<args.length;i++)//给参数赋值
                    ps.setObject(i+1,args[i]);

            rs=ps.executeQuery();//获取结果集

            ResultSetMetaData rsm=rs.getMetaData();
            Method[] dms=clazz.getDeclaredMethods();//获取class的方法名
            int count=rsm.getColumnCount();
            while(rs.next()){//循环一次就是一条记录（一个对象）
                T t=clazz.newInstance();//获取对象实例
                for(int i=0;i<count;i++){
                    for(Method m:dms){
                        if(m.getName().startsWith("set")){//找到所有set方法
                            Class[] cs=m.getParameterTypes();//得到该方法的参数
                            if(cs.length==1){
                                //得到需要查询的列名
                                String numName=rsm.getColumnName(i+1);
                                //得到方法名称转换 setUsername U--->u + sname  =username
                                String s=m.getName().substring(3,4).toLowerCase()+m.getName().substring(4);
//                                System.out.println(numName+s);
                                if(numName.equals(s)){//字段名和方法名对应
                                    m.invoke(t,rs.getObject(numName));
                                }
                            }
                        }
                    }
                }
                list.add(t);//把对象存储到集合中
                }
        }catch (Exception e){
                e.printStackTrace();
        }finally {
            close(conn,ps,rs);
        }
        return list;
    }

    public static <T> void setObject(Class<T> clazz,T t, String sql,Object... args){//泛型方法，添加对象到数据库
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;

    }
}
