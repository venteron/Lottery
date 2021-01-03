<%@ page import="java.util.List" %>
<%@ page import="Bean.Lottery" %>
<%@ page import="Bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2020/12/29
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>

<html>
  <head>
    <title>Lottery.index</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <style>
      .main .right img{
        float: left;
        margin-right: 5px;
      }
      .main .right .title{
        font-weight: bold;
        font-size: 17px;
        float: left;
      }
      .main .right .message{
        width: 310px;
        height: 280px;
        margin-top: 30px;
        position: relative;
        overflow-x: hidden;
        overflow-y: hidden;
        -moz-box-shadow: #666 0 0 0.1rem;
        box-shadow: #666 0 0 0.1rem;
      }
      .main .right .message:hover{
        overflow-y:scroll ;
      }
      .lottery{
        margin-top: 10px;
        margin-left: 10px;
        padding-bottom: 10px;
        position: relative;
        float: left;
        height: auto;
        width: 290px;
        font-size: 10px;
        border-bottom:1px dashed #ececec;
      }
      .lottery a{
        margin-right: 5px;
        font-size: 15px;
        font-weight: bold;
        color: black;
        position: relative;
      }
      .lottery .box{
        padding-top: 5px;
        padding-bottom: 5px;
        margin-top: 5px;
      }
      .lottery .box span{
        width: auto;
        height: auto;
        font-size: 15px;
        color: red;
        -moz-box-shadow: #666 0 0 0.1rem;
        box-shadow: #666 0 0 0.1rem;
      }
      .red{
        width: 20px;
        height: 20px;
        margin-right: 7px;
        border-radius: 50%;
        background-color: red;
        font-size: 15px;
        color: white;
        float: left;
        text-align: center;
      }
      .blue{
        width: 20px;
        height: 20px;
        margin-right: 7px;
        border-radius: 50%;
        background-color: blue;
        font-size: 15px;
        color: white;
        float: left;
        text-align: center;
      }
      .search{
        width: 310px;
        height: 50px;
        background-color: #d9d9d9;
        -moz-box-shadow: #666 0 0 0.1rem;
        box-shadow: #666 0 0 0.1rem;
      }
      .search div{
        width: auto;
        height: auto;
        margin-top: 13px;
        margin-left: 10px;
        float: left;
      }
      .footer{
        width: auto;
        height: 400px;
        background-color: #F4F4F4;
        position: relative;
      }
      .inner{
        width: 1000px;
        height: 300px;
        margin-left: auto;
        margin-right: auto;
        position: relative;
      }
      .inner .box{
        width: auto;
        height: auto;
        float: left;
        margin-left: 50px;
      }
      .inner .box div{
        margin-top: 10px;
      }
      .copy{
        width: 100%;
        height: 40px;
        padding-top: 10px;
        float: left;
        color: whitesmoke;
        position: relative;
        background-color: #282828;
      }
      .copy .inner{
        width: 900px;
        height: 40px;
        margin-right: auto;
        margin-left: auto;
        color: whitesmoke;
        position: relative;
        background-color: #282828;
      }

    </style>
  </head>
  <body>
  <div class="header">
    <div class="inner">
      <div class="log">
        <img align="center" src="https://www.zhcw.com/static/images/home/z-h-logo-1.png" alt="彩网log">
      </div>
      <ul>
        <li style="background-color: #DA0F0F;"><a href="#">首页</a></li>
        <li><a href="#">聚焦</a></li>
        <li><a href="#">开奖信息</a></li>
        <li><a href="#">视频直播</a></li>
        <li><a href="#">数据图表</a></li>
        <li><a href="#">彩种服务</a></li>
        <li><a href="#">彩民之家</a></li>
        <li><a href="#">专属福利</a></li>
      </ul>
      <input style="margin-top: 15px;margin-right:20px;float: right;background-color: #daceff" type="button" id="logout" value="安全退出"/>
      <div style="padding-top: 15px;float:right;margin-right:20px">
        <%
          User user= (User) request.getSession().getAttribute("USER");
          request.setAttribute("user_id",user.getId());
          request.setAttribute("username",user.getUsername());
          request.setAttribute("balance",user.getBalance());
        %>
        欢迎 <a style="color: blue" href="${pageContext.request.contextPath}/SearchOrderServlet?user_id=${user_id}">${username}</a>&nbsp;&nbsp;余额${balance}
      </div>

    </div>
  </div>
  <div class="main">
    <div class="left">
      <div class="title">
        彩种
      </div>
      <ul>
        <li>
          <img src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=88537357,2295156720&fm=11&gp=0.jpg" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=快乐8" id="快乐8" name="快乐8">快乐8</a>
        </li>
        <li>
          <img src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1652126158,3260625334&fm=26&gp=0.jpg" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=双色球">双色球</a>
        </li>
        <li>
          <img src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1652126158,3260625334&fm=26&gp=0.jpg" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=大乐透">大乐透</a>
        </li>
        <li>
          <img src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1638368988,1250411612&fm=26&gp=0.jpg" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=福彩3D">福彩3D</a>
        </li>
        <li>
          <img src="https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2000112743,274308358&fm=26&gp=0.jpg" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=竞技彩">竞技彩</a>
        </li>
        <li>
          <img src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2506190440,1821450776&fm=26&gp=0.jpg" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=排列3">排列3</a>
        </li>
        <li>
          <img src="" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=排列5">排列5</a>
        </li>
        <li>
          <img src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3948199403,2207452603&fm=26&gp=0.jpg" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=七乐彩">七乐彩</a>
        </li>
        <li>
          <img src="https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3971880746,4219767277&fm=26&gp=0.jpg" alt="">
          <a href="${pageContext.request.contextPath}/BuyServlet?id=七星彩">七星彩</a>
        </li>
      </ul>
      <div style="margin-top: 10px">
        <div style="float: left;margin-top: 10px">
          <div>扫码下载</div>
          <div>权威平台</div>
          <div>彩民必备</div>
        </div>
        <div style="float:left; margin-left: 10px">
          <img src="https://www.zhcw.com/static/images/home/kfd-ewm01.jpg?1" alt="">
        </div>
      </div>
    </div>
    <div class="center">
      <div class="container">
        <div class="wrap" style="left: -510px;">
          <a href="#"><img src="https://www.zhcw.com/upload/resources/image/2020/12/15/96558_740x300c.png" alt=""/></a>
          <a href="#"><img src="https://www.zhcw.com/upload/resources/image/2020/12/15/96562_740x300c.jpg" alt=""/></a>
          <a href="#"><img src="https://www.zhcw.com/upload/resources/image/2020/12/23/97322_740x300c.jpg" alt=""/></a>
          <a href="#"><img src="https://www.zhcw.com/upload/resources/image/2020/12/17/96832_740x300c.png" alt=""/></a>
          <a href="#"><img src="https://www.zhcw.com/upload/resources/image/2020/12/23/97351_740x300c.png" alt=""/></a>
          <a href="#"><img src="https://www.zhcw.com/upload/resources/image/2020/12/15/96558_740x300c.png" alt=""/></a>
          <a href="#"><img src="https://www.zhcw.com/upload/resources/image/2020/12/15/96562_740x300c.jpg" alt=""/></a>
        </div>
        <div class="buttons">
          <span class="on"></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </div>
        <a href="javascript:;" class="arrow arrow_left">&lt;</a>
        <a href="javascript:;" class="arrow arrow_right">&gt;</a>
      </div>

    </div>
    <div class="right">
      <div class="title">
        <img src="https://www.zhcw.com/static/images/home/h-rm.png" alt="">
        热门开奖
      </div>
      <div class="message">
        <%
          request.setCharacterEncoding("UTF-8");
          List<List<Lottery>> lotterys= (List<List<Lottery>>) pageContext.getSession().getAttribute("LOTTERYS");
          for(List<Lottery> list:lotterys){
            Lottery lottery=list.get(0);
        %>
        <div class="lottery">
          <a href="#"><%out.print(lottery.getName());%></a> <%out.print(lottery.getDate());%>&nbsp;&nbsp;<%out.print(lottery.getPeriod());%>期&nbsp;
          <%
            switch (lottery.getName()){
              case "快乐8":out.print("每日开奖");break;
              case "双色球":out.print("每周二、四、日开奖");break;
              case "大乐透":out.print("每周一、三、六开奖");break;
              case "3D":out.print("每日开奖");break;
              case "排列3":out.print("每日开奖");break;
              case "排列5":out.print("每日开奖");break;
              case "七乐彩":out.print("每周一、三、五开奖");break;
              case "七星彩":out.print("每周二、五、日开奖");break;
            }
          %>
          <div class="box">
            <img src="https://www.zhcw.com/static/images/home/h-rm-q.png" alt="">&nbsp;&nbsp;
            奖池 <span><%out.print(lottery.getPool());%></span> <br>
          </div>
          <%
            if(lottery.getRed()!=null)
            for(int i=0;i<lottery.getRed().length();i+=2){
          %>
          <div class="red"><%out.print(lottery.getRed().substring(i,i+2));%></div>
          <%}%>
          <%
            if(lottery.getBlue()!=null)
            for(int j=0;j<lottery.getBlue().length();j+=2){
              if(lottery.getBlue()!=null)
          %>
          <div class="blue"><%out.print(lottery.getBlue().substring(j,j+2));%></div>
          <%}%>
        </div>
        <%
          }
        %>
        </div>
        <div class="search">
          <div>开奖查询</div>
          <div>
            <form name="form1">
            <select name="stype" id="ltype">
              <option value="彩种" selected="selected">选择彩种</option>
              <%
                int i=0;
                for(List<Lottery> list:lotterys){
                  request.setAttribute("index",i++);
                  request.setAttribute("name",list.get(0).getName());//把彩种名放到请求作用域中
              %>
              <option value="${name}">${name}</option>
              <%}%>
            </select>
            </form>
          </div>
          <div style="color:white;background-color: #53d5ff;cursor:pointer;" id="sc">
            查询
          </div>
        </div>
    </div>
  </div>
  <div class="footer">
    <div class="inner">
      <div class="box">
        <div style="font-weight: bold">关于我们</div>
        <div>公司简介</div>
        <div>联系我们</div>
        <div>免责声明</div>
        <div>诚聘英才</div>
        <div>诚征稿件</div>
        <div>帮助中心</div>
      </div>
      <div class="box">
        <div style="font-weight: bold">联系方式</div>
        <div>彩票信息平台</div>
        <div>地址:**********</div>
        <div>电话123456789</div>
      </div>
      <div class="box">
        <div style="font-weight: bold">友情链接</div>
        <div>中华人民共和国财政部</div>
        <div>中华人民共和国民政部</div>
        <div>中国福彩网</div>
        <div>中国体彩网</div>
        <div>中国体育</div>
      </div>
      <div class="box">
        <div style="font-weight: bold">下载彩网客户端</div>
      </div>
      <div class="box">
        <div style="font-weight: bold">关注彩网公众号</div>
      </div>
      <div class="box">
        <div style="font-weight: bold">添加彩网抖音号</div>
      </div>
    </div>
  </div>
  <div class="copy">
      <div class="inner">
        1999-2021 彩网版权所有 | 京ICP证1243453634 | 京ICP备12984719号-3 | 京公安备128994173199号 | 京公网备12140382035号
      </div>
  </div>
  </body>
  <script type="text/javascript">
    window.onload=function () {
      var search=document.getElementById("sc");
      search.onclick=function () {
        var myselect=document.getElementById("ltype");
        var index=myselect.selectedIndex;

        location.href="SearchServlet?type="+myselect.options[index].value;
      }

      var out=document.getElementById("logout");
      out.onclick=function () {
        if(confirm("确定退出？")){
          sessionStorage.clear();
          sessionStorage.removeItem("USER");
          window.location.href="page/login.html";
        }
        return false;
      }
    };

    var wrap = document.querySelector(".wrap");
    var next = document.querySelector(".arrow_right"); /* 下一张 */
    var prev = document.querySelector(".arrow_left"); /* 上一张 */
    var index = 0;
    var dots = document.getElementsByTagName("span");

    function showCurrentDot() {
      for (var i = 0, len = dots.length; i < len; i++) {
        dots[i].className = "";
      }
      dots[index].className = "on";
    }

    for (var i = 0, len = dots.length; i < len; i++) {
      (function(i) {
        dots[i].onclick = function() {
          var dis = index - i;
          if (index == 4 && parseInt(wrap.style.left) !== -2550) {
            dis = dis - 5;
          }
          //和使用prev和next相同，在最开始的照片5和最终的照片1在使用时会出现问题，导致符号和位数的出错，做相应地处理即可
          if (index == 0 && parseInt(wrap.style.left) !== -510) {
            dis = 5 + dis;
          }
          wrap.style.left = (parseInt(wrap.style.left) + dis * 510) + "px";
          index = i;
          showCurrentDot();
        }
      })(i);
    }

    next.onclick = function() {/* 点击下一张图片 */
      next_pic();
    }
    prev.onclick = function() {/* 点击上一张图片 */
      prev_pic();
    }

    function next_pic() {
      var newLeft;
      if (wrap.style.left === "-3060px") { /* 到第五张图片了 */
        newLeft = -1020; /* 第二张图片的开始位置 */
      } else {
        newLeft = parseInt(wrap.style.left) - 510;
      }
      index++;
      if (index > 4) {
        index = 0;
      }
      showCurrentDot();
      wrap.style.left = newLeft + "px";
    }

    function prev_pic() {
      var newLeft;
      if (wrap.style.left === "0px") /* 第一张图片 */ {
        newLeft = -2040;
      } else {
        newLeft = parseInt(wrap.style.left) + 510;
      }
      index--;
      if (index < 0) {
        index = 4;
      }
      showCurrentDot();/* 输出当前按钮样式 */
      wrap.style.left = newLeft + "px";
    }

    var timer = null;

    function autoPlay() { /* 设置3秒自动轮播 */
      timer = setInterval(function() {
        next_pic();
      }, 2000);
    }
    autoPlay();

    var container = document.querySelector(".container");
    container.onmouseenter = function() {
      clearInterval(timer);
    }
    container.onmouseleave = function() {
      autoPlay();
    }
  </script>
</html>
