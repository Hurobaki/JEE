<%-- 
    Document   : index
    Created on : 9 déc. 2016, 10:17:47
    Author     : Theo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
    "http://www.w3.org/TR/html4/loose.dtd">  
  
<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>Gestionnaire d'utilisateurs</title>  
    </head>  
    <body>  
        <h1>Gestionnaire d'utilisateurs</h1>  
        
        <form method="post" action="Controller">
            <input type="submit" name="test"/>
        </form>
  
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
    </body>  
</html>  
