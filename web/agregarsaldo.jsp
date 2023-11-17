<%@page import="entidades.Usuario"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@page import="entidades.Cliente"%>
<%@page import="entidades.Usuario"%>
<%@page import="entidades.Comidas"%>
<%@page import="entidades.Pedido" %>
<%@page import="entidades.Detalle"%>
<%@page import="DAO.DetalleDAO"%>
<%@page import="DAO.ComidaDAO"%>
<%@page import="DAO.PedidoDAO"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="./css/saldo.css">
    <title>Saldo</title>
</head>
<body>
<nav>
      <ul>
            <ul>
                <li><a href="./agregarsaldo.jsp"> Agregar Saldo </a></li>
                <li><a href="./indexCaja.jsp"> Home </a></li>
                <li><a href="./agregarAlimento.jsp"> Status de alimento </a></li>
                <li><form action="ServletCaja" method="Post" class="text-center">
                        <input type="submit"name="accion" value="Cerrar Sesión" class="btn btn-danger">
                </form></li>
            </ul>
      </ul>
    </nav>
    <div class="forzm-container">
    <form action="ServletCaja" method="Post">
        <div class="left">
            <div class="input-group input-group-lg" id="numecuenta">

            </div>     
            <div class="input-group input-group-lg">
                <div class="input-group-prepend">
                  <span class="input-group-text">$</span>
                </div>
                <input type="number" step="10" placeholder="0.00" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" min="10" id="amountInput" name="saldo">
              </div>
              
              <br><br>
              
              <select class="form-select form-select-sm" id="amountSelect" aria-label=".form-select-sm example" name="saldo">
                <option selected>Elije el monto a recargar</option>
                <option value="20">$20</option>
                <option value="30">$30</option>
                <option value="50">$50</option>
                <option value="100">$100</option>
              </select>
              <label>
                  Id
              </label>
              <input type="number" name="id_saldo" required pattern="(^[0-9]{1,3}$|^[0-9]{1,3})">
              <input class="btn" type="submit" name="accion" value="Añadir saldo">
        </div>
    </form>
  </div>
    <div class="table-container text-center">
    <table class="table">
        <thead>
            <tr>
                <th scope="1">Fecha</th>
                <th scope="1">Numero de cuenta</th>
                <th scope="1">Saldo recargado</th>
            </tr>
        </thead>
        <tbody>
            <%
            PedidoDAO peD=new PedidoDAO();
            List<Pedido> lsita=peD.visSaldo();
            for(Pedido pe: lsita){
            %>
            <tr>
                <td><%=pe.getFecha()%></td>
                <td><%=pe.getNo_cuenta()%></td>
                <td><%=pe.getPrecio()%></td>
            </tr>
            <%}%>
        </tbody>
    </table>    
    </div>
      <script src="./js/valid.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script></body>
</html>