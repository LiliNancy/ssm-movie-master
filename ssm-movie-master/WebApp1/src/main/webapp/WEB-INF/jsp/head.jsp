<%@ page import="org.example.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022/11/20
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <style type="text/css">
        body{
            margin:0 auto;
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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%User uu=(User) session.getAttribute("user");%>
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
                    <%=uu.getUsername()%>
                </td>
                <td> &emsp;&emsp; </td>
                <%--每一页的这里都要修改，插入登录用户的用户名--%>
            </tr>
        </table>
    </div>
</div>
<%
    String curuser = "";
    curuser = uu.getTelephone();
%>
<div class="center">
    <table width="800" height="30" border="1">
        <tr>
            <td colspan="2" style="text-align: center;"><a
                    href="http://localhost:8080/WebApp1_war_exploded/logok.jsp?id=<%=curuser%>">首&emsp;&emsp;页</a>
            </td>
            <td colspan="2" style="text-align: center;"><a
            <%--                    href="http://localhost:8080/WebApp1_war_exploded/choosefilm.jsp?id=<%=curuser%>">订&emsp;&emsp;票</a>--%>
                    href="allmovielist">订&emsp;&emsp;票</a>
            </td>
            <td colspan="2" style="text-align: center;"><a
                    href="allbilllist">查看订单</a></td>
            <td colspan="2" style="text-align: center;"><a
                    href="http://localhost:8080/WebApp1_war_exploded/self.jsp?id=<%=curuser%>">个人中心</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>