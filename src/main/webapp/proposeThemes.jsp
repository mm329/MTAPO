<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<html>
<head>
    <meta charset="ISO-8859-1">
    <style>
        <%@include file="/WEB-INF/css/production.css" %>
    </style>
    <title>Propose Themes</title>
</head>

<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Student Page</h2>
    </center>
</div>

<jsp:include page="studentMenu.jsp"></jsp:include>

<script language="javascript">
    function fncSubmit() {
        if (document.ProposeThemes.themeName.value == "") {
            swal("Oops", "Completeaza numele temei!", "error");
            document.ProposeThemes.themeName.style.border = "3px solid red";
            document.ProposeThemes.themeName.focus();
            return false;
        }

        document.ProposeThemes.submit();
    }
</script>
<body>
<%
    String userId = request.getSession().getAttribute("userId").toString();
%>

<form action="ProposeThemes" method="post" name="ProposeThemes" onSubmit="return fncSubmit();">
    <div class="content-area">
        <div class="panel">
            <div class="title">
                Proposes a theme
            </div>
            <%
                String message = (String) request.getAttribute("Message");
            %>
            <%=message != null ? message + "<br>" : ""%>
            <label>Theme Name: </label>
            <input type="text" name="themeName" class="text" placeholder="Theme Name" style="width: 500px;"/><br><br>
            <input type="hidden" name="userId" value="<%=userId != null ? userId : ""%>"/>
            <input type="submit" value="Propose" class="button"/>
        </div>
    </div>
</form>
</body>
</html>