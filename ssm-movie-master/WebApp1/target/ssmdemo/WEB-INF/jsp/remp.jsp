<%@ page import="org.example.entity.Movie" %>
<%@ page import="javax.swing.text.Document" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022/11/25
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>电影基础信息修改</title>
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
    <%--在下面所有的input中，其value值应该是对应电影的存在数据库中的内容--%>
    <form action="ChangeMovieInfo" method="post">
        <br/>
        <font style="margin-left: 50px">电影名称：</font>
        <input style="width: 200px;margin-left: 20px" type="text" name="moviename" value="<%=mm.getMname()%>">
        <br/><br/>
        <font style="margin-left: 50px">电影简介：</font>
        <input name="movieintro" style="width: 500px" value="<%=mm.getIntroduction()%>">
        <br/><br/>
        <font style="margin-left: 50px">电影导演：</font>
        <input style="width: 200px;margin-left: 20px" type="text" name="moviedir" value="<%=mm.getDirector()%>">
        <font style="margin-left: 50px">电影主演：</font>
        <input style="width: 200px;margin-left: 20px" type="text" name="moviedactor" value="<%=mm.getPerformer()%>">
        <br/><br/>
        <font style="margin-left: 50px">电影类型：</font>
        <%--<input name="kinds" type="radio" value="爱情">爱情
        <input name="kinds" type="radio" value="动作">动作
        <input name="kinds" type="radio" value="喜剧">喜剧
        <input name="kinds" type="radio" value="恐怖">恐怖
        <input name="kinds" type="radio" value="科幻">科幻--%>
        <select name="kinds" style="width: 210px;height: 25px;margin-left: 20px">
            <option value="爱情" id="爱情">爱情</option>
            <option value="动作" id="动作">动作</option>
            <option value="喜剧" id="喜剧">喜剧</option>
            <option value="恐怖" id="恐怖">恐怖</option>
            <option value="科幻" id="科幻">科幻</option>
            <option value="其他" id="其他">其他</option>
            <option value="<%=mm.getType()%>" selected="selected"><%=mm.getType()%></option>
        </select>

        <font style="margin-left: 50px">电影时长：</font>
        <input style="width: 140px;margin-left: 20px" type="text" name="moviedtext" value="<%=mm.getDuration()%>">
        <font style="margin-left: 20px">分钟</font>
        <!--区间内为增加的-->
        <br/><br/>
        <font style="margin-left: 50px">电影图片：</font>
        <input style="width: 400px;margin-left: 20px" type="text" name="urll" value="<%=mm.getUrl()%>">
        <!--区间内为增加的-->
        <br/><br/><br/>
        <input type="submit" style="margin-left: 600px;width: 100px;
    height: 35px;font-size: 15px" value="修改">
    </form>
    <script type="text/javascript">
        function chan(tt){
            document.getElementById(tt).selected=true;
        }
    </script>
</div>
</body>
</html>
