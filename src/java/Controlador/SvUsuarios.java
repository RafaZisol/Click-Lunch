/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.ComidaDAO;
import DAO.PedidoDAO;
import DAO.ClienteDAO;
import DAO.DetalleDAO;
import DAO.UsuarioDAO;
import entidades.Comidas;
import entidades.Pedido;
import entidades.Cliente;
import entidades.Detalle;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author artem
 */
public class SvUsuarios extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if(session!=null){
        ClienteDAO usuD=new ClienteDAO();
        Cliente usu;
        Comidas com;
        PedidoDAO peD=new PedidoDAO();
        ComidaDAO comD=new ComidaDAO();
        UsuarioDAO clD=new UsuarioDAO();
        DetalleDAO detD=new DetalleDAO();
        String accion=request.getParameter("accion");
        System.out.println(accion);
        if (accion!=null){
            switch(accion){
                case "Registro" -> {
                        String nombre=request.getParameter("nombre");
                         String usuario=request.getParameter("correo");
                    String contra=request.getParameter("contra");
                    String error="";
                    float saldo=0;
                    if(nombre!=null && usuario!=null && contra!=null){
                        System.out.println("si");
                        Cliente clis = new Cliente();
                            try {
                                clis = usuD.login(usuario, contra);
                            } catch (SQLException ex) {
                                Logger.getLogger(SvUsuarios.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        Usuario us=new Usuario();
                            try {
                                us = clD.buscarPorCorreo(usuario, contra);
                            } catch (SQLException ex) {
                                Logger.getLogger(SvUsuarios.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        if(clis==null && us==null){
                        usu=new Cliente(
                            usuD.no_cuenta(),
                                nombre,
                                usuario,
                                contra,
                                saldo     
                        );
                        boolean bandera=usuD.registrar(usu);
                            if(bandera==true){
                                session.setAttribute("usuario", usu);
                                response.sendRedirect("menu.jsp");
                            }
                            else{
                                System.out.println("1");
                                error="¡Ups! ha ocurrido un error";
                            request.setAttribute("error", error);
                            RequestDispatcher dis= request.getRequestDispatcher("registrar.jsp");
                            dis.forward(request, response);
                            }
                        }
                        else{
                            System.out.println("2");
                                                            error="¡Ups! ha ocurrido un error";
                            request.setAttribute("error", error);
                            RequestDispatcher dis= request.getRequestDispatcher("registrar.jsp");
                            dis.forward(request, response);
                        }
                    }
                    else{
                        System.out.println("3");
                                                    error="¡Ups! ha ocurrido un error";
                            request.setAttribute("error", error);
                            RequestDispatcher dis= request.getRequestDispatcher("registrar.jsp");
                            dis.forward(request, response);

                    }
                }
                case "Realizar pedido" -> {
                    
                   try{
                    usu=(Cliente)session.getAttribute("usuario");
                    int id_b=usu.getNo_cuenta();
                    float saldo_mayor=usuD.buscar(id_b);
                    float total=0;
                    List<Detalle> carrito= (List<Detalle>)session.getAttribute("carrito");
                    if(carrito!=null){
                    for(Detalle d: carrito){
                        total=d.getCantidad()*d.getPrecio();
                    }
                    if(saldo_mayor>=total){
                        Date date = new Date();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
                        String horaActual = dateFormat.format(date);
                        Date date2 = new Date();
                        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM=dd");
                        String fechaActual = dateFormat2.format(date2);
                        int id_pedido=peD.id();
                        boolean bandera=peD.pedir(usu, horaActual ,fechaActual, id_pedido, total);
                        if(bandera==true){
                        session = request.getSession(false);
                        List<Detalle> carritos= (List<Detalle>)session.getAttribute("carrito");
                      for(Detalle detalle : carritos){
                          int id=detalle.getId_comida();
                          detD.pedir(id, id_pedido, detalle.getCantidad());
                          int cantidadTotal=comD.buscarStock(id)-detalle.getCantidad();
                         comD.cambiar_stock(cantidadTotal, id);
                      }

                      float resta=total;
                      float saldo=saldo_mayor-resta;
                            System.out.println(resta);
                           System.out.println(saldo_mayor);
                           System.out.println(saldo);
                      usuD.restar(id_b, saldo);
                      List<Detalle>carritso=(List<Detalle>) session.getAttribute("carrito");
                      carritso.clear();
                      response.sendRedirect("menu.jsp");
                   }
                        else{response.sendRedirect("error.jsp");}
                    }
                    else{response.sendRedirect("error.jsp");}
                    }
                    else{response.sendRedirect("error.jsp");}
                   }
                   catch(Exception e){
                  response.sendRedirect("saldo.jsp");

                  }
                }
                case "pedir" -> {
                    String id =(request.getParameter("id_comida"));
                    if(id!=null && !id.isEmpty()){ 
                    int ids=Integer.parseInt(id);
                    request.setAttribute("id", ids);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("ordenar2.jsp");
                    dispatcher.forward(request, response);
                    }
                    else{
                        response.sendRedirect("error.jsp");
                    }
                }
                case "Cerrar sesion"->{
                    session.invalidate();
                    response.sendRedirect("inicio.jsp");
                }
                case"Cancelar pedido"->{
                    try{
                   int id=Integer.parseInt(request.getParameter("id_pedido"));
              peD.cambiar_stock("cancelado", id);
              
                    
                    response.sendRedirect("saldo.jsp");
                    }
                    catch(Exception e){
                    response.sendRedirect("error.jsp");
                    }
                   
                }
                case"eliminar" -> {
                    String id = request.getParameter("id");
                    if(id!=null){
                    try{
                        List<Detalle> carrito = (List<Detalle>) session.getAttribute("carrito");
                        int idProducto=Integer.parseInt(id);
                        if (carrito != null) {
                            Iterator<Detalle> iterator = carrito.iterator();
                            while (iterator.hasNext()) {
                                Detalle detalle = iterator.next();
                                if (detalle.getId_comida() == idProducto) {
                                    iterator.remove();
                                    response.sendRedirect("carrito.jsp");
                                    break;
                                }
                            }
                        }
                        else{
response.sendRedirect("error.jsp");
                        }
                    }
                    catch(Exception e){
                        System.out.println("Error :"+e);
                        response.sendRedirect("error.jsp");
                    }
                    }
                    else{
                     response.sendRedirect("error.jsp");   
                    }
                }
         case"Agregar producto" -> {
             if(request.getParameter("id")!=null && request.getParameter("cantidad")!=null){
             int idComida = Integer.parseInt(request.getParameter("id"));
             int cantidad = Integer.parseInt(request.getParameter("cantidad"));
             comD=new ComidaDAO();
             com=comD.buscarss(idComida);
             Detalle detalles = new Detalle(idComida, cantidad, com.getNombre(), com.getPrecio());
             
             List<Detalle> carritos = (List<Detalle>) request.getSession().getAttribute("carrito");
             if (carritos == null) {
                 carritos = new ArrayList<>();
                 session.setAttribute("carrito", carritos);
             }
             carritos.add(detalles);
             response.sendRedirect("carrito.jsp");  
                }
         
         else{
            response.sendRedirect("error.jsp");
            }
         }   
                case "guardar"->{
                    if(request.getParameter("id")!=null && request.getParameter("cantidad")!=null){
                    int idProducto = Integer.parseInt(request.getParameter("id"));
                    int cantidad=Integer.parseInt(request.getParameter("cantidad"));
                    List<Detalle> carrito = (List<Detalle>) session.getAttribute("carrito");
                    if (carrito != null) {
                        Iterator<Detalle> iterator = carrito.iterator();
                        while (iterator.hasNext()) {
                            Detalle detalle = iterator.next();
                            if (detalle.getId_comida() == idProducto) {
                                detalle.setCantidad(cantidad);
                                response.sendRedirect("carrito.jsp");
                                break;
                            }
                        }
                    }
                    else{
                        response.sendRedirect("error.jsp");
                    }
                    
                    
                }
                    else{response.sendRedirect("error.jsp");}
                }
            }
        }
        else{
        response.sendRedirect("index.jsp");
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