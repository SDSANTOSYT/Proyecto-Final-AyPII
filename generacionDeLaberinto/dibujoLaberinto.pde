public int n ;
public int filas;
public int columnas;
public int unidad = 1;
int mouseEnX;
int mouseEnY;
int distX, distY, numberOfFrames;
int viaje[][] = new int[2][2];
int cont;
int MM[][] = new int[100][100];
PFont font, fuente;
int op = 1;

void dibujarlab() { // subrutina para dibujar el laberinto
  background(#D499EF);
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      //noStroke();
      if (M[i][j] == 2) {
        fill(255, 162, 51);
        square(j*unidad + unidad/2, i*unidad, unidad);
      } else if (M[i][j] == 0) { // dibuja las paredes
        fill(#612F77);
        if ((j == 0 || i == 0 || j == columnas -1 || i == filas -1)) { // si está en el borde solo dibuja un cuadrado
          square(j*unidad + unidad/2, i*unidad, unidad);
        } else if (i%2 == 0) { // dibuja una pared horizontal
          rect(j*unidad + unidad/2, i*unidad + unidad/2, unidad, unidad/2);
        } else { // dibuja una pared vertical
          rect(j*unidad + unidad/2, i*unidad, unidad/2, unidad + unidad/2);
        }
      } else if (M[i][j] == 1) {
        noStroke();
        fill(#E0B8F2);
        square(j*unidad, i*unidad, unidad);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
      }
    }
  }
  seleccionEntradaSalida();
}

public int randomColumna= 1;
public int randomFila= 1;



void smoothDraw() {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      if (M[i][j] == 2) {
        fill(255, 162, 51);
        square(j*unidad + unidad/2, i*unidad, unidad);
      } else if (MM[i][j] == 0) { // dibuja las paredes
        fill(#612F77);
        if ((j == 0 || i == 0 || j == columnas -1 || i == filas -1)) { // si está en el borde solo dibuja un cuadrado
          square(j*unidad + unidad/2, i*unidad, unidad);
        } else if (i%2 == 0) { // dibuja una pared horizontal
          rect(j*unidad + unidad/2, i*unidad + unidad/2, unidad, unidad/2);
        } else { // dibuja una pared vertical
          rect(j*unidad + unidad/2, i*unidad, unidad/2, unidad + unidad/2);
        }
      } else if (M[i][j] == 1) {
        noStroke();
        fill(#E0B8F2);
        square(j*unidad, i*unidad, unidad);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
      }
    }
  }

  if ( frameCount % 0.5 == 0 ) {
    if ( randomFila < filas ) {
      MM[randomFila][randomColumna] = 1;
      if ( randomColumna == columnas - 1 ) {
        randomFila++;
        randomColumna= 0;
      } else {
        randomColumna++;
      }
    }
  }
}



void mouseClicked() { // subrutina para seleccionar la entrada y la salida
if(op == 21 && (mouseX >= 580 && mouseX <= 980) && (mouseY >= 800 && mouseY <= 850) && generarLab == false && n != -1 && nombre.length() <= 10){
  filas = n*2+1;
  columnas = n*2+1;
  unidad = 900/filas;
  generarLab = true;
  generarLaberinto(filas, columnas, 1, 1);
  imprimirMatriz(M, filas, columnas, 0, 0);
}

if(op == 1 && (mouseX >= 1150 && mouseX <= 1550) && (mouseY >= 800 && mouseY <= 850)){
  generarLab = false;
}

if(op == 2 && (mouseX >= 1468 && mouseX <= 1583) && (mouseY >= 16 && mouseY <= 131)){
  generarLab = false;
}

  if ((mouseEnX == 0 || mouseEnY == 0 || mouseEnX == columnas -1 || mouseEnY == filas -1)) {
    if ((mouseEnX %2 != 0 && mouseEnY %2 == 0) || (mouseEnX %2 == 0 && mouseEnY %2 != 0)) {
      if (cont < 2) {
        viaje[cont][0] = mouseEnY;  
        viaje[cont][1] = mouseEnX;
        M[mouseEnY][mouseEnX] = 1;
        cont++;
      }
    }
  }
}

void seleccionEntradaSalida() {
  mouseEnX = mouseX/unidad;
  mouseEnY = mouseY/unidad;
  if (cont != 2) {
    if ((mouseEnX == 0 && mouseEnY < filas) || (mouseEnY == 0 && mouseEnX < columnas) || (mouseEnX == columnas -1 && mouseEnY < filas) || (mouseEnY == filas -1 && mouseEnX < columnas)) {
      noStroke();
      fill(#E0B8F2, 170);
      square(mouseEnX*unidad + unidad/4, mouseEnY*unidad + unidad/4, unidad);
    }
  }
}
void setup() {
  size(1600, 900);
  background(255);

 

  cont = 0;
  Font customFont = new Font("Arial Black", Font.BOLD, 30);
  font = createFont("New Athletic M54.ttf", 100);
  fondoPrin = loadImage("Fondo.jpg");
  fondoCredits = loadImage("Creditos.jpg");
  Reiniciar = loadImage("Reiniciar.png");
  Bombilla = loadImage("Bombilla.png");
  fondoNombre = loadImage("nombreDimension.jpg");
  fondoTutorial1 = loadImage("Tutorial1.jpg");
  fondoTutorial2 = loadImage("Tutorial2.jpg");
  fondoTutorial3 = loadImage("Tutorial3.jpg");
  fondoTutorial4 = loadImage("Tutorial4.jpg");
  fondoTutorial5 = loadImage("Tutorial5.jpg");
  buenaSuerte = loadImage("Buena suerte.jpg");
  personaje = loadImage("Personaje.png");
  // Create a text field name
    textField = new GTextField(this, 475, 180, 620, 70);
    textField.setPromptText("Ingrese su primer nombre");
    textField.setFont(customFont);
    textField.setOpaque(true);
    textField.setVisible(false);
  // Create a text field name
    textField2 = new GTextField(this, 475, 700, 620, 70);
    textField2.setPromptText("Ingrese la dimension de 1 a 48");
    textField2.setFont(customFont);
    textField2.setOpaque(true);
    textField2.setVisible(false);
    // Create a slider dimension
    //sliderDimension = new GSlider(this, 475,700, 620, 70);
}
void draw() {
  // Switch que depende de op y indica la ventana a imprimir
  switch(op){
    // Ventana inicio
  case 1:
    inicio();
  break;
  //Ventana jugar
  case 2:
    nombreDimension();
    if(op == 1){
    }else if(op ==  21 && n != -1 && nombre.length() <= 10){
    }else{
      if(nombre.length() > 10){
     String s = "Nombre ingresado invalido, solo ingrese su primer nombre.";
      fill(0);
      text(s, 405, 270, 780, 280);
      fill(#FF1A1A);
      text(s, 400, 270, 780, 320);
      }
    op = 2;
    
    }
    
    
  break;
  //ventana creditos
  case 3:
    creditos();
  break;
  //salir 
  case 4:
     exit();
  break;
  // ventana del juego
  case 21:
  tutorial1();
  break;
  case 22:
  tutorial2();
  break;
  case 23:
  tutorial3();
  break;
  case 24:
  tutorial4();
  break;
  case 25:
  tutorial5();
  break;  
  case 26:
  tutorial6();
  break;
  case 27:
  juego();
  break;
  }
}
