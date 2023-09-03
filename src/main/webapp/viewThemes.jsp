<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.util.List" %>
<%@page import="hibernate.util.Methods" %>
<%@page import="hibernate.entity.Themes" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <style>
        <%@include file="/WEB-INF/css/production.css" %>
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>View Themes</title>
</head>
<script language="javascript">
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Admin Dashboard</h2>
    </center>
</div>

<jsp:include page="adminMenu.jsp"></jsp:include>

<body>

<form action="" method="post">

    <div class="content-area">
        <div class="panel">
            <div class="title">
                View Themes
            </div>
            <input id="myInput" type="text" placeholder="Search..">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Theme Name</th>
                    <th>Teacher Name</th>
                </tr>
                </thead>
                <tbody id="myTable">
                <%
                    Methods methods = new Methods();
                    List<Themes> list = methods.getListOfThemes();
                    int i = 0;
                    for (Themes u : list) {
                        i++;
                %>
                <tr>
                    <td><%=i%>
                    </td>
                    <td><%=u.getName()%>
                    </td>
                    <td><%=u.getProfName()%>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
            <br/>
        </div>
    </div>

</form>
</body>
</html>