/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m1.jee.ctrl;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    ArrayList<BeanMember> members;
    HashMap<String, String> errMap = new HashMap<>();
    
    boolean flag = false;

    @Override
    public void init() throws ServletException {
        super.init();
        members = getMembers("SELECT * FROM MEMBERS");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ServletContext context = getServletContext();
        RequestDispatcher rd;
        HttpSession session = request.getSession();

        if (request.getParameter("submit_refill") != null) {
            out.print("flag");
            try {
                DBConnection.dbConnect();
                DBConnection.insertData("INSERT INTO MEMBERS(NAME,FIRSTNAME,TELHOME,TELMOB,TELPRO,ADRESS,POSTALCODE,CITY,EMAIL) VALUES('Simpson','Homer','0123456789','0612345678','0698765432','2 avenue Duff','92700','Colombes','hsimpson@gmail.com'),('Simpson','Bart','0145362787','0645362718','0611563477','10 rue des Rebelles','92270','Bois-colombes','bsimpson@gmail.com'),('Lagaffe','Gaston','0187665987','0623334256','0654778654','65 rue de la Paresse','92700','Colombes','glagaffe@yahoo.fr'),('Mafalda','Querida','0187611987','0783334256','0658878654','6 rue de Buenos Aires','75016','Paris','qmafalda@hotmail.ar'),('Woodpecker','Woody','0187384987','0622494256','0674178654','5 bvd des Picoreurs','21000','Dijon','woody@mail.co.uk'),('Brown','Charlie','0122456678','0699854673','0623445166','140 avenue Foche','90000','Nanterre','cbrown@live.com')");
                members = getMembers("SELECT * FROM MEMBERS");
                request.setAttribute("list", members);
                rd = context.getRequestDispatcher("/display.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                out.print(ex.getMessage());
            } finally {
                DBDisconnect.dbDisconnect();
            }
        }

        if (request.getParameter("submit_delete") != null) {
            if (request.getParameter("selected") != null) {
                
            String[] users = request.getParameterValues("selected");
            String str = "DELETE FROM MEMBERS WHERE ID = ";
            for (int it = 0; it < users.length; ++it) {
                if (it == users.length - 1) {
                    str += users[it];
                } else {
                    str += users[it] + " OR ID = ";
                }
            }
            try {
                DBConnection.dbConnect();
                int i = DBConnection.deleteData(str);
            } catch (SQLException ex) {
                out.print(ex.getMessage());
            } finally {
                DBDisconnect.dbDisconnect();
            }

            members = getMembers("SELECT * FROM MEMBERS");
            if (!members.isEmpty()) {
                request.setAttribute("list", members);
            } else {
                request.setAttribute("void", "void");
            }

            rd = context.getRequestDispatcher("/display.jsp");
            rd.forward(request, response);
            return;
        }
        }

        if (request.getParameter("submit_login") != null) {
            if (request.getParameter("login").equals(context.getInitParameter("login")) && request.getParameter("pass").equals(context.getInitParameter("password"))) 
            {
                if (!members.isEmpty()) {
                    request.setAttribute("list", members);
                } else {
                    request.setAttribute("void", "void");
                }
                flag = true;
                rd = context.getRequestDispatcher("/display.jsp");
                rd.forward(request, response);
                return;
            } else {
                if(request.getParameter("login").equals("") && request.getParameter("pass").equals(""))
                {    
                    errMap.put("error","Login and password are empty");
                    session.setAttribute("errmap", errMap);
                }
                else if(request.getParameter("pass").equals(""))
                {
                    errMap.put("error","Password is empty");
                    session.setAttribute("errmap", errMap);
                }
                else if(request.getParameter("login").equals(""))
                {
                    errMap.put("error","Login is empty");
                    session.setAttribute("errmap", errMap);
                }
                else
                {
                    errMap.put("error", "Wrong credentials");
                    session.setAttribute("errmap", errMap);
                }
                        
                rd = context.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
                return;
            }
        }

        if (request.getParameter("submit_details") != null) {
            if(request.getParameter("selected") != null)
            {
            members.clear();
            String[] a = request.getParameterValues("selected");
            String sql = "SELECT * FROM MEMBERS WHERE ID = ";

            for (int i = 0; i < a.length; ++i) {
                if (i < a.length - 1) {
                    sql += a[i] + " OR ID = ";
                } else {
                    sql += a[i];
                }
            }
            members = getMembers(sql);
            request.setAttribute("details_list", members);
            rd = context.getRequestDispatcher("/details.jsp");
            rd.forward(request, response);
            return;
            }
        }

        if (request.getParameter("submit_login") == null && request.getParameter("submit_delete") == null && request.getParameter("submit_details") == null && !flag) {
            rd = context.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        } else {
            members = getMembers("SELECT * FROM MEMBERS");
            if (!members.isEmpty()) {
                request.setAttribute("list", members);
            } else {
                request.setAttribute("void", "void");
            }

            rd = context.getRequestDispatcher("/display.jsp");
            rd.forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public ArrayList<BeanMember> getMembers(String sql) {
        ArrayList<BeanMember> list = new ArrayList<>();
        try {
            DBConnection.dbConnect();
            ResultSet rs = DBConnection.selectData(sql);
            if (rs != null) {
                while (rs.next()) {
                    BeanMember temp = new BeanMember();
                    temp.setId(rs.getInt(1));
                    temp.setName(rs.getString(2));
                    temp.setFirstname(rs.getString(3));
                    temp.setTelhome(rs.getString(4));
                    temp.setTelmob(rs.getString(5));
                    temp.setTelpro(rs.getString(6));
                    temp.setAddress(rs.getString(7));
                    temp.setPostalcode(rs.getString(8));
                    temp.setCity(rs.getString(9));
                    temp.setEmail(rs.getString(10));

                    list.add(temp);
                }
                return list;
            }

        } catch (SQLException ex) {
            out.print(ex.getMessage());
        } finally {
            DBDisconnect.dbDisconnect();
        }

        return null;
    }
}
