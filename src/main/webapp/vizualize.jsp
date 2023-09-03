<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.util.*" %>
<%@page import="hibernate.util.Methods" %>
<%@page import="hibernate.entity.Themes" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <style>
        <%@include file="/WEB-INF/css/production.css" %>
    </style>
    <title>View Themes</title>
</head>

<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Student Dashboard</h2>
    </center>
</div>

<jsp:include page="studentMenu.jsp"></jsp:include>

<body>
<form action="" method="post">
    <center>
        <div class="content-area">
            <div class="panel">
                <div class="title">
                    View Themes
                </div>
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Theme Name</th>
                        <th>Teacher Name</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        Methods methods = new Methods();
                        List<Themes> list = methods.getListOfThemes();
                        int i = 0;
                        for (Themes u : list) {
                            i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=u.getName()%></td>
                        <td><%=u.getProfName()%></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
                <br/>
            </div>
        </div>
    </center>
</form>
</body>
</html>