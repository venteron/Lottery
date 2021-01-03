package Servlet;

import Bean.Lottery;
import Bean.Order;
import Bean.User;
import DAO.LotteryDAO;
import DAO.OrderDAO;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet(urlPatterns = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    public OrderServlet(){
        super();
    }

    protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request,response);
    }
    protected  void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        //设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //获取请求参数
        int money= Integer.parseInt(request.getParameter("money"));
        User user=(User) request.getSession().getAttribute("USER");

        if(money>user.getBalance()){//余额不足，请充值
            out.print("<script type='text/javascript'>");
            out.print("alert('余额不足，请充值！');");
            out.print("window.location='/Lottery/buy.jsp'");
            out.print("</script>");
        }else{
            String name= (String) request.getSession().getAttribute("id");
            String red=request.getParameter("red");
            String blue=request.getParameter("blue");
            Order order=new Order();
            order.setU_id(user.getId());//购买人id
            order.setL_id(LotteryDAO.getIdByName(name));//彩票id
            order.setPayment(money);//花费的钱
            order.setPeriod(request.getParameter("period"));//期数
            order.setDate(new Date(System.currentTimeMillis()));//购买时间
            order.setRed(red);
            order.setBlue(blue);
            OrderDAO.savaOrder(order);

            user.setBalance(user.getBalance()-money);//减去买彩票的钱
            UserDAO.updateUser(user.getBalance(),user.getId());//修改余额
//            response.sendRedirect(request.getContextPath()+"/buy.jsp");
            out.print("<script type='text/javascript'>");
            out.print("alert('购买成功');");
            out.print("window.location='/Lottery/buy.jsp'");
            out.print("</script>");
        }
    }
}
