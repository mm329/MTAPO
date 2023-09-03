<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.util.*" %>
<%@page import="hibernate.util.Methods" %>
<%@page import="hibernate.entity.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <style>
        <%@include file="/WEB-INF/css/production.css" %>
    </style>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script language="javascript" type="text/javascript">
        var xmlHttp
        var xmlHttp

        function showTeacher(str) {
            if (typeof XMLHttpRequest != "undefined") {
                xmlHttp = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (xmlHttp == null) {
                alert("Browser does not support XMLHTTP Request")
                return;
            }
            var url = "ajaxFile.jsp";
            url += "?prof=" + str;
            xmlHttp.onreadystatechange = stateChange2;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }

        function stateChange2() {
            if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                document.getElementById("theme").innerHTML = xmlHttp.responseText
            }
        }

        function fncSubmit() {
            if (document.ChooseThemes.teacher.value == "") {
                swal("Oops", "Please choose the teacher!", "error");
                document.ChooseThemes.teacher.style.border = "3px solid red";
                document.ChooseThemes.teacher.focus();
                return false;
            }

            if (document.ChooseThemes.theme.value == "") {
                swal("Oops", "Please choose a theme!", "error");
                document.ChooseThemes.theme.style.border = "3px solid red";
                document.ChooseThemes.theme.focus();
                return false;
            }

            document.ChooseThemes.submit();
        }
    </script>
    <title>Choose Themes</title>
</head>

<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Student Page</h2>
    </center>
</div>

<jsp:include page="studentMenu.jsp"></jsp:include>

<body>
<form action="ChooseThemes" method="post" name="ChooseThemes" onSubmit="return fncSubmit();">
    <div class="content-area">
        <div class="panel">
            <div class="title">
                Choose Themes
            </div>
            <%String message = (String) request.getAttribute("Message"); %>
            <%= message != null ? message : ""%>
            <table>
                <tr>
                    <td><label>Choose the teacher</label></td>
                    <td colspan="3">
                        <select name="teacher" id="teacher" class="text" onchange="showTeacher(this.value)">
                            <option value="" selected>Select</option>
                            <%
                                int userId = (int) request.getSession().getAttribute("userId");
                                Methods m = new Methods();
                                List<Themes> list = m.getListOfTeacher();
                                for (Themes u : list) {
                            %>
                            <option value="<%=u.getProfName()%>"><%=u.getProfName()%>
                            </option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Choose the theme</label></td>
                    <td colspan="3">
                        <div id="theme">
                            <select name="theme" id="themeSelect" class='text back-tr'>
                                <option value="" selected>Select</option>
                                <option value=''></option>
                            </select>
                        </div>
                    </td>
                </tr>
            </table>
            <center><input type="submit" class="del" value="Choose" id="chooseBtn" name="submit"></center>

            <input type="hidden" name="userId" value="<%=userId != 0 ? userId : ""%>"/>
            <p id="expiryDate"></p>
            <script language="javascript">

<%--Sa nu apara duplicate--%>
                var optionValues = [];
                $('#teacher option').each(function () {
                    if ($.inArray(this.value, optionValues) > -1) {
                        $(this).remove()
                    } else {
                        optionValues.push(this.value);
                    }
                });


                var countDownDate = new Date("Dec 10, 2023 09:00:00").getTime();
                var x = setInterval(function () {
                    var now = new Date().getTime();
                    var distance = countDownDate - now;
                    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                    document.getElementById("expiryDate").innerHTML = "Au mai ramas " + days + " zile " + hours + " ore "
                        + minutes + " minute si " + seconds + " secunde pana cand expira data alegerii temei!";

                    if (distance < 0) {
                        clearInterval(x);
                        document.getElementById("chooseBtn").disabled = true;
                        document.getElementById("expiryDate").innerHTML = "A expirat data alegerii temei!";
                    }
                }, 1000);
            </script>
        </div>
    </div>
</form>
</body>
</html>