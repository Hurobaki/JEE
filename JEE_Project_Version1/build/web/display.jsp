<%-- 
    Document   : display
    Created on : 28 nov. 2016, 18:48:04
    Author     : IDXCEL
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String str;
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/club", "root", "root");
            Statement sta = connection.createStatement();
            String[] a = request.getParameterValues("selected");
            ResultSet resultset = null;
            for (int i = 0; i < a.length; ++i) {
                sta = connection.createStatement();
                resultset = sta.executeQuery("SELECT * FROM MEMBERS WHERE EMAIL ='" + a[i] + "'");
                resultset.next();%>
        <h1>Member <%= resultset.getString(3)%> <%= resultset.getString(2)%></h1>
        <p>
            <label>Last name: </label>
            <input type="text" value="<%=resultset.getString(2)%>"/>
            <label>First name: </label>
            <input type="text" value="<%=resultset.getString(3)%>"/>
        </p>
        <p>
            <strong>Phone number</strong><br>
            <label>Home number : </label>
            <input type="tel" value="<%=resultset.getString(4)%>"/><br>
            <label>Mobile number : </label>
            <input type="tel" value="<%=resultset.getString(5)%>"/><br>
            <label>Office number : </label>
            <input type="tel" value="<%=resultset.getString(6)%>"/><br>    
        </p>
        <p>
            <label>Address : </label>
            <input type="text" value="<%=resultset.getString(7)%>"/><br>
            <label>Postal code : </label>
            <input type="text" value="<%=resultset.getString(8)%>"/>
            <label> City : </label>
            <input type="text" value="<%=resultset.getString(9)%>"/><br>
            <label>Email : </label>
            <input type="text" value="<%=resultset.getString(10)%>"/>
        </p>

        <%
    }
        %> 
        <form method="POST" action="members.jsp">
            <input type="submit" value="return to menu"/>
        </form>
    </body>
</html>
