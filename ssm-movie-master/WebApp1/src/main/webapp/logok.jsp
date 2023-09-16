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
    <title>首页</title>
    <style type="text/css">
        body{
            margin:0 auto;
            background-image: url("/image/greencube.jpg");
        }
        .right{
            width: 800px;
            height: 250px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: deepskyblue;
        }
        .left{
            width: 800px;
            height: 500px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: lavender;
        }
    </style>
</head>
<body>
<%@include file="head.jsp"%>
<%
    List<Movie> mlist = (List<Movie>) session.getAttribute("allmovie");
    if(mlist==null) System.out.println("test11null");
    System.out.println("testsize"+mlist.size());

%>
<%--首页设计--%>
<div class="left">
    <a href="ticketByid?movieid=<%=mlist.get(0).getMovieid()%>&rid=-1">
        <img src="<%=mlist.get(0).getUrl()%>" width="700" height="400"  style="margin-top: 50px;margin-left: 50px">
        <%--插入数据库中电影图片--%>
    </a>
</div>
<div class="right">
    <a href="ticketByid?movieid=<%=mlist.get(1).getMovieid()%>&rid=-1">
        <img src="<%=mlist.get(1).getUrl()%>" width="150" height="150"  style="margin-top: 50px;margin-left: 40px">
        <%--插入数据库中电影图片--%>
    </a>
    <a href="ticketByid?movieid=<%=mlist.get(2).getMovieid()%>&rid=-1">
        <img src="<%=mlist.get(2).getUrl()%>" width="150" height="150"  style="margin-top: 50px;margin-left: 40px">
        <%--插入数据库中电影图片--%>
    </a>
    <a href="ticketByid?movieid=<%=mlist.get(3).getMovieid()%>&rid=-1">
        <img src="<%=mlist.get(3).getUrl()%>" width="150" height="150"  style="margin-top: 50px;margin-left: 40px">
        <%--插入数据库中电影图片--%>
    </a>
    <a href="ticketByid?movieid=<%=mlist.get(4).getMovieid()%>&rid=-1">
        <img src="<%=mlist.get(4).getUrl()%>" width="150" height="150"  style="margin-top: 50px;margin-left: 40px">
        <%--插入数据库中电影图片--%>
    </a>
</div>
</body>
</html>
