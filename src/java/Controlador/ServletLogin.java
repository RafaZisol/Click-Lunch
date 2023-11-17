/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.ClienteDAO;
import DAO.UsuarioDAO;
import entidades.Cliente;
import entidades.Usuario;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServletLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String error="";
        String usuario=request.getParameter("correo");
        String contra=request.getParameter("contra");
        if(usuario!=null && contra!=null){
            ClienteDAO usuD=new ClienteDAO();
            UsuarioDAO cliD=new UsuarioDAO();
            Cliente usu = new Cliente();
            try {
                usu = usuD.login(usuario, contra);
            } catch (SQLException ex) {
                Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
            }
            Usuario cli =new Usuario();
            try {
                cli = cliD.buscarPorCorreo(usuario, contra);
            } catch (SQLException ex) {
                Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(usu!=null)
            {
                session.setAttribute("usuario", usu);
                response.sendRedirect("menu.jsp");   
            }
            else if(cli!=null){
                HttpSession sesioni=request.getSession();
                sesioni.setAttribute("caja", cli);
                response.sendRedirect("agregarAlimento.jsp");
            }
            else{
                                error="¡Ups! ha ocurrido un error";
                            request.setAttribute("error", error);
                            System.out.println("a");
                            RequestDispatcher dis= request.getRequestDispatcher("inicio.jsp");
                            dis.forward(request, response);                 }
        }
        else{
                                error="¡Ups! ha ocurrido un error";
                            request.setAttribute("error", error);
                            RequestDispatcher dis= request.getRequestDispatcher("inicio.jsp");
                            dis.forward(request, response);     
                            System.out.println("e");
        }
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
