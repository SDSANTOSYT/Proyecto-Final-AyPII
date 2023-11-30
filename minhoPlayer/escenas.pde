int x = 200, y = 300, w = 200, h = 50;
// Escenas

//inicio
void inicio() {
  size(1600, 900);
  image(fondoPrin, 0, 0);
  textAlign(CENTER);
  textFont(font);
  textField.setVisible(false);
  textField2.setVisible(false);
  botons(550, 400, 400, 50, 2, "Play", 50);
  botons(550, 500, 400, 50, 3, "Credits", 50);
  botons(550, 600, 400, 50, 4, "Exit", 50);
}

//juego
void juego() {
  dibujarlab();
  //smoothDraw();
  drawSelection();
  if ( count == 1 ) {
    posicX = entryCol;
    posicY = entryRow;
  } else if (count >= 2) {
    dibujarBolita(posicY, posicX);
  }
  if (buscar) {
    if (iii < filas*columnas) {
      drawSteps();
    }
  }
  image(personaje2, 1200, 350, 500, 500);
  String texto;
  if (posicX == exitCol && posicY == exitRow) {
    texto = "Bien hecho " + nombre ;
  } else {
     texto = "Tranquilo " + nombre + ", \n yo te espero";
  }
  fill(0);
  text(texto, 855, 250, 800, 480);
  fill(255);
  text(texto, 850, 250, 800, 420);
  botons(1468, 16, 115, 115, 2, "", 5000);
  image(Reiniciar, 1460, 10);
  botons(1302, 16, 115, 115, 212, "", 5000);
  image(Bombilla, 1295, 10);
  textField.setVisible(false);
  textField2.setVisible(false);
}
//  tutorial 1
void tutorial1() {
  size(1600, 900);
  image(fondoTutorial1, 0, 0);
  image(personaje, -250, 0);
  textField.setVisible(false);
  textField2.setVisible(false);
  botons(1150, 800, 400, 50, 22, "Continuar", 50);
  botons(100, 20, 400, 50, 27, "Saltar tutorial", 50);
  String texto = "Hola, " + nombre + " , mi nombre es MINHO y te doy la bienvenida a mi laberinto.";
  fill(0);
  text(texto, 555, 670, 780, 280);
  fill(#D91EFF);
  text(texto, 550, 670, 780, 320);
}

void tutorial2() {
  size(1600, 900);
  image(fondoTutorial2, 0, 0);
  textField.setVisible(false);
  textField2.setVisible(false);
  botons(580, 800, 400, 50, 23, "Continuar", 50);
  botons(100, 20, 400, 50, 27, "Saltar tutorial", 50);
}

void tutorial3() {
  size(1600, 900);
  image(fondoTutorial3, 0, 0);
  textField.setVisible(false);
  textField2.setVisible(false);
  botons(1150, 800, 400, 50, 24, "Continuar", 50);
  botons(100, 20, 400, 50, 27, "Saltar tutorial", 50);
}

void tutorial4() {
  size(1600, 900);
  image(fondoTutorial4, 0, 0);
  textField.setVisible(false);
  textField2.setVisible(false);
  botons(580, 800, 400, 50, 25, "Continuar", 50);
  botons(100, 20, 400, 50, 27, "Saltar tutorial", 50);
}

void tutorial5() {
  size(1600, 900);
  image(fondoTutorial5, 0, 0);
  textField.setVisible(false);
  textField2.setVisible(false);
  botons(1150, 800, 400, 50, 26, "Continuar", 50);
  botons(100, 20, 400, 50, 27, "Saltar tutorial", 50);
}
void tutorial6() {
  size(1600, 900);
  image(buenaSuerte, 0, 0);
  textField.setVisible(false);
  textField2.setVisible(false);
  botons(580, 800, 400, 50, 27, "Continuar", 50);
}

void nombreDimension() {
  size(1600, 900);
  image(fondoNombre, 0, 0);
  textField.setVisible(true);
  textField2.setVisible(true);
  textField2.setNumeric(1, 48, -1);
  n = textField2.getValueI();
  println(n);
  nombre = textField .getText();
  println(nombre);
  botons(580, 800, 400, 50, 21, "Continuar", 50);
  botons(1150, 800, 400, 50, 1, "Volver al inicio", 50);
}

void creditos() {
  size(1600, 900);
  image(fondoCredits, 0, 0);
  botons(1150, 800, 400, 50, 1, "Volver", 50);
}


//subrutina para caja de texto(texlField)
void handleTextEvents(GTextField textField, GEvent event) {
  if (event == GEvent.ENTERED) {
    String nombre = textField.getText();
    println("Usuario: " + nombre);
  }
}
