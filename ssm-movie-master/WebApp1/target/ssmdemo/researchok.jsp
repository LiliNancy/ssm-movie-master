<%@ page import="org.example.entity.Bill" %>
<%@ page import="org.example.entity.Movie" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022/11/20
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>订单查询</title>
  <style type="text/css">
    .right{
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
<%--如果复用网站，连style信息也会复用--%>
<%@include file="researchbill.jsp"%>
<% Bill bill=(Bill) session.getAttribute("bill");%>
<div class="right">
    <%--大概要录入这些信息，需要从数据库获取--%>
    <br/>
    <font style="margin-left: 20px">订单编号：</font>
        <%=bill.getBid()%>
    <br/><br/>
    <font style="margin-left: 20px">手机号：</font>
        <%=bill.getUser().getTelephone()%>
    <br/><br/>
    <font style="margin-left: 20px">电影：</font>
        <%=bill.getRoom().getMovieOn()%>
    <br/><br/>
    <font style="margin-left: 20px">实付金额：</font>
        <%=bill.getMoney()%>
    <br/><br/>
    <font style="margin-left: 20px">订单时间：</font>
        <%=bill.getPaytime()%>
    <br/><br/>
    <font style="margin-left: 20px">场次：</font>
        <%=bill.getRoom().getNum()%>&emsp;
        <%=bill.getRoom().getUseTime()%>
</div>
</body>
</html>
