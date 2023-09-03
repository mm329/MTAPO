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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Edit Item</title>
</head>
<script language="javascript">
    function fncSubmit() {
        if (document.EditThemes.themeName.value == "") {
            swal("Oops", "Te rog alege tema!", "error");
            document.EditThemes.themeName.style.border = "3px solid red";
            document.EditThemes.themeName.focus();
            return false;
        }

        if (document.EditThemes.teacherName.value == "") {
            swal("Oops", "Te rog alege profesorul!", "error");
            document.EditThemes.teacherName.style.border = "3px solid red";
            document.EditThemes.teacherName.focus();
            return false;
        }

        document.EditThemes.submit();
    }
</script>
<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Admin Dashboard</h2>
    </center>
</div>
<jsp:include page="adminMenu.jsp"></jsp:include>
<body>
<%
    Methods methods = new Methods();
    int idTheme = Integer.parseInt(request.getParameter("idTheme"));
    Themes themes = methods.retrieveThemes(idTheme);
%>
<div class="content-area">
    <div class="panel">

        <div class="title"> Edit</div>
        <center>
            <form action="EditThemes" method="post" name="EditThemes" onSubmit="return fncSubmit();">
                <br>
                <table>
                    <tr>
                        <td><label>Theme Name:</label></td>
                        <td><input type="text" id="themeName"
                                   value="<%=themes.getName() != null ? themes.getName() : ""%>"
                                   name="themeName" class="text" placeholder="Theme Name" style="width: 500px;"></td>
                    </tr>
                    <tr style="background-color: #f2f2f200;">
                        <td><label>Teacher Name:</label></td>
                        <td><input type="text" id="teacherName"
                                   value="<%=themes.getProfName() != null ? themes.getProfName() : ""%>"
                                   name="teacherName"
                                   class="text" placeholder="Teacher Name" style="width: 500px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" class="button del" value="Save" name="submit">
                        </td>
                    </tr>
                </table>
                <input type="hidden" id="idTheme" value="<%=idTheme %>" name="idTheme">
            </form>
        </center>
    </div>
</div>
</body>
</html>