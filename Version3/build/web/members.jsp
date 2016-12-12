<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
    "http://www.w3.org/TR/html4/loose.dtd">  

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Gestionnaire d'utilisateurs</title>  
    </head>  
    <body>  
        <h1>Gestionnaire d'utilisateurs</h1>  

        <c:if test="${not empty members}">
            <h1>List of members of the Java EE - M1 Club</h1>
            <form method="post" action="ServletMembers">
                <table id="members_table">
                    <tr>
                        <th>Sel&nbsp;&nbsp;&nbsp;</th>
                        <th>Firstname&nbsp;&nbsp;&nbsp;</th>
                        <th>Lastname&nbsp;&nbsp;&nbsp;</th>
                        <th>Email&nbsp;&nbsp;&nbsp;</th>
                    </tr>
                    <c:forEach var="member" items="${requestScope.members}"> 
                        <tr>
                            <td class="td_checkbox"><input type="checkbox" name="selected" value="<c:out value='${member.id}'/>"></td>
                            <td><c:out value="${member.firstName}"/></td>
                            <td><c:out value="${member.name}"/></td>
                            <td><c:out value="${member.email}"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <input type="submit" value="delete" name="action"/>
                <input type="submit" value="details" name="action"/>
            </form>
        </c:if>
        <c:if test="${not empty void}">
            <h1><span class="blue">The club has no member !</span></h1>
            <form method="post" action="ServletMembers">
                <input type="submit" value="refill" name="action"/>
            </form>
        </c:if>
    </body>  
</html> 