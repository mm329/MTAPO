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
        <div class="grid-column span-one-third mb3  ">
            <img class="illustration--small mb1" src="img/assign.svg" alt="Assign to others">
            <a class="active" href="viewThemes.jsp"><p>View</p></a>
        </div>
        <div class="grid-column span-one-third mb3   ">
            <img class="illustration--small mb1" src="img/connected.svg" alt="Stay connected">
            <a href="addThemes.jsp"><p>Add</p></a>
        </div>
        <div class="grid-column span-one-third mb3    ">
            <img class="illustration--small mb1" src="img/search.svg" alt="Powerful search">
            <a href="editThemes.jsp"><p>Edit</p></a>
        </div>
        <div class="grid-column span-one-third mb3 ">
            <img class="illustration--small mb1" src="img/vault.svg" alt="Put in a vault">
            <a href="deleteThemes.jsp"><p>Delete</p></a>
        </div>
        <div class="grid-column span-one-third mb3    ">
            <img class="illustration--small mb1" src="img/messaging.svg" alt="Fast messaging">
            <a href="confirmProposal.jsp"><p>Confirm Proposal</p></a>
        </div>
        <div class="grid-column span-one-third mb3    ">
            <img class="illustration--small mb1" src="img/mail.svg" alt="Share with others">
            <a href="Login.jsp?logout=1"><p>Log out</p></a>
        </div>
    </div>
</div>