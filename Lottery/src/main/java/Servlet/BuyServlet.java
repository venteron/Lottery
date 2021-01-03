package Servlet;

import Bean.Lottery;
import DAO.LotteryDAO;
import Util.DBUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/BuyServlet")
public class BuyServlet extends HttpServlet {
    public BuyServlet(){
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
        String id=request.getParameter("id");
        if (!id.equals("")){
            List<Lottery> lotteries= LotteryDAO.getLotteriesByName(id);
            request.getSession().setAttribute("LOTTERIES",lotteries);//把这种彩票的彩票集合放到request
            request.getSession().setAttribute("id",id);//把彩种名放到request
            response.sendRedirect(request.getContextPath()+"/buy.jsp");
            String path=request.getContextPath();
            System.out.println(path);
        }
    }
}
