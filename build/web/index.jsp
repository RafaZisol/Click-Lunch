<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Boostrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="./css/estilosinindex.css">
    <title>Document</title>
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
        <a href="./menu.jsp">Menú</a>
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

    <div class="container d-flex flex-column align-items-center justify-content-center mt-4 mb-4">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="text-center">Bienvenidos <br>a<br> Click Lunch</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6">
                <div class="intro justify-text p-4 rounded">
                    <p>¿Qué es Click Lunch?</p>
                    <p>Click Lunch es un proyecto que busca solucionar la problemática común que afecta a muchos
                        estudiantes:
                        <br><strong>La falta de tiempo para ingerir alimentos en las cafeterías escolares.</strong><br>
                        Este
                        problema puede provocar trastornos alimenticios, generar estrés y ansiedad en los estudiantes, y
                        afectar su
                        capacidad para concentrarse en las clases y su desempeño académico en general. Click Lunch
                        ofrece una solución
                        práctica y eficiente para que los estudiantes puedan disfrutar de una comida nutritiva en un
                        tiempo adecuado.
                    </p>
                    <p>¿Quiénes somos?</p>
                    <p>
                        Somos <strong>Inno-Tech</strong> una empresa que trata de ayudar a los demás de manera
                        particular y general para
                        resolver problemáticas que afecten a la comunidad o programar para negocios que necesitan un
                        sistema auxiliar
                        sin afectar su forma de trabajar en su negocio.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <footer class=" py-4 mt-4">
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
    <script src="./Boostrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>