<%-- 
    Document   : details
    Created on : 2 déc. 2016, 16:06:29
    Author     : Theo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:forEach var="member" items="${requestScope.details_list}">     
            <h1>Member <c:out value="${member.getFirstname()}"/> <c:out value="${member.getName()}"/></h1>
            <p>
                <label>Last name: </label>
                <input type="text" value="<c:out value="${member.getName()}"/>"/>
                <label>First name: </label>
                <input type="text" value="<c:out value="${member.getFirstname()}"/>"/>
            </p>
            <p>
                <strong>Phone number</strong><br>
                <label>Home number : </label>
                <input type="tel" value="<c:out value="${member.getTelhome()}"/>"/><br>
                <label>Mobile number : </label>
                <input type="tel" value="<c:out value="${member.getTelmob()}"/>"/><br>
                <label>Office number : </label>
                <input type="tel" value="<c:out value="${member.getTelpro()}"/>"/><br>    
            </p>
            <p>
                <label>Address : </label>
                <input type="text" value="<c:out value="${member.getAddress()}"/>"/><br>
                <label>Postal code : </label>
                <input type="text" value="<c:out value="${member.getPostalcode()}"/>"/>
                <label> City : </label>
                <input type="text" value="<c:out value="${member.getCity()}"/>"/><br>
                <label>Email : </label>
                <input type="text" value="<c:out value="${member.getEmail()}"/>"/>
            </p>
        </c:forEach>
        <a href="Controller">Back to menu</a>
    </body>
</html>
