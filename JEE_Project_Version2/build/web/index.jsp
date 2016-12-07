<%-- 
    Document   : index
    Created on : 25 nov. 2016, 14:29:04
    Author     : Administrateur
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>EFREI - Java EE - M1</h1>
        <c:if test="${not empty sessionScope.errmap}">
            <h3><span class="red"><c:out value="${errmap.error}"></c:out></span></h3>
        </c:if>

        <h3>Enter your credentials</h3>

        <form id="main" method="post" name="main" action="Controller">
            <table id="login_table">
                <tr><td>Login : </td><td><input type = "text" name = "login"/></td></tr>
                <tr><td>Password : </td><td><input type = "password" name = "pass"/></td></tr>
            </table>
            <input type="submit" name="submit_login" value ="Submit" id="button_login"/> 
        </form>
    </body>
</html>
