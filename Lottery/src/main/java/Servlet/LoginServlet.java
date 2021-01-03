package Servlet;

import Bean.Lottery;
import Bean.User;
import DAO.LotteryDAO;
import DAO.UserDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    public LoginServlet(){
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

        User user=UserDAO.getUserByEmailAndPass(email,password);
        if(user!=null){
            //登录成功
            request.getSession().setAttribute("USER",user);//把用户对象放到会话中
            List<List<Lottery>> list= LotteryDAO.getLotterys();//读取彩种和彩票的信息
            request.getSession().setAttribute("LOTTERYS",list);
            response.sendRedirect("index.jsp");//重定向到主页
        }else{
            //登录失败
            out.print("<script type='text/javascript'>");
            out.print("alert('邮箱地址或密码错误，请重新输入！');");
            out.print("window.location='/Lottery/page/login.html'");
            out.print("</script>");
        }
    }
}
