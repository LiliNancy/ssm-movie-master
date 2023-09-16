<%@ page import="org.example.entity.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %><%--
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
            height: 300px;
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
        .left{
            width: 800px;
            height: 400px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
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
<div class="bottom">
    <table width="800" height="200">
        <tr>
            <td><img src="${movie.url}" width="160" height="220"  style="margin-top: 50px;margin-left: 50px"></td>
            <td>
                <table width="500" height="200">
                    <tr><td>电影名：${movie.mname}</td></tr>
                    <tr><td>电影简介：${movie.introduction}</td></tr>
                </table>
            </td>
        </tr>
    </table>
    <%--导入电影相关信息，文字部分改在电影名和电影简介那里--%>
</div>
<div class="right">
    <table width="800" height="150">
        <tr>
            <td>场次选择：</td>
        </tr>
        <tr>
            <%--导入场次相关信息,继续写后面就行，可以使用button，但是要根据选择的场次，再对下面的
            button颜色进行变换，现在就都是绿色的，选上就是深绿的，应该做到已经订票的位置是红色的--%>
            <%
                int buynum=0;
                List<Room> rl = (List)request.getAttribute("rlist");
                int rid = (int)request.getAttribute("rid");
                HashMap<Integer, List<Integer>> sl = (HashMap<Integer, List<Integer>>) request.getAttribute("slist");
                List<Integer> tessl = null;
                if(sl.containsKey(rid)){
                    tessl = sl.get(rid);
                }
                Room cur = null;
                for(int i = 0;i<rl.size();i++){
                    if(rl.get(i).getRid()==rid){
                        cur = rl.get(i);
                    }
                }
                if(rl.size()==0){%><td>暂无排片信息~</td><%}%>
            <%
                for(int i = 0;i<rl.size();i++){

            %>
            <td> <a href="ticketByid?movieid=${movie.movieid}&rid=<%=rl.get(i).getRid()%>" ><%=rl.get(i).getNum()%>号厅<%=rl.get(i).getUseTime()%>开场 票价：<%=rl.get(i).getPrice()%> </a></td>
            <%
                }
            %>
        </tr>
    </table>
</div>

<%if(tessl!=null){%>
<form action="havebuy" method="post" id="subbut">
    <input type="hidden" id="price" name="price">
    <input type="hidden" id="rid" name="rid" value="<%=rid%>">
    <input type="hidden" id="seats" name="seats">
    <div class="left">
        <font style="margin-left: 20px;">座位选择：</font>
        <table width="700" height="350">
            <% for(int i=0;i<5;i++){ %>
            <tr>
                <td>&emsp;</td>
                <% for(int j=0;j<10;j++){
                    String a = "mybn"+(10*i+j);
                    if(tessl.contains(10*i+j)){%>
                <td><button type="button" style="background-color:maroon">
                    (<%=i%>,<%=j%>)</button></td>
                <%}else{
                %>
                <td><button type="button" id = <%=a%> onclick="clbutton(id)" style="background-color: palegreen">
                    (<%=i%>,<%=j%>)</button></td><%}%><%}%>
                <%if(i==4){%><td colspan="10">

                <input type="submit" id="saveInfo" value="提交">
            </td><%}%>
            </tr><%}%>

        </table>
    </div>
</form>

<script>

    let num = 0;
    let pri = <%=cur.getPrice()%>;
    var seats = [];
    function clbutton(id) {
        var tmpd = id.replace(/[^0-9]/ig,"");
        if(document.getElementById(id).style.backgroundColor=='palegreen'){
            document.getElementById(id).style.backgroundColor='lightseagreen';
            seats.push(tmpd);
            num++;
        }
        else if(document.getElementById(id).style.backgroundColor=='lightseagreen'){
            document.getElementById(id).style.backgroundColor='palegreen';
            seats.splice(seats.indexOf(tmpd),1);
            num--;
        }
        var x = document.getElementById('price');
        x.value = num*pri;
        console.log("price change ",x.value);
        var tmp = document.getElementById('seats');
        tmp.value = seats.toString();
    }
    function sform(){
        if(num==0){
            alert("请选择座位");
            return false;
        }
        else{
            console.log("price:",document.getElementById("price"),"  seats",document.getElementById("seats"),"  rid",document.getElementById("rid"));
            return false;
        }
    }
    // $('#saveInfo').click(function(){
    //     if(num===0){
    //         alert("请选择座位");
    //         return false;
    //     }
    //     else{
    //         var formData = new FormData();
    //         formData.append("seats",seats.toString());
    //         console.log("test",JSON.stringify(seats),seats);
    //         formData.append("price",num*pri);
    <%--        formData.append("rid",<%=rid%>);--%>
    //         $.ajax({
    //             type:'post',
    //             dataType:'json',
    //             url:'havebuy',
    //             data:formData,
    //             contentType:false,
    //             processData:false,
    //             success:function(result){
    //                 console.log(result);
    //             },
    //             error:function(data){
    //                 alert("操作异常");
    //             }
    //         });
    //         return true;
    //     }
    // });

</script>

<%}%>
</body>
</html>
