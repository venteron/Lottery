package Servlet;

import Bean.Lottery;
import Bean.Order;
import Bean.User;
import DAO.LotteryDAO;
import DAO.OrderDAO;
import DAO.UserDAO;
import Util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    public SearchServlet(){
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
        String type=request.getParameter("type");
        User user= (User) request.getSession().getAttribute("USER");
        List<Lottery> lotteries= LotteryDAO.getLotteriesByName(type);
        request.getSession().setAttribute("ltype",type);
        request.getSession().setAttribute("lotters",lotteries);
        response.sendRedirect(request.getContextPath()+"/lotterys.jsp");
    }
}

