<%@ page import="java.util.List" %>
<%@ page import="Bean.Lottery" %>
<%@ page import="java.sql.Date" %>
<%@ page import="Util.MathUtil" %>
<%@ page import="Bean.User" %><%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2020/12/31
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>order</title>
    <link rel="stylesheet" href="css/buy.css" type="text/css">
</head>
<body>
<div class="box">
    <div class="header">
        <div class="inner">
            <div class="log">
                <img align="center" src="https://www.zhcw.com/static/images/home/z-h-logo-1.png" alt="彩网log">
            </div>
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="#">聚焦</a></li>
                <li><a href="#">开奖信息</a></li>
                <li><a href="#">视频直播</a></li>
                <li><a href="#">数据图表</a></li>
                <li style="background-color: #DA0F0F;"><a href="#">彩种服务</a></li>
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
    <div class="img">
        <img width="1000px" height="75px" src="https://www.zhcw.com/upload/resources/image/2020/12/30/97874.jpg" alt="">
    </div>
    <div class="main">
        <div class="message">
            <%
                Lottery now=((List<Lottery>)request.getSession().getAttribute("LOTTERIES")).get(0);//获取彩种为 id的彩票
                String id= (String) request.getSession().getAttribute("id");//获取彩种名
                int period=now.getPeriod();//期数
                Date close=now.getClose();//截止投注时间
                long pool=now.getPool();//奖池
                //存放到作用域
                pageContext.setAttribute("id",id);
                pageContext.setAttribute("period",period);
                pageContext.setAttribute("close",close);
                pageContext.setAttribute("pool",pool);
            %>
            <div class="name">
                <img style="float: left" width="60px" height="60px" src="${pageContext.request.contextPath}/img/lottery.jpg" alt=""><div style="margin-top: 15px;float: left">${id}</div>
            </div>
            <div>
                <div class="title_top">
                    正在销售第${period}&nbsp;&nbsp;截止投注时间：${close}&nbsp;&nbsp;每日21:30
                </div>
                <div class="title_bottom">
                    <span>奖池：</span><div class="prize">${pool}</div><span>元</span>
                </div>
            </div>
        </div>
        <div class="search">
            <%
                List<Lottery> lotteries= (List<Lottery>) request.getSession().getAttribute("LOTTERIES");
                if(lotteries.size()>1)
                    for(int i=1;i<lotteries.size();i++){
                        Lottery lottery=lotteries.get(i);
                        request.setAttribute("period_i",lottery.getPeriod());//期数
                        request.setAttribute("date_i",lottery.getDate());//开奖日期
                        request.setAttribute("sale_i",lottery.getSale());//该期销售额
            %>
            <div class="top">
                第${period_i}期 开奖日期${date_i}
            </div>
            <div class="center">
                <%
                    if(lottery.getRed()!=null)
                        for(int m=0;m<lottery.getRed().length();m+=2){
                %>
                <div class="red"><%out.print(lottery.getRed().substring(m,m+2));%></div>
                <%}%>
                <%
                    if(lottery.getBlue()!=null)
                        for(int n=0;n<lottery.getBlue().length();n+=2){
                            if(lottery.getBlue()!=null)
                %>
                <div class="blue"><%out.print(lottery.getBlue().substring(n,n+2));%></div>
                <%}%>
            </div>
            <div class="bottom">
                本期销售额：<font color="red">${sale_i}</font> 元
            </div>
            <%}%>
        </div>
        <div class="buy">
            <div class="title">第${period}期 ${close} 20:00:00 截止</div>
            <div class="red_box">
                <font color="red">红球区</font>
                <br>
                <%
                    for(int i=1;i<=33;i++){
                        if(i<10) request.setAttribute("r","0"+i);
                        else request.setAttribute("r",i);
                %>
                <div class="re" id="rd" value="${r}">${r}</div>
                <%}%>
            </div>
            <div class="blue_box">
                <font color="blue">蓝球区</font>
                <br>
                <%
                    for(int j=1;j<=16;j++){
                        if(j<10) request.setAttribute("b","0"+j);
                        else request.setAttribute("b",j);
                %>
                <div class="bl" id="bu" value="${b}">${b}</div>
                <%}%>
            </div>
        </div>
        <div class="order">
            <div class="info"><%--选号--%>
                <div>您选择了</div>
                <div id="rn">0</div>
                <div>个红球,</div>
                <div id="bm">0</div>
                <div>个蓝球,共</div>
                <div style="color: red" id="total">0</div>
                <div>注,</div>
                <div style="color: red" id="money">0</div>元
            </div>
            <div class="pay" id="pay"><%--支付--%>
                购买
            </div>
        </div>
    </div>
    <div class="footer">

    </div>
