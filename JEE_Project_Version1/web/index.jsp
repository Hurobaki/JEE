<%-- 
    Document   : index
    Created on : 3 déc. 2016, 18:33:21
    Author     : Theo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>EFREI - Java EE - M1</h1>
        <%
            if (request.getAttribute("error") != null) {
                out.print("<h3><span class='red'>Wrong credentials</span></h3>");
            }
        %>
        <h3>Enter your credentials</h3>
        <form id="main" method="POST" action="./controller.jsp" >
            <table id="login_table">
                <tr><td>Login : </td><td><input type = "text" name = "login"/></td></tr>
                <tr><td>Password : </td><td><input type = "password" name = "password"/></td></tr>
            </table>
            <input type="submit" value="login" id="button_login"/>
        </form>
    </body>
</html>
