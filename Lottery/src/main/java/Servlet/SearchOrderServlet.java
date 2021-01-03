package Servlet;

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
import java.util.List;

@WebServlet(urlPatterns = "/SearchOrderServlet")
public class SearchOrderServlet extends HttpServlet {
    public SearchOrderServlet(){
        super();
    }

    protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request,response);
    }
    protected  void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        //设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //获取请求参数
        int u_id= Integer.parseInt(request.getParameter("user_id"));

        List<Order> orders=OrderDAO.getOrdersByUid(u_id);
        request.getSession().setAttribute("ORDERS",orders);
        response.sendRedirect(request.getContextPath()+"/orders.jsp");
    }
}