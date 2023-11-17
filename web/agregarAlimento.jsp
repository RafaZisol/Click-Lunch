<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/alimento.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Agregar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
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
      <p class="title">VISTA PREVIA</p>
      <p class="titleee">DATOS DEL PRODUCTO</p>
    <div class="cards">
        <div class="card rotate-vert-center" id="myElement">
            <div class="imagenpre">
                <label for="imageUpload" id="previewLink" class="hiddenFileInput">
                    <input type="file" name="theFile" id="imageUpload" accept="image/*" />
                    <img id="previewImage" class="card-img" src="../img/img2.png" alt="hola"  style="width: 100%; height: auto;">
                </label>
            </div>  
            <div class="card-body">
                <div class="card-title">
                  <p id="nothing">.........................................</p>
                  <span id="cardTitle">Nombre del Producto</span>
                </div>
                <div class="card-price">
                    <sup>$</sup>
                <span id="cardDescription">100</span><small>.00</small>
                </div>
            </div>
          </div>
    </div>
    <div class="inputs">
              <form action="ServletAlimento" method="Post" enctype="multipart/form-data">
      <div class="inpuut-campo">
          <input type="text" id="productName" name="nombre" required>
          <label>Nombre del Producto</label>
      </div>
      <div class="inpuut-campo">
          <input type="text" id="productDescription" name="descripcion" required>
          <label>Descripción</label>
      </div>
      <div class="inpuut-campo">
          <input type="number" id="productPrecio" name="precio"  required>
          <label>Precio</label>
      </div>
      <div class="inpuut-campo">
          <input type="number" id="productPrecio" min="0" name="cantidad" required>
        <label>Cantidad</label>
      </div>
      <div class="inpuut-campo" id="cd">
        <select name="menu" id="menu">
    <option value="normal">Menu normal</option>
    <option value="dia">Menu del día</option>
  </select>
        <label id="lab">Tipo</label>
      </div>
      <div class="imgBx">
        <label for="imageUp" id="previewLink">
          <input type="file" name="file" id="imageUp" accept="image/*" />
        </label>
      </div> 
      <div class="bton">
          <input type="submit" name="accion" value="Enviar" class="btn btn-primary btn-lg boton" id="boton">
      </div>
      </form>
  </div>
    <div class="megacard">
        <div class="cardd">
            <div class="imgBox">
                <label for="imageUp" id="previewLink" class="hiddenFileInput">
                        <input type="file" name="theFile" id="imageUp" accept="image/*" />
                        <img id="previewImg" class="card-img" src="../img/img2.png" alt="hola"  style="width: 100%; height: auto;">
                </label>
            </div>
            <div class="detailss">
                <div class="titlee" id="titlemega">
                    <h3>
                        Nombre del producto
                    </h3>
                </div>
                <div class="description">
                    <h4>
                        Descripción
                    </h4>
                    <p id="descriptionmega">Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis dolor dolorum cupiditate ut nulla sit repellendus porro 
                    
                    </p>
                </div>
            <div class="types">
                <h4>Sabor</h4>
                <br>
                <ul>
                    <li>34</li>
                    <li>35</li>
                    <li>36</li>
                    <li>37</li>
                    <li>38</li>
                    <li>40</li>
    
                </ul>
            </div>
            <div class="buy">
                <div class="precio">
                    <sup>$</sup>
                    <span id="megacardPrice">100</span><small>.00</small>
                </div>
                <div class="bton">
                    <a href="#">Comprar</a>
                </div>
            </div>
            </div>
        </div>
    </div>
    <script>
        const productNameTextarea = document.getElementById("productName");
        const productPrecioInput = document.getElementById("productPrecio");
        const productDescriptionInput = document.getElementById("productDescription");
        const cardTitle = document.getElementById("cardTitle");
        const cardDescription = document.getElementById("cardDescription");
        const megacardTitle = document.getElementById("titlemega");
        const megacardDescription = document.getElementById("descriptionmega");
      
        productNameTextarea.addEventListener("input", function () {
          cardTitle.textContent = productNameTextarea.value.slice(0, 30);
          megacardTitle.textContent = productNameTextarea.value.slice(0, 30);
          megacardTitle.style.fontSize = "1.5rem";
          cardTitle.style.textAlign = 'left';
        });
      
        productPrecioInput.addEventListener("input", function () {
          cardDescription.textContent = productPrecioInput.value.slice(0, 4);
          megacardPrice.textContent = productPrecioInput.value.slice(0, 4);
          cardDescription.style.textAlign = 'left';
        });
        productDescriptionInput.addEventListener("input", function () {
          megacardDescription.textContent = productDescriptionInput.value.slice(0,150);
          cardDescription.style.textAlign = 'left';
        });
      </script>
  <script>
    const imageUpload = document.getElementById('imageUpload');
    const previewImage = document.getElementById('previewImage');
    const imageUp = document.getElementById('imageUp');
    const previewImg = document.getElementById('previewImg');
    const imgUp = document.getElementById('imgUp');


    imageUpload.addEventListener('change', () => {
      const file = imageUpload.files[0];
      if (file) {
        const reader = new FileReader();
        reader.addEventListener('load', () => {
          previewImage.setAttribute('src', reader.result);
          previewImg.setAttribute('src', reader.result);
        });
        reader.readAsDataURL(file);
      }
    });

    imageUp.addEventListener('change', () => {
      const file = imageUp.files[0];
      if (file) {
        const reader = new FileReader();
        reader.addEventListener('load', () => {
          previewImg.setAttribute('src', reader.result);
          previewImage.setAttribute('src', reader.result);
        });
        reader.readAsDataURL(file);
      }
    });
  </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</body>
</html>