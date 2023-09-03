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
    <title>Delete Themes</title>
</head>
<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Admin Dashboard</h2>
    </center>
</div>

<jsp:include page="adminMenu.jsp"></jsp:include>

<body>
<form action="DeleteThemes" method="post">

    <div class="content-area">
        <div class="panel">
            <div class="title">
                Delete themes
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
                    <td><a href="<%=request.getContextPath()%>/DeleteThemes?idTheme=<%=u.getId()%>"
                           onclick="return confirm('Are you sure you want to delete this ?');" class="del right del-delete">
                        <div class="delete-btn">Delete</div>
                    </a></td>
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