<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Cliente"%>
<%@page import="entidades.Pedido" %>
<%@page import="entidades.Comidas" %>
<%@page import="DAO.ComidaDAO"%>
<%@page import="DAO.PedidoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<%
        HttpSession session3 = request.getSession(false);

        if (session != null) {

        Cliente cli=(Cliente)session3.getAttribute("usuario");
    if(cli!=null){    
    %>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="./css/estilosmenu.css">
    <title>Click Lunch</title>
</head>
<body>
        <div id="sideNavigation" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="text-center">
            <img src="./graficos/imagenes/Click Lunch Final 2.png" alt="Logo" class="img-fluid">
        </div>
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
        <a class="nav-link" href="./carrito.jsp">
            <svg id="cart-icon" xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1); transition: transform 0.3s;">
                <path d="M21.822 7.431A1 1 0 0 0 21 7H7.333L6.179 4.23A1.994 1.994 0 0 0 4.333 3H2v2h2.333l4.744 11.385A1 1 0 0 0 10 17h8c.417 0 .79-.259.937-.648l3-8a1 1 0 0 0-.115-.921z"></path>
                <circle id="cart-circle1" cx="10.5" cy="19.5" r="1.5"></circle>
                <circle id="cart-circle2" cx="17.5" cy="19.5" r="1.5"></circle>
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
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center mt-4 mb-4">Menú</h2>
            </div>
        </div>

        <div class="container-scroll">
            <div class="row">
                <div class="col-md-12">
                    <%
                    ComidaDAO comD=new ComidaDAO();
                    List <Comidas> lis=comD.imprimirNormal();
                    Iterator <Comidas> its=comD.imprimirNormal().iterator();
                    Comidas com;
                    while(its.hasNext()){
                        com=its.next();
                        System.out.println(com.getId());
                    
                    %>
                  <a href="#" onclick="enviarFormulario('<%=com.getId()%>')">

                    <div class="card">
                  
<script>
  function enviarFormulario(idComida) {
    var form = document.createElement('form');
    form.method = 'post';
    form.action = 'SvUsuarios';

    var inputAccion = document.createElement('input');
    inputAccion.type = 'hidden';
    inputAccion.name = 'accion';
    inputAccion.value = 'pedir';
    form.appendChild(inputAccion);

    var inputIdComida = document.createElement('input');
    inputIdComida.type = 'hidden';
    inputIdComida.name = 'id_comida';
    inputIdComida.value = idComida;
    form.appendChild(inputIdComida);

    // Agrega el formulario al cuerpo del documento
    document.body.appendChild(form);

    // Envía el formulario
    form.submit();
  }
</script>
                                <img src="<%=com.getImg()%>" class="card-img-top"
                                    alt="Imagen del alimento">
                            
                            <div class="card-body">
                                <h5 class="card-title"><%=com.getNombre()%></h5>
                                <p class="card-text">Precio:<%=com.getPrecio()%></p>
                            </div>
                            
                        </div>
                     </a>
                     <%}%>
                    <div class="scroll-buttons">
                        <button class="scroll-left-btn" onclick="scrollCards('left')"><i
                                class="fas fa-chevron-left"></i></button>
                        <button class="scroll-right-btn" onclick="scrollCards('right')"><i
                                class="fas fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center mt-4 mb-4">Menú del día</h2>
            </div>
        </div>

        <div class="container-scroll mb-4">
            <div class="row">
                <div class="col-md-12">
                    <%
                    Iterator <Comidas> itsa=comD.imprimirDia().iterator();
                    Comidas come;
                    while(itsa.hasNext()){
                        come=itsa.next();
                    %>
                     <a href="#" onclick="enviarFormulario('<%=come.getId()%>')">

<script>
  function enviarFormulario(idComida) {
    var form = document.createElement('form');
    form.method = 'post';
    form.action = 'SvUsuarios';

    // Crea un elemento de entrada oculto para el parámetro 'accion'
    var inputAccion = document.createElement('input');
    inputAccion.type = 'hidden';
    inputAccion.name = 'accion';
    inputAccion.value = 'pedir';
    form.appendChild(inputAccion);

    // Crea un elemento de entrada oculto para el parámetro 'id_comida'
    var inputIdComida = document.createElement('input');
    inputIdComida.type = 'hidden';
    inputIdComida.name = 'id_comida';
    inputIdComida.value = idComida;
    form.appendChild(inputIdComida);

    // Agrega el formulario al cuerpo del documento
    document.body.appendChild(form);

    // Envía el formulario
    form.submit();
  }
</script>
                    <div class="card">
                       
<img src="<%=come.getImg()%>" class="card-img-top"
                                alt="Imagen del alimento">
                        
                        <div class="card-body">
                            <h5 class="card-title"><%=come.getNombre()%></h5>
                            <p class="card-text">Entrada</p>
                            <p class="card-text">Incluye refill de agua</p>
                            <p class="card-text">No se vende por separado</p>
                            <p class="card-text"><%=come.getPrecio()%></p>>
                        </div>
                        
                        
                    </div>
                        </a>
                        <%}%>
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="./Boostrap/js/bootstrap.bundle.min.js"></script>
    <script src="./js/scrollbarmenu.js"></script>
    <script src="./js/inicio.js"></script>
</body>

</html>


<%}
else{
%>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="./css/estilosmenu.css">
    <title>Click Lunch</title>
</head>
<body>
        <div id="sideNavigation" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="text-center">
            <img src="./graficos/imagenes/Click Lunch Final 2.png" alt="Logo" class="img-fluid">
        </div>
        <a href="./index.jsp">Home</a>
        <a href="./inicio.jsp">Iniciar Sesión</a>
        <a href="./registrar.jsp">Registrarse</a>
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

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center mt-4 mb-4">Menú</h2>
            </div>
        </div>

        <div class="container-scroll">
            <div class="row">
                <div class="col-md-12">
                    <%
                    ComidaDAO comD=new ComidaDAO();
                    List <Comidas> lis=comD.imprimirNormal();
                    Iterator <Comidas> its=comD.imprimirNormal().iterator();
                    Comidas com;
                    while(its.hasNext()){
                        com=its.next();
                    
                    %>
                    <a href="./inicio.jsp">    
                    <div class="card">
                            
                                <img src="<%=com.getImg()%>" class="card-img-top"
                                    alt="Imagen del alimento">
                            
                            <div class="card-body">
                                <h5 class="card-title"><%=com.getNombre()%></h5>
                                <p class="card-text">Precio:<%=com.getPrecio()%></p>
                            </div>
                            
                        </div>
                    </a>
                     <%}%>
                    <div class="scroll-buttons">
                        <button class="scroll-left-btn" onclick="scrollCards('left')"><i
                                class="fas fa-chevron-left"></i></button>
                        <button class="scroll-right-btn" onclick="scrollCards('right')"><i
                                class="fas fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center mt-4 mb-4">Menú del día</h2>
            </div>
        </div>

        <div class="container-scroll mb-4">
            <div class="row">
                <div class="col-md-12">
                    <%
                    Iterator <Comidas> itsa=comD.imprimirDia().iterator();
                    Comidas come;
                    while(itsa.hasNext()){
                        come=itsa.next();
                    %>
                                <a href="./inicio.jsp">

                    <div class="card">
                            <img src="<%=come.getImg()%>" class="card-img-top"
                                alt="Imagen del alimento">
                        
                        <div class="card-body">
                            <h5 class="card-title"><%=come.getNombre()%></h5>
                            <p class="card-text">Entrada</p>
                            <p class="card-text">Incluye refill de agua</p>
                            <p class="card-text">No se vende por separado</p>
                            <p class="card-text"><%=come.getPrecio()%></p>>
                        </div>
                        
                    </div>
                        </a>
                        <%}%>
                        
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="./Boostrap/js/bootstrap.bundle.min.js"></script>
    <script src="./js/scrollbarmenu.js"></script>
    <script src="./js/inicio.js"></script>
</body>

</html>
    
<%}
}
else{%>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="./css/estilosmenu.css">
    <title>Click Lunch</title>
</head>
<body>
        <div id="sideNavigation" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="text-center">
            <img src="./graficos/imagenes/Click Lunch Final 2.png" alt="Logo" class="img-fluid">
        </div>
        <a href="./index.jsp">Home</a>
        <a href="./inicio.jsp">Iniciar Sesión</a>
        <a href="./registrar.jsp">Registrarse</a>
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

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center mt-4 mb-4">Menú</h2>
            </div>
        </div>

        <div class="container-scroll">
            <div class="row">
                <div class="col-md-12">
                    <%
                    ComidaDAO comD=new ComidaDAO();
                    List <Comidas> lis=comD.imprimirNormal();
                    Iterator <Comidas> its=comD.imprimirNormal().iterator();
                    Comidas com;
                    while(its.hasNext()){
                        com=its.next();
                    
                    %>
                    <a href="./inicio.jsp">   
                    <div class="card">
                            
                                <img src="<%=com.getImg()%>" class="card-img-top"
                                    alt="Imagen del alimento">
                            
                            <div class="card-body">
                                <h5 class="card-title"><%=com.getNombre()%></h5>
                                <p class="card-text">Precio:<%=com.getPrecio()%></p>
                            </div>
                            
                        </div>
                            </a>
                     <%}%>
                    <div class="scroll-buttons">
                        <button class="scroll-left-btn" onclick="scrollCards('left')"><i
                                class="fas fa-chevron-left"></i></button>
                        <button class="scroll-right-btn" onclick="scrollCards('right')"><i
                                class="fas fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center mt-4 mb-4">Menú del día</h2>
            </div>
        </div>

        <div class="container-scroll mb-4">
            <div class="row">
                <div class="col-md-12">
                    <%
                    Iterator <Comidas> itsa=comD.imprimirDia().iterator();
                    Comidas come;
                    while(itsa.hasNext()){
                        come=itsa.next();
                    %>
                               <a href="./inicio.jsp">
                     
                    <div class="card">
                            <img src="<%=come.getImg()%>" class="card-img-top"
                                alt="Imagen del alimento">
                        
                        <div class="card-body">
                            <h5 class="card-title"><%=come.getNombre()%></h5>
                            <p class="card-text">Entrada</p>
                            <p class="card-text">Incluye refill de agua</p>
                            <p class="card-text">No se vende por separado</p>
                            <p class="card-text"><%=come.getPrecio()%></p>>
                        </div>
                        
                    </div>
                        </a>
                        
                        <%}%>
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="./Boostrap/js/bootstrap.bundle.min.js"></script>
    <script src="./js/scrollbarmenu.js"></script>
    <script src="./js/inicio.js"></script>
</body>

</html>

<%}%>