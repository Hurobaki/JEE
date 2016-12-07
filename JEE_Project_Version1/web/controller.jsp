<%@page import="java.sql.*" %>
<%
    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/club", "root", "root");
    Statement sta = connection.createStatement();
    ResultSet rs = sta.executeQuery("SELECT login,password FROM CREDENTIALS");
    
    rs.next();
    
    String login = rs.getString(1);
    String pass = rs.getString(2);

    if(login.equals(request.getParameter("login")) && pass.equals(request.getParameter("password")))
    {
        request.getRequestDispatcher("members.jsp").forward(request, response);
    }
    else
    {
        request.setAttribute("error", "Wrong credentials");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


%>