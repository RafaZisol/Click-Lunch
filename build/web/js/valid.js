function contras() {
    let contra = document.getElementById("contra").value;
    let cont = document.getElementById("contra1").value;
    if (contra.length >= 8) {
        if (contra == cont) {
            alert("BUENA")
        }
        else {
            alert("ERROR")
        }
    }
    else {
        alert("Verifique el tamaño de la contraseña")
    }
}

function nombre(){
    let nombre = document.getElementsById("usuario").value;
    if (nombre.length<=20){
        alert("Usuario Correcto")
    }
}

function validarMail() { 
    validar = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
    let email = document.getElementsById("correo").value;
    if(validar.test(email)){
        
    }
  }

  function centerText(input) {
    var textLength = input.value.length;
    input.setSelectionRange(textLength, textLength);
  }
  
  const input = document.getElementById('amountInput');
  const select = document.getElementById('amountSelect');
  
  input.addEventListener('input', function() {
    if (this.value.length > 0) {
      select.disabled = true;
    } else {
      select.disabled = false;
    }
  });
  select.addEventListener('change', function() {
    if (this.value !== '') {
      input.disabled = true;
    } else {
      input.disabled = false;
    }
  });