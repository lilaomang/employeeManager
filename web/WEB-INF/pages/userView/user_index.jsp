<%--
  Created by IntelliJ IDEA.
  User: 孙建荣
  Date: 2016/12/5/005
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>用户主页</title>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/script/jquery-3.1.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/script/bootstrap.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script>
        window.onload = function () {
//定时器每秒调用一次fnDate()
            setInterval(function () {
                fnDate();
            }, 1000);
        };
        //js 获取当前时间
        function fnDate() {
            var oDiv = document.getElementById("time");
            var date = new Date();
            var year = date.getFullYear();//当前年份
            var month = date.getMonth();//当前月份
            var data = date.getDate();//天
            var hours = date.getHours();//小时
            var minute = date.getMinutes();//分
            var second = date.getSeconds();//秒
            var time = year + "-" + fnW((month + 1)) + "-" + fnW(data) + " " + fnW(hours) + ":" + fnW(minute) + ":" + fnW(second);
            oDiv.innerHTML = time;
        }
        //补位 当某个字段不是两位数时补0
        function fnW(str) {
            var num;
            str > 10 ? num = str : num = "0" + str;
            return num;
        }
        $(function () {
            $("#exit").click(function () {
                var username = $("#username").text();
                var flag = confirm(username + "你确定要退出吗？");
                if (!flag) {
                    return false;
                }
                else {
                    window.parent.location.href = "${pageContext.request.contextPath}/";
                }
            });
            $("#Punch").click(function () {
                var username="${username}";
                alert("我在测试");
                $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/employee/punch",
                            success:function(result){
                                if(result === "true"){
                                    alert("可以签到");
                                }
                                else if(result === "false"){
                                    alert("还不能签到现在");
                                }
                            }
                        }
                )
            });
        })

    </script>
</head>
<body>
现在是<h3><span id="time"></span></h3>
<hr>
<h3>${username}</h3>，欢迎您 <a href="${pageContext.request.contextPath}/user/Logout" id="exit">安全退出</a>
<hr>
<a href="${pageContext.request.contextPath}/employee/viewEmployeeDetail/${id}">个人中心</a>
<a href="#" id="Punch">签到</a>

</body>
</html>
