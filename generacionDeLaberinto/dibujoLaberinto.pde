public int n = 10;
public int filas = n*2+1;
public int columnas = n*2+1;
public int unidad = 900/filas;

int mouseEnX;
int mouseEnY;
int viaje[][] = new int[2][2];
int cont = 0;

void dibujarlab() {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      //noStroke();
      seleccionEntradaSalida();
      if ((i == viaje[0][0] & j == viaje[0][1]) | (i == viaje[1][0] &  j == viaje[1][1])) {
        fill(255, 162, 51);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
      }
      if (M[i][j] == 0) {
        fill(0);
        square(j*unidad + unidad/4, i*unidad +unidad/4, unidad);
      } else if (M[i][j] == 1) {
        noStroke();
        fill(255);
        square(j*unidad, i*unidad, unidad);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
      }
    }
  }
}

void seleccionEntradaSalida() {
  mouseEnX = mouseX/unidad;
  mouseEnY = mouseY/unidad;
  if (mouseEnX == 0 | mouseEnY == 0 | mouseEnX == columnas -1 | mouseEnY == filas -1) {
    if (mousePressed) {
      if (cont < 2) {
        viaje[cont][0] = mouseEnY;
        viaje[cont][1] = mouseEnX;
        cont++;
      }
    } else {
      noStroke();
      fill(51, 249, 255);
      square(mouseEnX*unidad + unidad/4, mouseEnY*unidad + unidad/4, unidad);
    }
  }
}


void setup() {
  size(900, 900);
  background(255);
  generarLaberinto(filas, columnas, 1, 1);
  imprimirMatriz(M, filas, columnas, 0, 0);

  System.out.println("posiciones de inicio");
  System.out.println("posiciones finales");
}

void draw() {
  dibujarlab();
}
