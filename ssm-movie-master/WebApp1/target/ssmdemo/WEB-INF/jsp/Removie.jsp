<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>电影更新</title>
    <style type="text/css">
        body{
            margin:0 auto;
            background-image: url("/image/greencube.jpg");
        }
        .left{
            width: 800px;
            height: auto;
            margin-left: auto;
            margin-right: auto;
            margin-top: 20px;
            background-color: white;
        }
    </style>
</head>
<body>
<%@include file="headM.jsp"%>
<% List<Movie> moall= (List<Movie>) session.getAttribute("allmovie");%>
<div class="left">
    <br/>
    <%for(int i=0;i<moall.size();i++){%>
    <%--把电影名称四个字替换成真正的电影的名称,循环次数由数据库中电影个数决定--%>
    <form id="form<%=i%>" method="post">
        <input type="hidden" name="gowhere" value="<%=i%>"/>
        <label style="margin-left: 20px" id="movie<%=i%>" ><%=moall.get(i).getMname()%></label>
        <input type="button" style="margin-left: 50px" onclick="act1(<%=i%>)" value="电影基础信息修改 "/>
        <input type="button" style="margin-left: 50px" onclick="act2(<%=i%>)" value="电影排片情况添加 "/>
    </form>
    <br/><br/>
    <%}%>
    <label id="test"></label>
</div>
<script>
    function act1(i){
        document.forms[i].action="ChangePage1";
        document.forms[i].submit();
    }
    function act2(i){
        document.forms[i].action="ChangePage2";
        document.forms[i].submit();
    }
</script>
</body>
</html>
