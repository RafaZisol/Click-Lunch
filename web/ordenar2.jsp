<%@page import="entidades.Cliente"%>
<%@page import="entidades.Pedido" %>
<%@page import="entidades.Comidas" %>
<%@page import="DAO.ComidaDAO"%>
<%@page import="DAO.PedidoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<%
    HttpSession session4 = request.getSession(false);
    if (session4 != null) {
    Cliente usu=(Cliente)session4.getAttribute("usuario");
    if(usu!=null){
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Document</title>
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
            <input type="submit" name="accion" value="Cerrar sesion" class="btn btn-danger">
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
                    <a class="nav-link">Tu comida a un click de distancia</a>
                </li>
            </ul>
        </div>
        <a class="nav-link" id="title">Click Lunch</a>
    </nav>
    <%
    ComidaDAO comD=new ComidaDAO();
    Comidas com=new Comidas();
        String idS=request.getAttribute("id").toString();

    int id=Integer.parseInt(idS);
    com=comD.buscarss(id);
    String im=com.getImg();
    %>
    <div class="cardd">
        <div class="imgBox">
            <img src="<%=im%>">
        </div>
        <div class="detailss">
            <div class="titlee">
                <h3>
                    Nombre del producto: 
                    <%=com.getNombre()%>
                </h3>
            </div>
            <div class="description">
                <h4>
                    Descripcion:
                    
                </h4>
                <p><%=com.getDescripcion()%></p>
            </div>
            
        
        <div class="buy">
            <div class="precio">
                <sup>$</sup>
                <span><%=com.getPrecio()%></span>
            </div>
            <div class="bton">
             

                <form action="SvUsuarios" method="post">
                    <input type="hidden" name="id" value="<%=com.getId()%>">
                    <label for="numero">Eliga la cantidad:</label>
                    <input type="number" name="cantidad" max="<%=com.getEstado()%>"required pattern="(^[0-9]{1,3}$|^[0-9]{1,3}\.[0-9]{1,3}$)">
                    <input type="submit" name="accion" value="Agregar producto">
                </form>
            </div>  
        </div>
        </div>
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
    <script>
    const inputNumero = document.getElementById('cantidad');

    inputNumero.addEventListener('input', function() {
      const valorIngresado = parseInt(inputNumero.value, 10);
      const limiteMaximo = <%=com.getEstado()%>

      if (valorIngresado > limiteMaximo) {
        inputNumero.setCustomValidity('El número excede el límite máximo permitido.');
      } else {
        inputNumero.setCustomValidity('');
      }
    });
  </script>
</body>
</html>
<%}    
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