</div>
</body>
<script type="text/javascript">
    window.onload=function () {
        var out=document.getElementById("logout");
        out.onclick=function () {
            if(confirm("确定退出？")){
                sessionStorage.clear();
                sessionStorage.removeItem("USER");
                window.location.href="page/login.html";
            }
            return false;
        }

        var reds=document.getElementsByClassName("re");
        var len=reds.length;
        var rn=0;//当前选中的红球数
        var bm=0;//当前选中的蓝球数
        var money=0;

        for(var i=0;i<len;i++){
        reds[i].onclick=function () {
                var old=this.className;
                if(old=="re"){
                    rn++;
                    this.className="red_onclick";
                }else{
                    rn--;
                    this.className="re";
                }
            // window.location.href="#/?rn="+rn+"&bm"+bm;//#页面不跳转  re选中的红球数 bm选中的蓝球数
            document.getElementById('rn').innerText=rn;
            if(rn>=6&&bm>=1){
                var total1=getN_R(rn,6);
                var total2=getN_R(bm,1);
                money=total1*total2*2;
                document.getElementById('total').innerText=total1*total2;
                document.getElementById('money').innerText=money;
            }else {
                document.getElementById('total').innerText=0;
                document.getElementById('money').innerText=0;
                money=0;
            }
        };
        }
        function concatRed() {//获取红球
            var rs="";
            var rds=document.getElementsByClassName("red_onclick");

            for(var i=0;i<rds.length;i++){
                rs+=rds[i].innerHTML;
                console.log(rs);
            }
            return rs;
        }
        function concatBlue() {//获取蓝球
            var bs="";
            var bes=document.getElementsByClassName("blue_onclick");

            for(var i=0;i<bes.length;i++) {
                bs+=bes[i].innerHTML;
                console.log(bs);
            }
            return bs;
        }
        var blues=document.getElementsByClassName("bl");
        var len=blues.length;
        for(var j=0;j<len;j++){
            blues[j].onclick=function () {
                var old=this.className;
                if(old=="bl"){
                    bm++;
                    this.className="blue_onclick";
                }else{
                    bm--;
                    this.className="bl";
                }
                document.getElementById('bm').innerText=bm;
                if(rn>=6&&bm>=1){
                    var total1=getN_R(rn,6);
                    var total2=getN_R(bm,1);
                    money=total1*total2*2;
                    document.getElementById('total').innerText=total1*total2;
                    document.getElementById('money').innerText=total1*total2*2;
                }else {
                    document.getElementById('total').innerText=0;
                    document.getElementById('money').innerText0;
                    money=0;
                }

            };
        }
        var pay=document.getElementById("pay");
        pay.onclick=function () {
            if(rn>=6&&bm>=1){
                location.href="OrderServlet?money="+money+"&red="+concatRed()+"&blue="+concatBlue()+"+&period="+${period};
                // send("../Servlet?money="+money);
                // var ajax=new XMLHttpRequest();
                // ajax.open("post","../OrderServlet",true);
                // ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            }else{
                alert("请至少选择6个红球和1个蓝球!");
            }
        }
    };
    function getN_R(n,r) {
        var nr=1,rr=1;
        for(var i=1;i<=n;i++)//n! 分子
        nr*=i;
        for(var i=1;i<=r;i++)
        rr*=i;
        for(var i=1;i<=n-r;i++)
        rr*=i;
        return Math.ceil(nr/rr);
    };
    function send(url) {
        createXmlHttpRequest();//创建httprequest对象
        xmlHttp.onreadystatechange=processor();//调用回调函数
        xmlHttp.open("post",url,true);//get方式提交
        xmlHttp.send(null);//发送
    };
    function processor() {
        //readyState
        //0-未初始化
        //1-正在加载
        //2-加载完毕
        //3-交互
        //4-完成
        if(xmlHttp.readyState==4){
            if(xmlHttp.status==200){//运行正常
                var b=xmlHttp.responseText;//获得后台返回值的json类型
            }
        }
    };
    function createXmlHttpRequest() {
        if(window.ActiveXObject){
            xmlHttp=new ActiveXObject("microsoft.XMLHTTP");
        }else if(window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
        }
    };
</script>
</html>
