/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.ComidaDAO;
import DAO.PedidoDAO;
import DAO.ClienteDAO;
import entidades.Cliente;
import entidades.Comidas;
import entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author artem
 */
public class ServletCaja extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
        ComidaDAO comD=new ComidaDAO();
        PedidoDAO peD=new PedidoDAO();
        ClienteDAO usuD=new ClienteDAO();
        Comidas com;
        int id;
        HttpSession session=request.getSession();
        if(session!=null){
    String accion=request.getParameter("accion");
    
         switch(accion){
            
          case"completado" -> {  
              try{
              id=Integer.parseInt(request.getParameter("id"));
              peD.cambiar_stock("completado", id);
              response.sendRedirect("indexCaja.jsp");
              }
              catch(Exception e){
              response.sendRedirect("error.jsp");
              }
            }
          case"entregado" -> { 
              try{
              id=Integer.parseInt(request.getParameter("id"));
              peD.cambiar_stock("Entregado", id);
              response.sendRedirect("indexCaja.jsp");
              }
              catch(Exception e){
                response.sendRedirect("error.jsp");
              }
            }
          case"preparar" -> { 
              try{
              id=Integer.parseInt(request.getParameter("id"));
              peD.cambiar_stock("preparar", id);
              response.sendRedirect("indexCaja.jsp");
              }
              catch(Exception e){
                            response.sendRedirect("error.jsp");
              }
            }
          case"cambiar stock" -> {  
              int cantidad=Integer.parseInt(request.getParameter("cantidad"));
              id=Integer.parseInt(request.getParameter("id"));
              comD.cambiar_stock(cantidad, id);
              response.sendRedirect("indexCaja.jsp");
          }
          case "Añadir saldo" -> { 
              if(request.getParameter("saldo")!=null && request.getParameter("id_saldo")!=null){
              Date date = new Date();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
                        String horaActual = dateFormat.format(date);
                        Date date2 = new Date();
                        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM=dd");
                        String fechaActual = dateFormat2.format(date2);        
              float saldo_mayor=Float.parseFloat(request.getParameter("saldo"));
              id=Integer.parseInt(request.getParameter("id_saldo"));
              float saldo=usuD.buscar(id);
              Cliente usu=usuD.buscar_o(id);
              float total=saldo_mayor+saldo;
              peD.pedirS(usu, horaActual, fechaActual, peD.id(), saldo_mayor);
              usuD.guardar_saldo(saldo_mayor, total,id); 
              response.sendRedirect("indexCaja.jsp");
            }
              else{
              response.sendRedirect("error.jsp");
              }
          }
          case"Cerrar Sesión"->{
          session.invalidate();
          response.sendRedirect("index.jsp");
          }
         }
         
    }
        else{
        response.sendRedirect("index.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
