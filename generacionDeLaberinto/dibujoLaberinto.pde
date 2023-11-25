public int n = 5;
public int filas = n*2+1;
public int columnas = n*2+1;
public int unidad = 900/filas;
int mouseEnX;
int mouseEnY;
int distX, distY, numberOfFrames;
int viaje[][] = new int[2][2];
int cont;
int MM[][] = new int[filas][columnas];
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
  generarLaberinto(filas, columnas, 1, 1);
  imprimirMatriz(M, filas, columnas, 0, 0);
  cont = 0;
  Font customFont = new Font("Arial Black", Font.BOLD, 30);
  font = createFont("New Athletic M54.ttf", 100);
  fondoPrin = loadImage("Fondo.jpg");
  fondoCredits = loadImage("Creditos.jpg");
  Reiniciar = loadImage("Reiniciar.png");
  Bombilla = loadImage("Bombilla.png");
  // Create a text field
    textField = new GTextField(this, 275, 580, 620, 40);
    textField.setPromptText("Ingrese su nombre");
    textField.setFont(customFont);
    textField.setOpaque(true);
    textField.setVisible(false);
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
    switch(op){
      case 21:
      
        if(op == 211){
        dibujarlab();
        smoothDraw();
        botons(1150,800,400,50,1,"Volver al inicio", 50);
        botons(1468,16,115,115,21,"", 5000);
        image(Reiniciar,1460,10);
        botons(1302,16,115,115,212,"", 5000);
        image(Bombilla,1300,10);
        textField.setVisible(true);
        String nombre = textField .getText();
        println(nombre); 
        
        }else{
          if(op == 212){
          
          }
          
        }
      case 22:
    
    
    }
    
  break;
  //ventana creditos
  case 3:
    size(1600,900);
    image(fondoCredits,0,0);
    botons(1150,800,400,50,1,"Volver", 50);
  break;
  //salir 
  case 4:
     exit();
  break;
  }
}
