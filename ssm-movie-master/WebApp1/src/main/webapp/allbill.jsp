<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.entity.Bill" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022/11/25
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>查看订单</title>
  <style>
    body{
      background-image: url("/image/greencube.jpg");
    }
    .sts{
      width: 800px;
      height: 280px;
      margin-top: 10px;
      margin-left: auto;
      margin-right: auto;
      background-color: white;
    }
  </style>
</head>
<body>
<%@include file="head.jsp"%>
<%List<Bill> bills=(List<Bill>) session.getAttribute("bills");%>
<%int n=bills.size();%>
<%if(n==0){%>
<br/>
<font style="margin-left:500px">抱歉，亲亲~~，您还没有订单</font>
<%}else{%>
<%for(int i=0;i<bills.size();i++){%>
<div class="sts">
  <br/>
  <form action="cancelbill" method="post">
    <input type="hidden" value="<%=i%>" name="whichone">
    <font style="margin-left: 20px">订单编号：</font>
    <%=bills.get(i).getBid()%>
    <br/><br/>
    <font style="margin-left: 20px">手机号：</font>
    <%=bills.get(i).getUser().getTelephone()%>
    <br/><br/>
    <font style="margin-left: 20px">电影：</font>
    <%=bills.get(i).getRoom().getMovieOn()%>
    <br/><br/>
    <font style="margin-left: 20px">实付金额：</font>
    <%=bills.get(i).getMoney()%>
    <br/><br/>
    <font style="margin-left: 20px">订单时间：</font>
    <%=bills.get(i).getPaytime()%>
    <br/><br/>
    <font style="margin-left: 20px">场次：</font>
      <%=bills.get(i).getRoom().getNum()%>&emsp;
    <%=bills.get(i).getRoom().getUseTime()%>
    <br/>
    <input style="margin-left: 700px" type="submit" id="btn_delbill" value="取消订单">
  </form>
</div>
<%}%>
<%}%>
<%--到数据库中检查是否符合退订要求，符合跳转到退款成功界面
javascript:window.location.href='http://localhost:8080/WebApp1_war_exploded/refundok.jsp';--%>
<%--退款失败网址链接
javascript:window.location.href='http://localhost:8080/WebApp1_war_exploded/refundfail.jsp';--%>
</body>
</html>
