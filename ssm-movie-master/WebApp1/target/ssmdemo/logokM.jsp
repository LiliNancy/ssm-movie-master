<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022/11/20
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--import 别的java类--%>
<%@ page import="org.example.entity.Movie"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>电影上架</title>
    <style type="text/css">
        body{
            margin:0 auto;
            background-image: url("/image/greencube.jpg");
        }
        .bottom {
            height: auto;
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
<form action="addMovie" method="post" id="newMovieForm">
    <div class="bottom">
        <br/>
        <font style="margin-left: 50px">电影名称：</font>
        <input style="width: 200px;margin-left: 20px" type="text" name="mname" id="moviename">
        <br/><br/>
        <font style="margin-left: 50px">电影简介：</font>
        <br/>
        <textarea name="introduction" cols="80" rows="10" style="margin-left: 120px">
    </textarea>
        <br/><br/>
        <font style="margin-left: 50px">电影导演：</font>
        <input style="width: 200px;margin-left: 20px" type="text" id="moviedir" name="director">
        <font style="margin-left: 50px">电影主演：</font>
        <input style="width: 200px;margin-left: 20px" type="text" id="moviedactor" name="performer">
        <br/><br/>
        <font style="margin-left: 50px">电影类型：</font>
        <select id="kinds" style="width: 210px;height: 25px;margin-left: 20px" name="type">
            <option value="爱情">爱情</option>
            <option value="动作">动作</option>
            <option value="喜剧">喜剧</option>
            <option value="恐怖">恐怖</option>
            <option value="科幻">科幻</option>
            <option value="其他">其他</option>
        </select>
        <font style="margin-left: 50px">电影时长：</font>
        <input style="width: 140px;margin-left: 20px" type="text" id="moviedtext" name="duration">
        <font style="margin-left: 20px">分钟</font>
        <br/>
        <%--这几个类型算是我随便给的吧，可以看看是不是有更合适的分法--%>
        <br/><br/>
        <font style="margin-left: 50px">电影图片：</font>
        <input style="width: 400px;margin-left: 20px" type="text" name="url"><br/>
        <%--以下区间内为新增的，可以插入图片地址--%>
        <font style="margin-left: 50px">场次信息：</font>
        <br/>
        <%--做到加入一行记录，表格实时变化(已解决)，对应总记录数，最后数据库会存入全部信息增加--%>
        <%--还有就是数据库中的一些数据应该是不必要的，例如排片信息的座位和影院，为了简便，
        我们默认了只有一家影院，座位情况一致--%>
        <%--当然，如果你想尝试更复杂的可以加上--%>
        <input style="margin-left: 100px" type="text" id="id" placeholder="请输入编号">
        <input type="text" id="day" placeholder="请输入日期">
        <input type="text" id="time" placeholder="请输入时间">
        <br/>
        <input style="margin-left: 140px" type="text" id="room" placeholder="请输入放映厅">
        <input type="text" id="price" placeholder="请输入价格">
        <input type="button" id="btn_add" value="添加" >

        <table width="600px" style="margin-left: 100px" border="1px" id="tableneed">
            <caption>排片信息</caption>
            <tr>
                <th>编号</th>
                <th>日期</th>
                <th>时间</th>
                <th>放映厅</th>
                <th>票价</th>
                <th>操作</th>
            </tr>
            <%--    <%for(int i=0;i<=6;i++){%>--%>
            <%--    <tr>--%>
            <%--        <td><%=i+1%></td>--%>
            <%--        <td>日期</td>--%>
            <%--        <td>时间</td>--%>
            <%--        <td>放映厅</td>--%>
            <%--        <td>票价</td>--%>
            <%--        <td><a href="javascript:void(0);" onclick="delTr(this);">删除</a> </td>--%>
            <%--    </tr>--%>
            <%--    <%}%>--%>
        </table>
        <br/><br/><br/><br/>
        <button id="addMoviebt" onclick="AddMovie()" style="margin-left: 600px;width: 100px;
    height: 35px;font-size: 15px">上架</button>
        <br/><br/><br/><br/>
    </div>
    <script>
        /*
    分析：
      1、添加
         （1）给添加按钮绑定单击事件
         （2）获取文本框的内容
         （3）创建tr、td，设置td的文本框的内容
         （4）创建tr
         （5）将td添加到tr中
         （6）获取table，将tr添加到table中
      2、删除
         （1）确定点击的是哪一个超链接
         <a href="javascript:void(0);"  onclick="delTr(this);">
         （2）怎么删除
            removeChild():通过父节点删除子节点
      */
        document.getElementById("btn_add").onclick = function() {
            //2、获取文本框的内容
            var id =  document.getElementById("id").value;
            var day = document.getElementById("day").value;
            var time = document.getElementById("time").value;
            var room = document.getElementById("room").value;
            var price = document.getElementById("price").value;
            //获取table
            var talbe = document.getElementById("tableneed");
            //追加一行
            talbe.innerHTML += " <tr>\n" +
                "            <td>"+id+"</td>\n" +
                "            <td>"+day+"</td>\n" +
                "            <td>"+time+"</td>\n" +
                "            <td>"+room+"</td>\n" +
                "            <td>"+price+"</td>\n" +
                "            <td><a href=\"javascript:void(0);\"  onclick=\"delTr(this);\">删除</a> </td>\n" +
                "        </tr>";
        }

        //删除方法
        function delTr(obj){
            var table = obj.parentNode.parentNode.parentNode;
            var tr = obj.parentNode.parentNode;
            table.removeChild(tr);
        }
        function AddMovie(){
            <%--添加记录到对应的表格里,涉及到排片表和电影表，跳转到添加成功的提示界面--%>
            // javascript:window.location.href='http://localhost:8080/WebApp1_war_exploded/MovieSucc.jsp';
            var tablelist = document.getElementById("tableneed");
            var data = [];
            for(var i = 0,rows=tablelist.rows.length;i<rows;i++){
                for(var j = 0,cells=tablelist.rows[i].cells.length;j<cells;j++){
                    if(data[i]==null){
                        data[i] = new Array();
                    }
                    data[i][j] = tablelist.rows[i].cells[j].innerHTML;
                }
            }
            alert(data)
            var formele = document.getElementById("newMovieForm");
            for(var i = 0;i<data.length-1;i++){
                var listele = document.createElement("INPUT");
                listele.type = "hidden";
                listele.value = data[i+1][0];
                listele.name = "roomList["+i+"].Rid";
                var listele2 = document.createElement("INPUT");
                listele2.type = "hidden";
                listele2.value = data[i+1][1] + "-"+data[i+1][2];
                listele2.name = "roomList["+i+"].useTime";
                var listele3 = document.createElement("INPUT");
                listele3.type = "hidden";
                listele3.value = data[i+1][3];
                listele3.name = "roomList["+i+"].num";
                var listele4 = document.createElement("INPUT");
                listele4.type = "hidden";
                listele4.value = data[i+1][4];
                listele4.name = "roomList["+i+"].price";
                var listele5 = document.createElement("INPUT");
                listele5.type = "hidden";
                listele5.value = -1;
                listele5.name = "roomList["+i+"].movieOn";
                formele.appendChild(listele);
                formele.appendChild(listele2);
                formele.appendChild(listele3);
                formele.appendChild(listele4);
                formele.appendChild(listele5);
            }

        }
    </script>
</form>
</body>
</html>
