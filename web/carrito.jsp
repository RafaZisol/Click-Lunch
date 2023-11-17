<%@page import="entidades.Cliente"%>
<%@page import="entidades.Pedido"%>
<%@page import="entidades.Comidas"%>
<%@page import="entidades.Detalle"%>
<%@page import="DAO.ComidaDAO"%>
<%@page import="DAO.PedidoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
    <%
        HttpSession session4 = request.getSession(false);    
        if (session4 != null) {
        Cliente usu=(Cliente)session4.getAttribute("usuario");
        if(usu!=null){
    %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="./css/estiloscarrito.css">
        <title>Carrito</title>
    </head>

    <body>

        <div id="sideNavigation" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <div class="text-center">
                <img src="./graficos/imagenes/Click Lunch Final 2.png" alt="Logo" class="img-fluid">
            </div>
            <a href="./menu.jsp">Menú</a>
            <a href="./saldo.jsp">Saldo</a>
            <form action="SvUsuarios" method="post">
                <div class="text-center">
                    <input type="submit" name="accion" value="Cerrar sesion" class="btn btn-danger">
                </div>            
            </form>
        </div>
        <nav class="navbar topnav navbar-expand-lg">
            <a href="#" id="nav-icon" onclick="openNav()">
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

        <div class="container mt-4 mb-4 align-items-center justify-content-center">

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" class="text-center">Producto</th>
                        <th scope="col" class="text-center">Descripción</th>
                        <th scope="col" class="text-center">Precio</th>
                        <th scope="col" class="text-center">Cantidad</th>
                        <th scope="col" class="text-center"></th>
                        <th scope="col" class="text-center">Subtotal</th>
                    </tr>
                </thead>
                <% 
        float total=0;
        Comidas com;
        ComidaDAO comD=new ComidaDAO();
        List<Detalle> carrito = (List<Detalle>)session.getAttribute("carrito");
        if (carrito != null) {
        for (Detalle detalle : carrito) {
        float subtotal=detalle.getPrecio()*detalle.getCantidad();
        total+=subtotal;
        com=comD.buscarss(detalle.getId_comida());
        session.setAttribute("id",detalle.getId_comida());
                %>
                <tbody>
                    <tr>
                            <td class="text-center">
                                <img src="<%=com.getImg()%>" alt="Imagen de producto"
                                     class="product-image">
                            </td>
                            <td><%=detalle.getNombre()%><br><%=com.getDescripcion()%></td>
                            <td class="text-center"><%=detalle.getPrecio()%></td>
                            <td class="text-center">
                                <form action="SvUsuarios" method="Post">
                                    <input type="hidden" name="id" value="<%=detalle.getId_comida()%>" pattern="(^[0-9]{1,3}$|^[0-9]{1,3}\.[0-9]{1,3}$)
">
                                    <input class="form-control quantity-input" type="number" value="<%=detalle.getCantidad()%>" min="1" max="5" name="cantidad"> 
                                    <input type="submit" name="accion" value="guardar">
                                </form>
                            </td>

                            <td class="text-center">
                                <form action="SvUsuarios" method="Post">
                                    <input type="hidden" name="id" value="<%=detalle.getId_comida()%>">
                                    <input type="submit" class="btn btn-danger btn-sm" name="accion" value="eliminar">    
                                </form>            
                            </td>
                            <td class="text-center"><i><%=subtotal%></i></td>
                            <%
                    }
                }
                        %>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="text-center"><strong>Total:</strong></td>
                        <td class="text-center"><strong><%=total%></strong></td>
                    </tr>
                </tbody>
               
                
            </table><%
            if(carrito!=null){
            if(total<=usu.getSaldo() && !carrito.isEmpty()){
            %>
            <div class="text-center">
                <form action="SvUsuarios" method="Post">
                    <input type="submit" class="btn btn-success buy-button" name="accion" value="Realizar pedido">
                </form>
            </div>
            <%}
                }%>
        </div>


        <footer class=" py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Contacto</h4>
                        <p>Telï¿½fono: 123-456-7890</p>
                        <p>Email: innotech.dudas@gmail.com</p>
                        <div class="redes">
                            <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
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

}
%>