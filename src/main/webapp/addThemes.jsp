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
    <title>Add Themes</title>
</head>
<script language="javascript">
    function fncSubmit() {
        if (document.AddThemes.Name.value == "") {
            swal("Oops", "Te rog alege tema!", "error");
            document.AddThemes.Name.style.border = "3px solid red";
            document.AddThemes.Name.focus();
            return false;
        }

        if (document.AddThemes.Teacher.value == "") {
            swal("Oops", "Te rog alege profesorul!", "error");
            document.AddThemes.Teacher.style.border = "3px solid red";
            document.AddThemes.Teacher.focus();
            return false;
        }

        document.AddThemes.submit();
    }
</script>
<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Admin Dashboard</h2>
    </center>
</div>

<jsp:include page="adminMenu.jsp"></jsp:include>

<body>

<form action="AddThemes" name="AddThemes" method="post" onSubmit="return fncSubmit();">
    <div class="content-area">
        <div class="panel">
            <div class="title">
                Add themes
            </div>
            <label>Name: </label>
            <input type="text" name="Name" class="text" id="Name" placeholder="Name"/><br><br>
            <label>Teacher: </label>
            <input type="text" name="Teacher" class="text" id="Teacher" placeholder="Teacher"/><br><br>
            <input type="submit" value="Add" class="button"/>
        </div>
    </div>
</form>
</body>
</html>