<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.util.*" %>
<%@page import="hibernate.util.Methods" %>
<%@page import="hibernate.entity.*" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        <%@include file="/WEB-INF/css/production.css" %>
    </style>
    <title>Confirm Proposal</title>
</head>
<div class="top-area">
    <center>
        <h2 class="titlu tracking-in-expand text-shadow-pop-top">Admin Dashboard</h2>
    </center>
</div>

<jsp:include page="adminMenu.jsp"/>

<body>
<form action="ConfirmProposal" method="post">
    <%
        Methods methods = new Methods();
        LinkedHashMap<Propose, Users> list = methods.getListOfProposal();
        request.setAttribute("list", list);
        System.out.println("List " + list);
    %>

    <div class="content-area">
        <div class="panel">
            <div class="title">
                Confirm the Proposal
            </div>
            <table>
                <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Proposal</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Approved</th>
                    <th>Rejected</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="entry">
                    <tr>
                        <td><c:out value="${entry.value.firstName}"/></td>
                        <td><c:out value="${entry.value.lastName}"/></td>
                        <td><c:out value="${entry.key.propose}"/></td>
                        <td><c:out value="${entry.key.date}"/></td>
                        <td><c:out value="${entry.key.status}"/></td>
                        <td>
                            <a href='<%=request.getContextPath()%>/ConfirmProposal?idProposalApproved=<c:out value="${entry.key.idPropose}" />&propose=<c:out value="${entry.key.propose}" /> '
                               class="del right">
                                <div class="delete-btn">Approved</div>
                            </a>
                        </td>
                        <td>
                            <a href='<%=request.getContextPath()%>/ConfirmProposal?idProposalRejected=<c:out value="${entry.key.idPropose}" /> '
                               class="del right del-delete">
                                <div class="delete-btn">Rejected</div>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</form>
</body>
</html>
