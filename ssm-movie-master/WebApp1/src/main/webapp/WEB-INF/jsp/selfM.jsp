<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022/11/20
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>个人中心</title>
  <style type="text/css">
    body{
      margin:0 auto;
      background-image: url("/image/greencube.jpg");
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
  </style>
</head>
<body>
<%@include file="headM.jsp"%>
<%Manager man=(Manager) session.getAttribute("manager");%>
<div class="right">
  <br/>
  <font style="font-size: 25px">&emsp;&emsp;欢迎用户~~<br/></font>
  <br/>
  <br/>
  <font style="margin-left: 60px">用户名：</font>
  <%=man.getUserid()%>
  <br/><br/>
  <font style="margin-left: 60px">手机号：</font>
  <%=man.getphone()%>
  <br/><br/>
  <font style="margin-left: 60px">邮&emsp;箱：</font>
  <%=man.getEmail()%>
  <br/><br/>
  <form action="secchange" method="post">
  <font style="margin-left: 60px">密码修改:&emsp;</font>
  <input type="password" name="pwd">
  <button id="changesec" type="submit" onclick="SecretChange()">确认</button>
  </form>
  <br/>
  <label style="color: crimson;margin-left: 60px" id="note">&emsp;</label>
  <br/><br/><br/><br/><br/><br/>
  <button id="regM" onclick="registerMan()" style="margin-left: 600px;font-size: 15px">添加管理员</button>
</div>
<script>
  function SecretChange(){
    <%-- 完成数据库中密码的修改,并提示修改成功或修改失败--%>
    var label=document.getElementById("note");
    label.innerHTML="修改成功";
  }
  function registerMan(){
    <%--跳转到管理员注册界面--%>
    javascript:window.location.href='http://localhost:8080/WebApp1_war_exploded/regM.jsp?adminid=${param.adminid}';
  }
</script>
</body>
</html>
