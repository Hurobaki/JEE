<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>

        <c:forEach var="member" items="${requestScope.membersDetails}">     
            <h1>Member <c:out value="${member.firstName}"/> <c:out value="${member.name}"/></h1>
            <p>
                <label>Last name: </label>
                <input type="text" value="<c:out value="${member.name}"/>"/>
                <label>First name: </label>
                <input type="text" value="<c:out value="${member.firstName}"/>"/>
            </p>
            <p>
                <strong>Phone number</strong><br>
                <label>Home number : </label>
                <input type="tel" value="<c:out value="${member.telhome}"/>"/><br>
                <label>Mobile number : </label>
                <input type="tel" value="<c:out value="${member.telmob}"/>"/><br>
                <label>Office number : </label>
                <input type="tel" value="<c:out value="${member.telpro}"/>"/><br>    
            </p>
            <p>
                <label>Address : </label>
                <input type="text" value="<c:out value="${member.adress}"/>"/><br>
                <label>Postal code : </label>
                <input type="text" value="<c:out value="${member.postalCode}"/>"/>
                <label> City : </label>
                <input type="text" value="<c:out value="${member.city}"/>"/><br>
                <label>Email : </label>
                <input type="text" value="<c:out value="${member.email}"/>"/>
            </p>
        </c:forEach>
        <a href="ServletMembers">Back to menu</a>
    </body>
</html>