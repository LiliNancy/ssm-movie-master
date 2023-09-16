<%@ page import="org.example.entity.Manager" %><%--
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
  <title>首页</title>
  <style type="text/css">
    body{
      margin:0 auto;
      background-color:#FFF;
    }
    table{
      border-collapse: collapse;/*让靠在一起的单元格只显示一个边框，边框不进行叠加*/
    }
    a{
      text-decoration : none;
    }
    A:visited {
      text-decoration: none;
      color: black;
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
<% Manager manager=(Manager) session.getAttribute("manager");%>
<div class="top">
  <img src="../image/test.jpg" width="60" height="60">
  <font>电影订票系统</font>
  <div class="small">
    <table width="150" height="50" border="0">
      <tr>
        <td colspan="2" style="text-align: left;">欢&emsp;迎~~</td>
      </tr>
      <tr>
        <td>用&emsp;户：
          <%=manager.getUserid()%>
        </td>

        <td> &emsp;&emsp; </td>
      </tr>
    </table>
  </div>
</div>
<%
  int cur=-1;
  cur = manager.getAdminid();
%>
<div class="center">
  <table width="800" height="30" border="1">
    <tr>
      <td colspan="2" style="text-align: center;"><a
              href="http://localhost:8080/WebApp1_war_exploded/logokM.jsp?adminid=<%=cur%>">电影上架</a>
      </td>
      <td colspan="2" style="text-align: center;"><a
              href="allmoviechange">电影更新</a>
      </td>
      <td colspan="2" style="text-align: center;"><a
              href="http://localhost:8080/WebApp1_war_exploded/researchbill.jsp?adminid=<%=cur%>">订单查询</a>
      </td>
      <td colspan="2" style="text-align: center;"><a
              href="http://localhost:8080/WebApp1_war_exploded/selfM.jsp?adminid=<%=cur%>">个人中心</a>
      </td>
    </tr>
  </table>
</div>

</body>
</html>
