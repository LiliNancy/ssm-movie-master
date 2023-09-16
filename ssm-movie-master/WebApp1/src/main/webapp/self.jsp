<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022/11/20
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>个人信息</title>
  <style type="text/css">
    body{
      margin: 0 auto;
      background-image: url("/image/greencube.jpg");
    }
    .top {
      height: 80px;
      width: 700px;
      font-size:40px;
      margin-left: 280px;
    }
    .center {
      height: 30px;
      width: 800px;
      margin-left: auto;
      margin-right: auto;
      background-color: burlywood;
    }
    .right{
      width: 800px;
      height: 400px;
      margin-top: 10px;
      margin-left: auto;
      margin-right: auto;
      font-size: 15px;
      background-color: lavender;
    }
    .small{
      width: 150px;
      margin-left: 10px;
      margin-top: 20px;
      font-size: 8px;
      float: right;
      background-color: rgba(23,196,255,0.59)
    }
  </style>
</head>
<body>
<%@include file="head.jsp"%>
<%User u=(User) session.getAttribute("user");%>
<div class="right">
  <br/>
  <font style="font-size: 25px">&emsp;&emsp;欢迎用户~~<br/></font>
  <br/>
  <br/>
  <font style="margin-left: 60px">用户名： </font>
  <%=u.getUsername()%>
  <br/><br/>
  <font style="margin-left: 60px">手机号：</font>

  <%=u.getTelephone()%>
  <br/><br/>
  <font style="margin-left: 60px">邮&emsp;箱：</font>
  <%=u.getEmail()%>
  <br/><br/>
  <form action="secuser" method="post">
  <font style="margin-left: 60px">密码修改:&emsp;</font>
  <input type="password" name="pwd">
  <button id="changesec" type="submit" onclick="SecretChange()">确认</button>
  </form>
  <br/>
  <label style="color: crimson;margin-left: 60px" id="note">&emsp;</label>
</div>
<script>
  function SecretChange(){
    <%-- 完成数据库中密码的修改,并提示修改成功或修改失败--%>
    var label=document.getElementById("note");
    label.innerHTML="修改成功";
  }
</script>
</body>
</html>
