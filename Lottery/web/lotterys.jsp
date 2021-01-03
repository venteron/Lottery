<%@ page import="Bean.Lottery" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2021/1/2
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${type}往期记录</title>
</head>
<body>
    <table border="1px">
        <tr>
            <th>彩票id</th>
            <th>期数</th>
            <th>彩票信息</th>
            <th>开奖日期</th>
            <th>奖池</th>
            <th>蓝球</th>
            <th>红球</th>
            <th>销售额</th>
            <th>截止日期</th>
        </tr>
    <%
        String type= (String) request.getSession().getAttribute("ltype");
        List<Lottery> lotters= (List<Lottery>) request.getSession().getAttribute("lotters");
        request.setAttribute("type",type);
        for(Lottery l:lotters){%>
    <tr>
        <%request.setAttribute("lid",l.getId());
        request.setAttribute("lperiod",l.getPeriod());
        request.setAttribute("linfomation",l.getInformation());
        request.setAttribute("ldate",l.getDate());
        request.setAttribute("lpool",l.getPool());
        request.setAttribute("lblue",l.getBlue());
        request.setAttribute("lred",l.getRed());
        request.setAttribute("lsale",l.getSale());
        request.setAttribute("lclose",l.getClose());
    %>
    <td>${lid}</td>
    <td>${lperiod}</td>
    <td>${linfomation}</td>
    <td>${ldate}</td>
    <td>${lpool}</td>
    <td>${lblue}</td>
    <td>${lred}</td>
    <td>${lsale}</td>
    <td>${lclose}</td>
    </tr>
    <%}%>
    </table>
</body>
</html>
