<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.util.List" %>
<%@page import="hibernate.util.Methods" %>
<%@page import="hibernate.entity.Themes" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        <%@include file="/WEB-INF/css/production.css" %>
    </style>
    <title>Edit Themes</title>
</head>

<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Admin Dashboard</h2>
    </center>
</div>

<jsp:include page="adminMenu.jsp"></jsp:include>

<body>

<form action="EditThemes" method="post">
    <%String mesaj = (String) request.getAttribute("mesajApproved"); %>
    <%= mesaj != null ? mesaj + "<br>" : ""%>
    <div class="content-area">
        <div class="panel">
            <div class="title">
                Edit themes
            </div>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Theme Name</th>
                    <th>Teacher Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    Methods methods = new Methods();
                    int i = 0;
                    List<Themes> list = methods.getListOfThemes();
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
                    <input type="hidden" name="idTheme"/>
                    <td><a href="editThemes2.jsp?idTheme=<%=u.getId()%>" class="del right">
                        <div class="delete-btn">Edit</div>
                    </a></td>
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