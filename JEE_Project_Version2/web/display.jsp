<%-- 
    Document   : display
    Created on : 29 nov. 2016, 14:54:04
    Author     : Théo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="m1.jee.ctrl.DBConnection" %>
<%@page import="m1.jee.ctrl.DBDisconnect" %>
<%@page import="m1.jee.ctrl.BeanMember" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty list}">
            <h1>List of members of the Java EE - M1 Club</h1>
            <form method="post" action="Controller">
                <table id="members_table">
                    <tr>
                        <th>Sel&nbsp;&nbsp;&nbsp;</th>
                        <th>Firstname&nbsp;&nbsp;&nbsp;</th>
                        <th>Lastname&nbsp;&nbsp;&nbsp;</th>
                        <th>Email&nbsp;&nbsp;&nbsp;</th>
                    </tr>
                    <c:forEach var="member" items="${requestScope.list}"> 
                        <tr>
                            <td class="td_checkbox"><input type="checkbox" name="selected" value="<c:out value='${member.getId()}'/>"></td>
                            <td><c:out value="${member.getFirstname()}"/></td>
                            <td><c:out value="${member.getName()}"/></td>
                            <td><c:out value="${member.getEmail()}"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <input type="submit" value="Delete" name="submit_delete"/>
                <input type="submit" value="Details" name="submit_details"/>
            </form>
        </c:if>
        <c:if test="${not empty void}">
            <h1><span class="blue">The club has no member !</span></h1>
            <form method="post" action="Controller">
                <input type="submit" value="Refill" name="submit_refill"/>
            </form>
        </c:if>
    </body>
</html>
