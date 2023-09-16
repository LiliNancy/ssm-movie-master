<%--
  Created by IntelliJ IDEA.
  User: 12726
  Date: 2022/11/07
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>支付成功</title>
  <style type="text/css">
    body{
      background: url("/image/greencube.jpg");
    }
    div {
      width: 348px;
      height: 210px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 150px;
      background: gainsboro;
    }
  </style>
</head>
<%int xxx=0;%>
<body>
<div>
    <%--这里的xxx元应该是真实的应付金额，根据购票数量已经票价算出--%>
    <%--获得定义的变量的值方法如下--%>
    </br></br></br>
     <font style="margin-left: 70px">恭喜用户支付&emsp;${sum}&emsp;元成功!</font>
    </br></br></br>
      <a href="http://localhost:8080/WebApp1_war_exploded/logok.jsp">
      <button style="margin-left: 150px">返回</button></a>
        <%--返回跳转到首页--%>
  </form>
</div>
</body>
</html>
