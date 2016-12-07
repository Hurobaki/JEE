<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
    String[] a = request.getParameterValues("selected");
   
    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/club", "root", "root");
    Statement sta = connection.createStatement();
    
    for(int i = 0; i<a.length; ++i)
    {
        sta=connection.createStatement();
        sta.executeUpdate("DELETE FROM MEMBERS WHERE EMAIL='"+a[i]+"'");
    }
    request.getRequestDispatcher("members.jsp").forward(request, response);
%>