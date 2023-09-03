<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <%@ include file="/WEB-INF/partials/head.jsp" %>
</head>


<body>
<script language="javascript">
    function fncSubmit() {
        if (document.Login.email.value == "") {
            swal("Oops", "Completeaza email-ul!", "error");
            document.Login.email.style.border = "3px solid red";
            document.Login.email.focus();
            return false;
        }

        if (document.Login.password.value == "") {
            swal("Oops", "Completeaza parola!", "error");
            document.Login.password.style.border = "3px solid red";
            document.Login.password.focus();
            return false;
        }

        document.Login.submit();
    }
</script>
<%
    Cookie cookies = (Cookie) request.getSession().getAttribute("Ucookie");
    String email = "";
    if (cookies != null) {
        if (cookies.getName().equals("Ucookie")) {
            email = cookies.getValue();
        }
    }

    String checkedOrUnchecked = (String) request.getSession().getAttribute("rememberme");
    String checked = "";
    if (checkedOrUnchecked != null && "true".equals(checkedOrUnchecked)) {
        checked = "checked";
    } else {
        email = "";

    }
%>

<%
    if (request.getParameter("logout") != null) {
        request.getSession().removeAttribute("userId");
        out.println("Ai fost deconectat");
    }
%>

<header class="align--center pt3">
    <div class="container--lg border--bottom pb3 logo-text">
        <%--        <img class="logo" src="img/logo.svg" alt="Carta">--%>
        <div class="text-content">
            <h1 class="mb1">Welcome to License Topic Selection</h1>
            <p>Choose the topic that will guide you to academic success!</p>
        </div>
    </div>
</header>

<main>
    <div class="container pt-3 mt-2 text--gray align--center">
        <div class="w3-card-4 custom-login">
            <div class="w3-container w3-brown">
                <br>
                <h3>Authentication</h3>
            </div>
            <form action="Login" method="post" name="Login" onSubmit="return fncSubmit();" class="custom-form">
                <%String mesaj = (String) request.getAttribute("mesaj"); %>
                <%= mesaj != null ? mesaj + "<br>" : ""%>
                <div class="form-group">
                    <label for="email" class="w3-text-brown">Email:</label>
                    <input type="text" class="form-control" name="email" id="email" value="<%= email%>"/>
                </div>

                <div class="form-group">
                    <label for="password" class="w3-text-brown">Password:</label>
                    <input type="password" class="form-control" name="password" id="password"/>
                </div>

                <button type="submit" class="w3-btn w3-brown btn-login">Login</button>

                <div class="form-group">
                    <span class="remember-me">
                    <input type="checkbox" id="rememberme" name="rememberme" <%=checked %> />
                    <label for="rememberme">Remember Me</label>
                        </span>
                    <span class="register-link"><a href="register.jsp">Register</a></span>
                </div>
            </form>
        </div>
    </div>
</main>

</body>
</html>