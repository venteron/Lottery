package Servlet;

import Bean.User;
import DAO.UserDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet(urlPatterns = "/EnrollServlet")
public class EnrollServlet extends HttpServlet {
    public EnrollServlet(){
        super();
    }

    protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doPost(request,response);
    }
    protected  void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //获取请求参数
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String requestPath=request.getParameter("requestPath");

        if(UserDAO.isExistEmail(email)){
            //邮箱已存在
            out.print("<script type='text/javascript'>");
            out.print("alert('邮箱已被使用，请重新注册！');");
            out.print("window.location='/Lottery/page/enroll.html'");
            out.print("</script>");
        }else{
            //邮箱未被使用，保存注册信息，返回登录页面
            User user=new User();
            user.setEmail(email);//设置邮箱
            user.setPassword(password);//设置密码
            user.setBalance(5);//设置余额
            user.setCreated(new Date(System.currentTimeMillis()));//设置注册时间
            UserDAO.saveUser(user);
            response.sendRedirect("/Lottery/page/login.html");//重定向到登录页面
        }
    }
}
