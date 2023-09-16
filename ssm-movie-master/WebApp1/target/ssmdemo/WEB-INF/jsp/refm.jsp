<%@ page import="org.example.entity.Movie" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022/11/25
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>电影排片情况添加</title>
    <style type="text/css">
        body{
            margin:0 auto;
            background-image: url("/image/greencube.jpg");
        }
        .bottom {
            height: 455px;
            width: 800px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: lavender;
            font-size: 15px;
        }
    </style>
</head>
<body>
<%@include file="headM.jsp"%>
<%Movie mm=(Movie) session.getAttribute("ChooseOne");%>
<div class="bottom">
    <form action="AddMovieInfo" method="post">
        <input type="hidden" value="<%=mm.getMovieid()%>" name="Mid">
        <input type="hidden" value="<%=mm.getDuration()%>" name="Duration">
        <br/><br/>
        <%--应换成选中的电影的名称--%>
        <font style="font-size: 20px;margin-left: 100px"><%=mm.getMname()%></font>
        <font style="font-size: 20px">排片信息添加</font>
        <br/>
        <font style="font-size: 12px;margin-left: 100px;color: crimson">备注：因为上架电影可能会出现用户订票情况，
            所以不允许对排片情况进行事后修改。相关工作人员请谨慎进行排片信息的录入</font>
        <br/><br/>
        <font style="margin-left: 100px">日期：</font>
        <input style="width: 200px;margin-left: 20px" type="text" name="moviedate">
        <br/><br/><br/>
        <font style="margin-left: 100px">时间：</font>
        <input style="width: 200px;margin-left: 20px" type="text" name="moviestime">
        <br/><br/><br/>
        <font style="margin-left: 100px">放映厅：</font>
        <input style="width: 200px;margin-left: 5px" type="text" name="movieplace">
        <br/><br/><br/>
        <font style="margin-left: 100px">票价：</font>
        <input style="width: 200px;margin-left: 20px" type="text" name="movieprice">
        <br/><br/><br/>
        <input type="submit" style="margin-left: 600px;width: 100px;
    height: 35px;font-size: 15px" value="添加">
    </form>
</div>
</body>
</html>
