<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@page import="entidades.Cliente"%>
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
<!DOCTYPE html>
<html lang="en">
    <%
        HttpSession session3 = request.getSession(false);

    if (session != null) {
        Cliente usu=(Cliente)session3.getAttribute("usuario");
        ClienteDAO usuD=new ClienteDAO();
        if(usu!=null){
        Cliente cli=usuD.buscar_o(usu.getNo_cuenta());
        session3.setAttribute("saldo",cli);
        usu=(Cliente)session3.getAttribute("saldo");
    %>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">    
        <link rel="stylesheet" href="./css/estilossaldo.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
        <title>Saldo</title>
    </head>

    <body>
    <body>

        <div id="sideNavigation" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <div class="text-center">
                <img src="./graficos/imagenes/Click Lunch Final 2.png" alt="Logo" class="img-fluid">
            </div>
            <a href="./menu.jsp">Menú</a>
            <form action="SvUsuarios" method="post">
                <div class="text-center">
                    <input type="submit" name="accion" value="Cerrar sesion" class="btn btn-danger" readonly>
                </div>        
            </form>
        </div>
        <nav class="navbar topnav navbar-expand-lg">
            <a href="#" onclick="openNav()">
                <svg width="30" height="30" id="icoOpen">
                <path d="M0,5 30,5" stroke="#000" stroke-width="5" />
                <path d="M0,14 30,14" stroke="#000" stroke-width="5" />
                <path d="M0,23 30,23" stroke="#000" stroke-width="5" />
                </svg>
            </a>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link">Tu comida un click de distancia</a>
                    </li>
                </ul>
            </div>
            <a class="nav-link" id="title">Click Lunch</a>
        </nav>
        <div class="container d-flex flex-column align-items-center justify-content-center" style="height: 100vh">
            <h1>Saldo</h1>
            <h1 id="numcuenta" class="text-center mt-4 mb-4"><%=usu.getNombre()%><br>Numero de cuenta: <%=usu.getNo_cuenta()%></h1>
            <div class="numsaldo">
                <img src="./graficos/iconos/bx-dollar-circle.svg"><%=usu.getSaldo()%></div>
            <table class="table table-sm mt-4">
                <thead><th scope="col"></th>
                <th scope="col">Fecha</th>
                <th scope="col">Alimento</th>
                <th scope="col">Cantidad</th>
                                <th scope="col">precio</th>
                <th scope="col">Total</th>
                <th scope="col">Éstado de pedido</th>
                <th scope="col">Cancelar pedido</th>
                </thead>
                <tbody>
                    <%
                    PedidoDAO peD = new PedidoDAO();
                    DetalleDAO detD=new DetalleDAO();
                    List<Pedido>lis = peD.visualizar_pedidos_vista_cliente(usu.getNo_cuenta());
                    Comidas com;
                    ComidaDAO comD = new ComidaDAO();
                    for(Pedido ped: lis){
                    int id_p = ped.getId_pedido();
                    %>
                    <tr>
                        <th scope='row'><img src='./graficos/iconos/bx-time.svg'></th>
                        <td><%=ped.getFecha()%></td>
                        <td>

                                    <%
                                    List<Detalle> lisaa=detD.visualizar_detalle(id_p);
                                    for(Detalle detalle: lisaa){
                                    int id_c=detalle.getId_comida();
                                    com=comD.buscarss(id_c);
                                    float subtotal=detalle.getCantidad()*com.getPrecio();
                                    %>
                                    <%=com.getNombre()%></td>
                                        <td><%=detalle.getCantidad()%></td>
                                        <td><%=subtotal%></td>
                                    
                                <%}%>
                        <td><%=ped.getPrecio()%></td>
                        <td><%=ped.getEstado()%></td>
                        <%
                        Date fechaActual = new Date();

                    String fechaRegistrada = ped.getFecha();
                    String horaRegistrada = ped.getHora();

    
                    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
                    Date fechaRegistradaDate = formatoFecha.parse(fechaRegistrada);

                    SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm:ss");
                    Date horaRegistradaDate = formatoHora.parse(horaRegistrada);

                    Calendar calendarRegistrada = Calendar.getInstance();
                    calendarRegistrada.setTime(fechaRegistradaDate);
                    Calendar horaCalendarRegistrada = Calendar.getInstance();
                    horaCalendarRegistrada.setTime(horaRegistradaDate);
                    calendarRegistrada.set(Calendar.HOUR_OF_DAY, horaCalendarRegistrada.get(Calendar.HOUR_OF_DAY));
                    calendarRegistrada.set(Calendar.MINUTE, horaCalendarRegistrada.get(Calendar.MINUTE));
                    calendarRegistrada.set(Calendar.SECOND, horaCalendarRegistrada.get(Calendar.SECOND));

                    long diferenciaMillis = fechaActual.getTime() - calendarRegistrada.getTimeInMillis();
                    if(ped  .getEstado().equals("hecho")){
                    if (Math.abs(diferenciaMillis) < 300000 ) {%>

                        <td>
                            <form action="SvUsuarios" method="Post">
                                <input type="hidden" name="id_pedido" value="<%=ped.getId_pedido()%>">
                                <input type="submit" name="accion" value="Cancelar pedido">
                            </form>
                        </td>
                        <%}%>
                    </tr>
                    <%
                }
                }
                    %>
                </tbody>
            </table>
        </div>
        <footer class=" py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Contacto</h4>
                        <p>Teléfono: 123-456-7890</p>
                        <p>Email: info@clicklunch.com</p>
                        <div class="redes">
                            <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="https://www.instagram.com/innotech_oficial/" class="social-icon"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h4>Horario</h4>
                        <p>Lunes a Viernes: 7:00 AM - 8:00 PM</p>
                        <p>Domingos y Sabados: Cerrado</p>
                    </div>
                </div>
                <hr>
                <div class="text-center">
                    <p>&copy; 2023 Click Lunch - Inno-Tech
                    </p>
                </div>
            </div>
        </footer>
        <script src="./js/inicio.js"></script>
        <script src="./Boostrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
<%
    }
    else
    {
        response.sendRedirect("menu.jsp");
    }
}
else
{
response.sendRedirect("menu.jsp");
}
%>