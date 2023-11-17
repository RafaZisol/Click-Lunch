<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/estiloregistrar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Registrarse</title>
</head>
<body>
    <div id="sideNavigation" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="text-center">
            <img src="./graficos/imagenes/Click Lunch Final 2.png" alt="Logo" class="img-fluid">
        </div>
        <a href="./index.jsp">Home</a>
            <a href="./inicio.jsp">Iniciar Sesi�n</a>
            <a href="./registrar.jsp">Registrarse</a>
            <a href="./menu.jsp">Men�</a>
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

        <form class="form_main p-3 bg-light text-left d-flex mx-auto rounded" id="fondo" action="SvUsuarios" method="Post">
            <h1 class="text-center">Registrate</h1>
            <div class="inputContainer text-center">
                <input placeholder="Usuario" id="user" class="inputField form-control mb-3" type="text"
                       pattern="[a-zA-Z\s]+" minlength="10" name="nombre"
                    title="Ingrese un nombre de usuario v�lido (solo letras)" required>
            </div>
            <div class="inputContainer text-center">
                <svg viewBox="0 0 16 16" fill="#2e2e2e" height="16" width="16" xmlns="http://www.w3.org/2000/svg"
                    class="inputIcon">
                    <path
                        d="M13.106 7.222c0-2.967-2.249-5.032-5.482-5.032-3.35 0-5.646 2.318-5.646 5.702 0 3.493 2.235 5.708 5.762 5.708.862 0 1.689-.123 2.304-.335v-.862c-.43.199-1.354.328-2.29.328-2.926 0-4.813-1.88-4.813-4.798 0-2.844 1.921-4.881 4.594-4.881 2.735 0 4.608 1.688 4.608 4.156 0 1.682-.554 2.769-1.416 2.769-.492 0-.772-.28-.772-.76V5.206H8.923v.834h-.11c-.266-.595-.881-.964-1.6-.964-1.4 0-2.378 1.162-2.378 2.823 0 1.737.957 2.906 2.379 2.906.8 0 1.415-.39 1.709-1.087h.11c.081.67.703 1.148 1.503 1.148 1.572 0 2.57-1.415 2.57-3.643zm-7.177.704c0-1.197.54-1.907 1.456-1.907.93 0 1.524.738 1.524 1.907S8.308 9.84 7.371 9.84c-.895 0-1.442-.725-1.442-1.914z">
                    </path>
                </svg>
                <input placeholder="Correo Electr�nico" id="correo" class="inputField form-control mb-3" type="text"
                    pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" name="correo"
                    title="Ingrese una direcci�n de correo valida" required>
            </div>
            <div class="inputContainer text-center">
                <svg viewBox="0 0 16 16" fill="#2e2e2e" height="16" width="16" xmlns="http://www.w3.org/2000/svg"
                    class="inputIcon">
                    <path
                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z">
                    </path>
                </svg>
                <input placeholder="Contrase�a" id="password" class="inputField form-control mb-3" type="password" name="contra"
                    pattern=".{8,}" title="La contrase�a debe tener al menos 8 caracteres" required>
            </div>
            <input type="submit" id="button" class="btn btn-primary mb-3" name="accion" value="Registro">
            <div class="signupContainer mt-4">
                <p>�Ya tienes cuenta?</p>
                <a class="mb-4" href="./inicio.jsp">Inicia Sesi�n</a>
            </div>
        </form>
    </div>
    <footer class=" py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h4>Contacto</h4>
                    <p>Tel�fono: 123-456-7890</p>
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
    <script src="./Boostrap/js/bootstrap.bundle.min.js"></script>
    <script>
    window.onload=function(){
<% String error ="";
error=(String) request.getAttribute(error);
if(error!=null && !error.isEmpty()){%>
swal("espera",'<%=error%>', "error");
    <%}
    %>
} 
</script>
</body>
</html>
