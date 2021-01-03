<%@ page import="java.util.List" %>
<%@ page import="Bean.Order" %>
<%@ page import="Bean.User" %><%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2021/1/3
  Time: 8:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${username}的购买纪录</title>
</head>
<body>
    <table border="1px">
        <tr>
            <th>订单编号</th>
            <th>购买日期</th>
            <th>期数</th>
            <th>金额</th>
            <th>用户编号</th>
            <th>彩票编号</th>
            <th>红球</th>
            <th>蓝球</th>
        </tr>
        <%
            List<Order> orders= (List<Order>) request.getSession().getAttribute("ORDERS");
            User user= (User) request.getSession().getAttribute("USER");
            request.setAttribute("username",user.getUsername());
            for(Order o:orders){%>
        <tr>
            <%request.setAttribute("oid",o.getO_id());
                request.setAttribute("date",o.getDate());
                request.setAttribute("period",o.getPeriod());
                request.setAttribute("payment",o.getPayment());
                request.setAttribute("u_id",o.getU_id());
                request.setAttribute("l_id",o.getL_id());
                request.setAttribute("red",o.getRed());
                request.setAttribute("blue",o.getBlue());
            %>
            <td>${oid}</td>
            <td>${date}</td>
            <td>${period}</td>
            <td>${payment}</td>
            <td>${u_id}</td>
            <td>${l_id}</td>
            <td>${red}</td>
            <td>${blue}</td>
        </tr>
        <%}%>
    </table>
</body>
</html>
