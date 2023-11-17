<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@page import="entidades.Cliente"%>
<%@page import="entidades.Comidas"%>
<%@page import="entidades.Pedido" %>
<%@page import="entidades.Detalle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Usuario"%>
<%@page import="DAO.DetalleDAO"%>
<%@page import="DAO.ComidaDAO"%>
<%@page import="DAO.PedidoDAO"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%
    HttpSession session5 = request.getSession(false);

    if (session5 != null) {
    Usuario usus=(Usuario)session5.getAttribute("caja");
    if(usus!=null){
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cajero</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/caja.css">
</head>
<body>
    <nav>
      <ul>
            <ul>
                <li><a href="./agregarsaldo.jsp"> Agregar Saldo </a></li>
                <li><a href="./indexCaja.jsp"> Home </a></li>
                <li><a href="./agregarAlimento.jsp"> Agregar alimento </a></li>
                <LI><a href="./comidas.jsp"> Stock de alimentos</a></LI>
                <li><form action="ServletCaja" method="Post" class="text-center">
                        <input type="submit"name="accion" value="Cerrar Sesión" class="btn btn-danger">
                </form></li>
            </ul>
      </ul>
    </nav>
    <p class="title">PEDIDOS EN CURSO</p>
    <div class="cards">
      <div class="outer">
          <%
          PedidoDAO peD = new PedidoDAO();
    DetalleDAO detD=new DetalleDAO();
    ClienteDAO usuD=new ClienteDAO();
    Cliente usu;    
        ComidaDAO comD = new ComidaDAO();

               Comidas com;
               int delay=-1;
               List<Pedido>listas=peD.visualizar_pedidos();
               for(Pedido pe:listas){
               int id_p = pe.getId_pedido();
    usu=usuD.buscar_o(pe.getNo_cuenta());
    if(pe.getEstado().equals("preparar") || pe.getEstado().equals("hecho")){
              
              
          delay+=-1;
          
          
          
          %>
          <div class="card" style="--delay:<%=delay%>;">
              <div class="header">
                  <div class="profile">
                      <div class="details">
                         <h4>Usuario</h4>
                         <p><%=usu.getNombre()%>: <%=usu.getNo_cuenta()%></p>
                      </div>
                  </div>
                  <%
                     List<Detalle> lisaas=detD.visualizar_detalle(id_p);
                    for(Detalle detalle: lisaas){
                    int id_c=detalle.getId_comida();
                    com=comD.buscarss(id_c);
                  
                  %>
                  <div class="star">List<Detalle> 
                          <%=com.getNombre()%> cantidad <%=detalle.getCantidad()%>
                  </div>
                  <%}%>
              </div>
              <div class="testimonial">
                  <p>Nose</p>
              </div>
              <%
                String value="hecho";
                if(pe.getEstado().equals("hecho")){
                  value="preparar";
                  }
                  else{
                  value="completado";
                  }
              %>
              <form action="ServletCaja" method="Post">
                  <input type="hidden" name="id" value="<%=pe.getId_pedido()%>">
                  <input type="submit" name="accion" value="<%=value%>">
              </form>
              <button type="button" class="btn btn-primary"
              style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
              Entregado
              </button>
          </div>
          <%
              }
              }
          %>
          
      </div>
  </div>
  <p class="titlee">HISTORIAL DE PEDIDOS</p>
  <div class="table-container">
    <p class="titlee">HISTORIAL DE PEDIDOS</p>
    <div class="table-scroll">
        <table class="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Usuario</th>
                <th scope="col">Alimentos</th>
                <th scope="col">Total</th>
              </tr>
            </thead>
            <%
              
    List<Pedido>lis = peD.visualizar_pedidos();
    for(Pedido ped: lis){
    int id_p=ped.getId_pedido();
              usu=usuD.buscar_o(ped.getNo_cuenta());

          %>
            <tbody class="table-group-divider">
              <tr>
                <th scope="row">1</th>
                <td><%=usu.getNo_cuenta()%>: <%=usu.getNombre()%></td>
                  <td>
                       <%
                    List<Detalle> lisaa=detD.visualizar_detalle(id_p);
                    for(Detalle detalle: lisaa){
                    int id_c=detalle.getId_comida();
                    com=comD.buscarss(id_c);
                    float subtotal=detalle.getCantidad()*com.getPrecio();
                    %>
                      <p>
                          <%=com.getNombre()%>
                          </p>
                      <%}%>
                  </td>
                  <td><%=ped.getPrecio()%></td>
                  <%if(ped.getEstado().equals("completado")){%>
                  <td>
                      <form action="ServletCaja" method="Post">
                          <input type="hidden" name="id" value="<%=ped.getId_pedido()%>">
                          <input type="submit" name="accion" value="entregado">
                      </form>
                  </td>
                  <%}%>
              </tr>
              <%}
                
              %>
            </tbody>
          </table>
    </div>

  </div>
<script src="../js/caja.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</body>
</html>
<%
    }
else{
response.sendRedirect("index.jsp");
}
}
else{
response.sendRedirect("index.jsp");
}
%>