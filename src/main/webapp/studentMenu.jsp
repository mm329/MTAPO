<%@page import="hibernate.entity.Choose" %>
<%@page import="hibernate.util.Methods" %>
<%@page import="hibernate.entity.Propose" %>
<%@page import="java.util.ArrayList" %>
<%
    String username = (String) request.getSession().getAttribute("userEmail");
    String message = " ";
    String rememberMe = (String) request.getSession().getAttribute("rememberme");
    if (rememberMe != null) {
        Cookie usernameCookie = new Cookie("Ucookie", username);
        usernameCookie.setMaxAge(24 * 60 * 60 * 1000);
        response.addCookie(usernameCookie);
        request.getSession().setAttribute("Ucookie", usernameCookie);
    }
%>
<div class="container mt2 text--gray align--center">
    <div class="grid-row">
        <div class="grid-column span-one-third mb3 user ">
            <img class="illustration--small mb1" src="img/assign.svg" alt="Assign to others">
            <a class="active" href="vizualize.jsp"><h2>View</h2></a>
        </div>
        <%
            int userid = (int) request.getSession().getAttribute("userId");
            Methods m = new Methods();
            Choose choose = m.getChoose(userid);
            if (choose == null) {
        %>
        <div class="grid-column span-one-third mb3 user  ">
            <img class="illustration--small mb1" src="img/connected.svg" alt="Stay connected">
            <a href="chooseThemes.jsp"><h2>Choose</h2></a>
        </div>
        <%
        } else {
        %>
        <div class="grid-column span-one-third mb3  user  ">
            <img class="illustration--small mb1" src="img/search.svg" alt="Powerful search">
            <a href="editChoose.jsp"><h2>Edit</h2></a>
        </div>
        <%
            }
        %>
        <div class="grid-column span-one-third mb3 user">
            <img class="illustration--small mb1" src="img/vault.svg" alt="Put in a vault">
            <a href="proposeThemes.jsp"><h2>Propose</h2></a>
        </div>
        <div class="grid-column span-one-third mb3  user  ">
            <img class="illustration--small mb1" src="img/messaging.svg" alt="Fast messaging">
            <a href="viewPropose.jsp"><h2>View Propose</h2></a>
        </div>
        <div class="grid-column span-one-third mb3  user  ">
            <img class="illustration--small mb1" src="img/mail.svg" alt="Share with others">
            <a href="Login.jsp?logout=1"><h2>Log out</h2></a>
        </div>
    </div>
</div>