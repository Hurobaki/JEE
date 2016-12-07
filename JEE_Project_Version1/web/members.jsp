<%-- 
    Document   : members.jsp
    Created on : 28 nov. 2016, 17:49:22
    Author     : IDXCEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/club", "root", "root");
            Statement sta = connection.createStatement();
            ResultSet resultsetLogin = sta.executeQuery("SELECT login,password FROM CREDENTIALS");
            resultsetLogin.next();
            int i = 0;

            ResultSet resultset = sta.executeQuery("SELECT * FROM MEMBERS");

            if (resultset.next()) {
                out.println("<form method='post' action='delete.jsp'>"
                        + "<table id='members_table'>"
                        + "<tr>"
                        + "<th>Sel&nbsp;&nbsp;&nbsp;</th>"
                        + "<th>Firstname&nbsp;&nbsp;&nbsp;</th>"
                        + "<th>Lastname&nbsp;&nbsp;&nbsp;</th>"
                        + "<th>Email&nbsp;&nbsp;&nbsp;</th>"
                        + "</tr>");

                ResultSet rs = sta.executeQuery("SELECT * FROM MEMBERS");

                while (rs.next()) {
                    out.println("<tr>"
                            + "<td><input type='checkbox' name='selected' value=" + rs.getString(10) + "</td>"
                            + "<td>" + rs.getString(2) + "</td>"
                            + "<td>" + rs.getString(3) + "</td>"
                            + "<td>" + rs.getString(10) + "</td>"
                            + "</tr>");

                    ++i;
                }

                out.println("</table>"
                        + "<input type='submit' value='delete' formaction='delete.jsp'/>"
                        + "<input type='submit' value='details' formaction='display.jsp'/>"
                        + "</form>");

            } else {
                if (i == 0) {
                    out.println("<div class='centered'>"
                            + "<h3 class='blue'>The Club has no member!</h3>"
                            + "<form method='post'>"
                            + "<input type='submit' value='Add new members' formaction='refill.jsp'/>"
                            + "</form>"
                            + "</div>");

                }
            }
        %>

    </body>
</html>
