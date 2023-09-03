<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="hibernate.util.*" %>
<%@page import="hibernate.entity.*" %>
<%
    String prof = request.getParameter("prof");
    System.out.println(prof);
    String buffer = "<select name='theme' id ='theme' class='text'><option value=''>Select</option>";
    try {
        Methods m = new Methods();
        List<Themes> list = m.getThemeByTeacher(prof);
        for (Themes u : list) {
            buffer = buffer + "<option value='" + u.getName() + "'>" + u.getName() + "</option>";
        }
        buffer = buffer + "</select>";
        response.getWriter().println(buffer);
    } catch (Exception e) {
        System.out.println(e);
    }
%>