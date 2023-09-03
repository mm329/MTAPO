<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<style>
    <%@include file="/WEB-INF/css/production.css" %>
</style>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
</head>
<script language="javascript">
    var regexDoarLitere = /[^a-z]/gi;
    var regexDoarCifre = /[^0-9]/gi;
    var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    function lettersOnly(input) {
        input.value = input.value.replace(regexDoarLitere, "");
    }

    function numberOnly(input) {
        input.value = input.value.replace(regexDoarCifre, "");
    }

    function fncSubmit() {
        if (document.Register.nume.value == "") {
            swal("Oops", "Te rog introdu numele!", "error");
            document.Register.nume.style.border = "3px solid red";
            document.Register.nume.focus();
            return false;
        }

        if (document.Register.prenume.value == "") {
            swal("Oops", "Te rog introdu prenumele!", "error");
            document.Register.prenume.style.border = "3px solid red";
            document.Register.prenume.focus();
            return false;
        }

        if (document.Register.email.value == "") {
            swal("Oops", "Te rog introdu email-ul!", "error");
            document.Register.email.style.border = "3px solid red";
            document.Register.email.focus();
            return false;
        }

        if (document.Register.parola.value == "") {
            swal("Oops", "Te rog introdu parola!", "error");
            document.Register.parola.style.border = "3px solid red";
            document.Register.parola.focus();
            return false;
        }

        if (document.Register.parola2.value == "") {
            swal("Oops", "Te rog repeta parola!", "error");
            document.Register.parola2.style.border = "3px solid red";
            document.Register.parola2.focus();
            return false;
        }

        if (document.Register.telefon.value == "") {
            swal("Oops", "Te rog introdu telefonul!", "error");
            document.Register.telefon.style.border = "3px solid red";
            document.Register.telefon.focus();
            return false;
        }

        if (document.Register.cnp.value == "") {
            swal("Oops", "Te rog introdu CNP!", "error");
            document.Register.cnp.style.border = "3px solid red";
            document.Register.cnp.focus();
            return false;
        }

        if (!reg.test(document.Register.email.value)) {
            swal("Oops", "Email-ul este invalid!", "error");
            document.getElementsByName("email")[0].focus();
            return false;
        }

        document.Register.submit();
    }
</script>
<body>
<%= (String) request.getAttribute("mesaj") != null ? (String) request.getAttribute("mesaj") : ""%>
<div class="w3-card-4">
    <div class="content-area">
        <div class="panel">
            <div class="title">
                <h2>Register</h2>
            </div>
            <form action="Register" name="Register" method="POST">
                <div>
                    <label class="w3-text-brown label-reg ">Name: </label><br>
                    <input type="text" class="w3-input w3-border w3-sand" name="nume" onkeyup="lettersOnly(this)"/>
                </div>
                <div>
                    <label class="w3-text-brown label-reg ">Lastname: </label><br>
                    <input type="text" class="w3-input w3-border w3-sand" name="prenume" onkeyup="lettersOnly(this)"/>
                </div>
                <div>
                    <label class="w3-text-brown label-reg ">Email: </label><br>
                    <input type="text" class="w3-input w3-border w3-sand" name="email"/>
                </div>
                <div>
                    <label class="w3-text-brown label-reg ">Password: </label><br>
                    <input type="password" class="w3-input w3-border w3-sand" name="parola"/>
                </div>
                <div>
                    <label class="w3-text-brown label-reg ">Confirm password: </label><br>
                    <input type="password" class="w3-input w3-border w3-sand" name="parola2"/>
                </div>
                <div>
                    <label class="w3-text-brown label-reg ">Phone: </label><br>
                    <input type="text" class="w3-input w3-border w3-sand" name="telefon" onkeyup="numberOnly(this)"/>
                </div>
                <div>
                    <label class="w3-text-brown label-reg ">CNP: </label><br>
                    <input type="text" class="w3-input w3-border w3-sand" name="cnp" onkeyup="numberOnly(this)"/>
                </div>
                <br><br>
                <center>
                    <input class="w3-btn w3-brown label-reg " type="button" value="Submit" onClick="return fncSubmit();"/>
                    <a href="Login.jsp">Login</a><br>
                </center>
            </form>
        </div>
    </div>
</div>
</body>
</html>