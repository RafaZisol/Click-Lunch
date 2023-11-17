/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;
import DAO.ComidaDAO;
import entidades.Comidas;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.ResultSet;
import jakarta.servlet.annotation.*;
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class ServletAlimento extends HttpServlet {

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
        Comidas com;
        HttpSession session=request.getSession(false);
        if(session!=null){
            if(request.getParameter("menu")!=null && request.getParameter("nombre")!=null && request.getParameter("descripcion")!=null&& request.getParameter("precio")!=null && request.getParameter("cantidad")!=null && request.getPart("file")!=null){
        try{
            //\A(?=[A-Za-z]+[0-9]|[0-9]+[A-Za-z])[A-Za-z0-9]
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            String nombre=request.getParameter("nombre");
            String fileNameN=nombre+fileName.substring(fileName.lastIndexOf("."));
            filePart.write("C:\\Users\\artem\\Documents\\PA\\web\\graficos\\alimentos\\" + fileNameN); 
            String mimeType = filePart.getContentType();
        String error = "";
        if (mimeType != "image/png" || mimeType != "image/jpg" ){
            error = "datos registrados";
        }  
        String urlImg = "./graficos/alimentos/" + fileNameN;
              String tipo=request.getParameter("menu");
              System.out.println(tipo);
            int cantidad=Integer.parseInt(request.getParameter("cantidad"));
                com=new Comidas(
                comD.id(),
                request.getParameter("nombre"),
                request.getParameter("descripcion"),
                Float.parseFloat(request.getParameter("precio")),
                cantidad,
                tipo,
                urlImg
                );
              comD.insertar(com);
              response.sendRedirect("indexCaja.jsp");
        }
        catch(Exception e){
            response.sendRedirect("error.jsp");
            System.out.println("Error al agregar alimento: "+e);
        }
    }
        }
    else{
                  response.sendRedirect("error.jsp");
                  System.out.println("ses");
}

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
