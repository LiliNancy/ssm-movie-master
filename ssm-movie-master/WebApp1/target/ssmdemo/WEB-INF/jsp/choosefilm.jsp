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
  <title>订票</title>
  <style type="text/css">
    body{
      margin:0 auto;
      background-image: url("/image/greencube.jpg");
    }
    .bottom {
      height: 150px;
      width: 800px;
      margin-top: 10px;
      margin-left: auto;
      margin-right: auto;
      background-color: lightseagreen;
    }
    .right{
      width: 800px;
      height: 150px;
      margin-top: 10px;
      margin-left: auto;
      margin-right: auto;
      background-color: lavender;
    }
  </style>
</head>
<body>
<%@include file="head.jsp"%>
<div class="right">
  <table width="800" height="150">
    <tr>
      <td>类型：</td>
      <td><a href="searchbytype?type=1">爱情</a></td>
      <td><a href="searchbytype?type=2">动作</a></td>
      <td><a href="searchbytype?type=3">喜剧</a></td>
      <td><a href="searchbytype?type=4">恐怖</a></td>
      <td><a href="searchbytype?type=5">科幻</a></td>
      <td><a href="searchbytype?type=6">其他</a></td>
    </tr>
    <tr>
      <form action="searchmovie" method="post">
        <td>查询：</td>
        <td colspan="5">
          <input type="text" name="str">
          <input type="submit" name="sure">
        </td>
      </form>
    </tr>
  </table>

</div>
<%--想办法搞一个循环，有多少个电影就搞多少个--%>
<%--使用<%%>可以在中间写Java代码，可以import java class--%>
<% List<Movie> list = (List<Movie>)request.getAttribute("mlist");
  for(int i=0;i<list.size();i++){%>
<a href="ticketByid?movieid=<%=list.get(i).getMovieid()%>&rid=-1">
  <div class="bottom">
    <font>电影:<%=list.get(i).getMname()%></font><br>
    <font>类型：<%=list.get(i).getType()%></font><br>
    <font>时长：<%=list.get(i).getDuration()%></font><br>
    <font>简介：<%=list.get(i).getIntroduction()%></font>
  </div>
</a>
<%}%>


</body>
</html>
