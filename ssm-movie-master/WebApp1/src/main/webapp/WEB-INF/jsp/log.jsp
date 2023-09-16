<%--
  Created by IntelliJ IDEA.
  User: 12726
  Date: 2022/11/07
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <style type="text/css">
        body{
            background: url("/image/greencube.jpg");
        }
        table{
            border-collapse: collapse;/*让靠在一起的单元格只显示一个边框，边框不进行叠加*/
        }
        div {
            width: 339px;
            height: 203px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 150px;
            background: gainsboro;
        }
    </style>
</head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<body>
<div>
    <form action="golog" method="post">
        <table width="10" height = "200" border="1">
            <tr>
                <th>
                    <a href="http://localhost:8080/WebApp1_war_exploded/log.jsp">用&emsp;户</a>
                    <%--                <a href="<%=basePath%>ass_forward.jsp">用&emsp;户</a>--%>
                </th>
                <td rowspan="2">
                    <table width="300" height="200" border="0" >
                        <tr>
                            <td>&emsp;手机号:</td>
                            <td><input type="text" name="telephone"></td>
                        </tr>
                        <tr>
                            <td>&emsp;密&emsp;码:</td>
                            <td><input type="password" name="userpwd"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;"><input
                                    type="submit" value="登录"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;"><a
                                    href="http://localhost:8080/WebApp1_war_exploded/reg.jsp">还没有账号？点此注册</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <th>
                    <a href="http://localhost:8080/WebApp1_war_exploded/Mlog.jsp">管理员</a>
                </th></tr>
        </table>
    </form>
</div>
</body>
</html>
