public int n = 10;
public int filas = n*2+1;
public int columnas = n*2+1;
public int unidad = 900/filas;
int mouseEnX;
int mouseEnY;
int viaje[][] = new int[2][2];
int cont;
int MM[][] = new int[filas][columnas];

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
        if (j == 0 || i == 0 || j == columnas -1 || i == filas -1) { // si está en el borde solo dibuja un cuadrado
          square(j*unidad + unidad/2, i*unidad, unidad);
        } else if (i%2 == 0) { // dibuja una pared horizontal
          rect(j*unidad + unidad/2, i*unidad + unidad/2, unidad, unidad/2);
        } else { // dibuja una pared vertical
          rect(j*unidad + unidad/2, i*unidad, unidad/2, unidad + unidad/2);
        }
      } else if (M[i][j] == 1) { // si hay caminos dibuja un cuadrado de color claro
        noStroke();
        fill(#E0B8F2);
        square(j*unidad, i*unidad, unidad);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
      }
    }
  }
  seleccionEntradaSalida(); // se llama a la subrutina que dibuja la selección en la posición del mouse
}

public int randomColumna= 0;
public int randomFila= 0;

void smoothDraw() { // subrutina para mostrar el dibujo del laberinto por primera vez
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

  if ( frameCount % 0.0625 == 0 ) {
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
  seleccionEntradaSalida();
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

void seleccionEntradaSalida() { // subrutina que dibuja el cuadro de selección en la posición en la que se encuentra el mouse
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
}

void draw() {
  dibujarlab();
  smoothDraw();
}
