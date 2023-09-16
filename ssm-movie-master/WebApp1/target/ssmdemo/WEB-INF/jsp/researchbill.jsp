<%--
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
    body{
      margin:0 auto;
      background-image: url("/image/greencube.jpg");
    }
    .bottom {
      height: auto;
      width: 800px;
      margin-top: 10px;
      margin-left: auto;
      margin-right: auto;

    }
  </style>
</head>
<body>
<%@include file="headM.jsp"%>
<div class="bottom">
  <form action="gobill" method="post">
    <br/>
    <label style="margin-left: 50px"></label>请输入订单号：
    <input style="width: 500px" type="number" name="bid">
    <input style="margin-left: 20px" type="submit" value="确定">
    <br/><br/>
  </form>
</div>
</body>
</html>
