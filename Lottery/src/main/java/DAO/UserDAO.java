package DAO;

import Bean.User;
import Util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDAO {
//    public class ApplicantDAO {
        /**
         * 验证E-mail是否已被注册
         *
         * @return
         */
//        public boolean isExistEmail(String email) {
//            Connection conn = null;
//            try {
//                conn = DBUtil.getConnection();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//            PreparedStatement pstmt = null;
//            ResultSet rs = null;
//            String sql = "SELECT * FROM tb_applicant WHERE applicant_email=?";
//            try {
//                pstmt = conn.prepareStatement(sql);
//                pstmt.setString(1, email);
//                rs = pstmt.executeQuery();
//                if (rs.next())//已被注册
//                    return true;
//            } catch (SQLException e) {
//                e.printStackTrace();
//            } finally {
//                DBUtil.close(conn, pstmt, rs);
//            }
//            return false;
//        }

        //保存注册对象
//        public boolean saveUser(User user) {
//            String sql = "insert into tb_applicant(APPLICANT_EMAIL,APPLICANT_PWD,APPLICANT_REGISTDATE)values(?,?,?)";
//            return DBUtil.save(sql, user.getEmail(), user.getPassword(),user.getBalance());
//
//        }

        /**
         * 注册用户登录
         *
         * @param email
         * @param password
         * @return
         */
//        public int login(String email, String password) {
//            int userID = 0;
//            Connection conn=null;
//            PreparedStatement pstmt = null;
//            ResultSet rs = null;
//            String sql = "SELECT applicant_id FROM tb_applicant WHERE applicant_email = ? and applicant_pwd=?";
//
//            try {
//                conn = DBUtil.getConnection();
//                pstmt = conn.prepareStatement(sql);
//                pstmt.setString(1, email);
//                pstmt.setString(2, password);
//                rs=pstmt.executeQuery();
//                if (rs.next())
//                    applicantID = rs.getInt("applicant_id");
//            } catch (SQLException e) {
//                e.printStackTrace();
//            } catch (Exception e) {
//                e.printStackTrace();
//            } finally {
//                DBUtils.close(conn,pstmt,rs);
//            }
//            return applicantID;
//        }

//        public Integer selectApplicantEmailCount(String applicantEmail) {
//            String sql="select count(*) from tb_applicant a where a.APPLICANT_EMAIL=?";
//            Integer count=DBUtils.getCount(sql,applicantEmail);
//            return count;
//        }

    /**
     * 验证邮箱是否已注册
     *
     *
     */
    public static boolean isExistEmail(String email){
        String sql="select id from users where email=?";
        Connection coon=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        boolean flag=false;//邮箱未被注册
            try {
                coon=DBUtil.getConnection();
                ps=coon.prepareStatement(sql);
                ps.setObject(1,email);

                rs=ps.executeQuery();

                if(rs.next()){
                    flag=true;//邮箱已被注册
                }
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
                DBUtil.close(coon,ps,null);
            }

        return flag;
    }

    /**
     * 根据邮箱和密码获取用户对象
     * @param   email
     * @param   password
     * @return  User
     */
    public static User getUserByEmailAndPass(String email, String password) {
        String sql="select id,email,password,username,balance,created from users where email=? and password=?";
        List list=DBUtil.getList(User.class,sql,email,password);
        if(list.size()!=0){
            return (User) list.get(0);
        }
        return null;
    }

    /**
     * 添加用户对象
     * @param   user
     *
     */
    public static void saveUser(User user){
        String sql="insert into users (email,password,balance,created) values(?,?,?,?)";
        Connection coon=null;
        PreparedStatement ps=null;

        try {
            coon=DBUtil.getConnection();
            ps=coon.prepareStatement(sql);
            ps.setObject(1,user.getEmail());
            ps.setObject(2,user.getPassword());
            ps.setObject(3,user.getBalance());
            ps.setObject(4,user.getCreated());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(coon,ps,null);
        }
    }

    public static void updateUser(float balance,int id){
        String sql="update users set balance=? where id=?";
        Connection coon=null;
        PreparedStatement ps=null;

        try {
            coon=DBUtil.getConnection();
            ps=coon.prepareStatement(sql);
            ps.setObject(1,balance);
            ps.setObject(2,id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(coon,ps,null);
        }
    }
}
