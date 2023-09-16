<%--
  Created by IntelliJ IDEA.
  User: 12726
  Date: 2022/11/07
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<div>
    <form action="goreg" name="reg" method="post" id="subform" onsubmit="return check()">
        <font>&emsp;&emsp;&emsp;&emsp;</font>
        <img src="/image/test.jpg" width="50" height="50">
        <br/>
        <font style="font-size: 30px">&emsp;新用户注册</font>
        <br/>
        <br/>
        用户名&emsp;：&emsp;
        <input type="text" name="username" id="username"><br/><br/>
        密&emsp;码&emsp;：&emsp;
        <input type="password" name="userpwd" id="password"><br/><br/>
        确认密码：&emsp;
        <input type="password" name="reuserpwd" id="repassword"><br/><br/>
        手机号&emsp;：&emsp;
        <input type="text" name="telephone" id="phone"><br/><br/>
        邮&emsp;箱&emsp;：&emsp;
        <input type="text" name="email" id="email"><br/><br/>
        <input type="submit" id ="btn" style="margin-left: 120px" value="注册">

    </form>
    <script>

        function check(){
            // var name = $("username").val()
            var name = document.getElementById("username").value;
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
