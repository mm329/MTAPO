<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.util.*" %>
<%@page import="hibernate.util.*" %>
<%@page import="hibernate.entity.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <style>
        <%@include file="/WEB-INF/css/production.css" %>
    </style>
    <title>View Propose</title>
</head>

<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Student Dashboard</h2>
    </center>
</div>

<jsp:include page="studentMenu.jsp"></jsp:include>

<body>
<form action="" method="post">
    <%
        //int userid = Integer.parseInt(request.getParameter("userid"));
        int userid = (int) request.getSession().getAttribute("userId");

    %>
    <center>
        <div class="content-area">
            <div class="panel" >
                <div class="title">
                    Your Proposals
                </div>
                <table id="tableData" border="1" width="90%">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Propose</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <%
                        Methods m = new Methods();
                        ArrayList<Propose> list = m.getListOfProposeByUser(userid);
                        for (int i = 0; i < list.size(); i++) {
                            Propose propose = (Propose) list.get(i);
                    %>
                    <tr>
                        <td><%=i%>
                        </td>
                        <td><%=propose.getPropose()%>
                        </td>
                        <td><%=propose.getDate()%>
                        </td>
                        <% if (propose.getStatus() != null) {
                            if (propose.getStatus().equals("Approved")) {%>
                        <td style="background: #00cc33;color:white"><%=propose.getStatus()%>
                        </td>
                        <% } else if (propose.getStatus().equals("Rejected")) {%>
                        <td style="background: #ff3333;color:white"><%=propose.getStatus()%>
                        </td>
                        <% } else {%>
                        <td style="background: bisque ;">In asteptare</td>
                        <% }
                        }%>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <br/>
            </div>
        </div>
    </center>
</form>
</body>
</html>