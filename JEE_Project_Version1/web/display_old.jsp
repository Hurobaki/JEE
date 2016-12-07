<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Connection connection = null; 
    Statement statement = null;
    ResultSet resultset = null;
    
    RequestDispatcher requestDisp = request.getRequestDispatcher("/members.jsp");
    
    String str;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        /* V1 */   
        /*
        
        if(request.getParameter("delete") != null)
        {
            if(request.getParameter("selected")!=null)
            {
                String[] a = request.getParameterValues("selected");
                
                    str = "DELETE FROM MEMBERS WHERE ID = ";
                    for(int it=0;it<a.length;++it)
                    {
                        if(it==a.length-1)
                            str+=a[it];
                        else
                            str+=a[it]+" OR ID = ";
                    }
                    
                statement.executeUpdate(str);
                
                requestDisp.forward(request, response);
            }
            
            requestDisp.forward(request, response);
        }*/
   
            if(request.getParameter("delete") != null)
            {
                if(request.getParameter("selected") != null)
                {
                    String[] a = request.getParameterValues("selected");
                       try
                       {
                           Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                           String connectionUrl = "jdbc:sqlserver://localhost;databaseName=dbname;user=username;password=password";
                           connection = DriverManager.getConnection(connectionUrl);
                           connection.setAutoCommit(false);
                           statement = connection.createStatement();
                          
                           for(int it=0; it<a.length;++it)
                            {
                                str = a[it];
                                statement.executeUpdate("DELETE FROM MEMBERS WHERE ID = " + str);
                            }
                       }
                       catch(Exception e)
                       {
                           if(!connection.isClosed())
                           {
                               connection.rollback();
                               System.out.println(e);
                           }
                       }
                       finally
                       {
                           if(!statement.isClosed())
                               statement.close();
                           if(!connection.isClosed())
                               connection.close();
                       }
                    
                    //response.sendRedirect("members.jsp");
                    //requestDisp.forward(request, response);
                }
                //response.sendRedirect("members.jsp");
                
                /*statement.close();
                resultset.close();
                connection.close();**/
                response.sendRedirect("members.jsp");
                //requestDisp.forward(request, response);
                
            }
        

        
        if(request.getParameter("details") != null)
        {
            if(request.getParameter("selected") != null)
            {
                String[] a = request.getParameterValues("selected");
                str = "SELECT * FROM MEMBERS WHERE ID =";
                
                for(int it = 0; it<a.length;++it)
                {
                    if(it==a.length-1)
                        str+=a[it];
                    else
                        str+=a[it]+" OR ID = ";
                }
                
                resultset = statement.executeQuery(str);
                if(resultset != null)
                {
                    while(resultset.next())
                    {
                        %>
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
                    <a href="members.jsp">Back to the menu</a>
                <%
                }
            }
            requestDisp.forward(request, response);
        }
        if(request.getParameter("refill") != null)
        {
            str = "INSERT INTO MEMBERS(NAME,FIRSTNAME,TELHOME,TELMOB,TELPRO,ADRESS,POSTALCODE,CITY,EMAIL) VALUES('Simpson','Homer','0123456789','0612345678','0698765432','2 avenue Duff','92700','Colombes','hsimpson@gmail.com'),('Simpson','Bart','0145362787','0645362718','0611563477','10 rue des Rebelles','92270','Bois-colombes','bsimpson@gmail.com'),('Lagaffe','Gaston','0187665987','0623334256','0654778654','65 rue de la Paresse','92700','Colombes','glagaffe@yahoo.fr'),('Mafalda','Querida','0187611987','0783334256','0658878654','6 rue de Buenos Aires','75016','Paris','qmafalda@hotmail.ar'),('Woodpecker','Woody','0187384987','0622494256','0674178654','5 bvd des Picoreurs','21000','Dijon','woody@mail.co.uk'),('Brown','Charlie','0122456678','0699854673','0623445166','140 avenue Foche','90000','Nanterre','cbrown@live.com')"; 
            statement.executeUpdate(str);
            requestDisp.forward(request, response);

            statement.close();
            resultset.close();
            connection.close();
        }
        %>
        
    </body>
</html>
