/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import members.controllers.MembersController;
import members.modeles.Member;

/**
 *
 * @author Chocobouc
 */
public class ServletMembers extends HttpServlet {

    @EJB
    private MembersController membersController;
    private Collection<Member> members;
    private HashMap<String, String> errMap = new HashMap<>();
    private boolean logged_in = false;

    @Override
    public void init() throws ServletException {
        super.init();
        membersController.createMembers();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            ServletContext context = getServletContext();
            RequestDispatcher rd;
            HttpSession session = request.getSession();

            members = membersController.getAllMembers();
            if (action != null) {
                if (action.equals("login")) {
                    if (request.getParameter("login").equals(context.getInitParameter("login")) && request.getParameter("pass").equals(context.getInitParameter("password"))) {
                        if (!members.isEmpty()) {
                            request.setAttribute("members", members);
                        } else {
                            request.setAttribute("void", "void");
                        }
                        request.setAttribute("members", members);
                        rd = request.getRequestDispatcher("/members.jsp");
                        rd.forward(request, response);
                    } else {
                        if (request.getParameter("login").equals("") && request.getParameter("pass").equals("")) {
                            errMap.put("error", "Login and password are empty");
                            session.setAttribute("errmap", errMap);
                        } else if (request.getParameter("pass").equals("")) {
                            errMap.put("error", "Password is empty");
                            session.setAttribute("errmap", errMap);
                        } else if (request.getParameter("login").equals("")) {
                            errMap.put("error", "Login is empty");
                            session.setAttribute("errmap", errMap);
                        } else {
                            errMap.put("error", "Wrong credentials");
                            session.setAttribute("errmap", errMap);
                        }

                        rd = context.getRequestDispatcher("/index.jsp");
                        rd.forward(request, response);
                        return;
                    }
                }
                if (action.equals("refill")) {
                    membersController.createMembers();
                    request.setAttribute("members", membersController.getAllMembers());
                    rd = request.getRequestDispatcher("/members.jsp");
                    rd.forward(request, response);
                }

                if (action.equals("delete")) {
                    if (request.getParameter("selected") != null) {
                        String[] membersToRemove = request.getParameterValues("selected");
                        for (int it = 0; it < membersToRemove.length; ++it) {
                            membersController.removeMember(membersToRemove[it]);
                        }
                        if (!membersController.getAllMembers().isEmpty()) {
                            request.setAttribute("members", membersController.getAllMembers());

                        } else {
                            request.setAttribute("void", "void");
                        }
                        rd = context.getRequestDispatcher("/members.jsp");
                        rd.forward(request, response);
                        return;
                    }
                }
                if (action.equals("details")) {
                    if (request.getParameter("selected") != null) {
                        String[] a = request.getParameterValues("selected");
                        members = membersController.getSelectedMembers(a);
                        request.setAttribute("membersDetails", members);
                        rd = context.getRequestDispatcher("/details.jsp");
                        rd.forward(request, response);
                        return;
                    }
                }

            }
            request.setAttribute("members", membersController.getAllMembers());
            rd = request.getRequestDispatcher("/members.jsp");
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

}
