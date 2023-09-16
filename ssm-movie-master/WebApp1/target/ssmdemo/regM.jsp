<%--
  Created by IntelliJ IDEA.
  User: 12726
  Date: 2022/11/07
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <style type="text/css">
        body{
            background-image: url("/image/greencube.jpg");
        }
        div {
            width: 300px;
            height: 200px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<%
    String cur = request.getParameter("adminid");
    System.out.println("cur: "+cur);
%>
<div>
    <form action="goregM" name="regM" id="subform" method="post" onsubmit="return check()">
        <font>&emsp;&emsp;&emsp;&emsp;</font>
        <img src="/image/test.jpg" width="50" height="50">
        <br/>
        <font style="font-size: 30px">&emsp;新用户注册</font>
        <br/>
        <br/>
        用户名&emsp;：&emsp;
        <input type="text" name="userid" id="userid" ><br/><br/>
        密&emsp;码&emsp;：&emsp;
        <input type="password" name="password" id="password" ><br/><br/>
        确认密码：&emsp;
        <input type="password" name="repassword" id="repassword"><br/><br/>
        手机号&emsp;：&emsp;
        <input type="text" name="phone" id="phone"><br/><br/>
        邮&emsp;箱&emsp;：&emsp;
        <input type="text" name="email" id="email"><br/><br/>
        地&emsp;址&emsp;：&emsp;
        <input type="text" name="address" id="address"><br/><br/>
        身份证号：&emsp;
        <input type="text" name="id" id="id"><br/><br/>
        <%--        <button id ="lognew" style="margin-left: 120px">注册</button>--%>
        <input type="hidden" name="guarantorID" value=${param.adminid} id="guarantorID">
        <td style="text-align:center;"><input type="submit" id="btn" value="注册">
    </form>
    <script>
        function check(){

            var gid = document.getElementById("guarantorID").value;
            //
            if(gid===-1){
                alert("没有权限");
                return false;
            }
            alert("test "+gid);
            var name = document.getElementById("userid").value;
            if(name.length===0){
                alert("请输入用户名");
                return false;
            }
            // var pwd = $(userpwd).val()
            var pwd = document.getElementById("password").value;
            if(pwd.length===0){
                alert("请输入密码");
                return false;
            }
            // var repwd = $(reuserpwd).val()
            var repwd = document.getElementById("repassword").value;
            if(repwd.length===0){
                alert("请再次输入密码");
                return false;
            }
            // var tel = $(telephone).val()
            var tel = document.getElementById("phone").value;
            if(tel.length===0){
                alert("请输入电话");
                return false;
            }
            // var email = $(email).val();
            var email = document.getElementById("email").value;
            if(email.length===0){
                alert("请输入邮箱");
                return false;
            }
            var id = document.getElementById("id").value;
            if(id.length===0) {
                alert("请输入身份证号");
                return false;
            }
            var address = document.getElementById("address").value;
            if(address.length===0){
                alert("请输入地址");
                return false;
            }
            if(pwd!==repwd){
                alert("两次密码输入不一致");
                return false;
            }
            else{

                return true;
            }

        }
    </script>
</div>
</body>
</html>
