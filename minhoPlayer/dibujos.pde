public int n ;
public int filas;
public int columnas;
public int unidad = 1;
int mouseEnX;
int mouseEnY;
int MM[][] = new int[100][100];
PFont font, fuente;
int op = 1;
int iii= 0;
boolean buscar = false;

// subrutina para dibujar el laberinto junto con los muros, los pasillos y el camino que lo resuelve
void dibujarlab() {
  background(#D499EF);
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      if (M[i][j] == 2) {
        fill(#E0B8F2);
        square(j*unidad, i*unidad, unidad);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
        fill(255, 0, 255, 90);
        square(j*unidad, i*unidad, unidad);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
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
  drawSelection();
}



// Subrutina que dibuja el recuadro de selección en el laberinto
void drawSelection() {
  int mouseAtRow = mouseX / unidad ;
  int mouseAtColumn = mouseY / unidad;

  if ( mouseAtRow % 2 != 0 || mouseAtColumn % 2 != 0 ) {
    if ((mouseAtRow == 0 && mouseAtColumn <= 2*n) || (mouseAtRow == 2*n&& mouseAtColumn <= 2*n) || (mouseAtColumn == 0 && mouseAtRow <= 2*n) || (mouseAtColumn == 2*n && mouseAtRow <= 2*n) ) {
      if ( count < 2 ) {
        fill (#E0B8F2, 170);
        square( mouseAtRow * unidad, mouseAtColumn * unidad, unidad );
      }
    }
  }
}


// Subrutina que dibuja el camino que resuelve el laberinto
void drawSteps() {
  M[explored[iii][0]][explored[iii][1]] = 2;
  if ( !(explored[iii][0] == exitRow && explored[iii][1] == exitCol) && frameCount % 1 == 0 ) {
    iii++;
  }
}



void setup() {
  size(1600, 900);
  background(255);
  windowTitle("MIROH");
  count = 0;
  // importación de fuentes personalizadas
  Font customFont = new Font("Arial Black", Font.BOLD, 30);
  font = createFont("New Athletic M54.ttf", 100);

  // Creación de imagenes a utilizar
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
  personaje2 = loadImage("Personaje2.png");
  initImagen();
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
}
void draw() {
  // Switch que depende de op y indica la ventana a imprimir
  switch(op) {
    // Ventana inicio
  case 1:
    inicio();
    break;
    //Ventana entradas de usuario
  case 2:
    nombreDimension();
    if (op == 1) {
    } else if (op ==  21 && n != -1 && nombre.length() <= 10) {
    } else {
      if (nombre.length() > 10) {
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
    // ventana del tutorial 1
  case 21:
    tutorial1();
    break;
    // ventana del tutorial 2
  case 22:
    tutorial2();
    break;
    // ventana del tutorial 3
  case 23:
    tutorial3();
    break;
    // ventana del tutorial 4
  case 24:
    tutorial4();
    break;
    // ventana del tutorial 5
  case 25:
    tutorial5();
    break;
    // ventana del tutorial 6
  case 26:
    tutorial6();
    break;
    // ventana del juego
  case 27:
    juego();
    // si se oprime el botón de reiniciar
    if (op == 2) {
      reiniciarMatrizLab();
      reiniciarSeleccion();
      reiniciarBusqueda();
      buscar = false;
      iii = 0;
      // si se oprime el botón de buscar
    } else if (op == 212) {
      if (count >= 2) {
        buscar = true;
      }
      op = 27;
    }
    break;
  }
}
