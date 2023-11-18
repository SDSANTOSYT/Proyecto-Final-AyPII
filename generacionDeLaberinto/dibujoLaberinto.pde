public int n = 10;
public int filas = n*2+1;
public int columnas = n*2+1;
public int unidad = 450/filas;

int mouseEnX;
int mouseEnY;
int viaje[][] = new int[2][2];
int cont;

void dibujarlab() { // subrutina para dibujar el laberinto
  fill(215);
  square(0, 0, unidad*filas + unidad);
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      //noStroke();
      if (M[i][j] == 2) {
        fill(255, 162, 51);
        square(j*unidad + unidad/2, i*unidad, unidad);
      } else if (M[i][j] == 0) { // dibuja las paredes
        fill(0);
        if ((j == 0 || i == 0 || j == columnas -1 || i == filas -1)) { // si está en el borde solo dibuja un cuadrado
          fill(0);
          square(j*unidad + unidad/2, i*unidad, unidad);
        } else if (i%2 == 0) { // dibuja una pared horizontal
          rect(j*unidad + unidad/2, i*unidad + unidad/2, unidad, unidad/2);
        } else { // dibuja una pared vertical
          rect(j*unidad + unidad/2, i*unidad, unidad/2, unidad + unidad/2);
        }
      } else if (M[i][j] == 1) {
        noStroke();
        fill(255);
        square(j*unidad, i*unidad, unidad);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
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
        println(mouseEnY+" "+mouseEnX);
        if(cont == 1){
          posicX= mouseEnX;
          posicY=mouseEnY;
        }
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
    if (mouseEnX == 0 || mouseEnY == 0 || mouseEnX == columnas -1 || mouseEnY == filas -1) {
      noStroke();
      fill(51, 249, 255);
      square(mouseEnX*unidad + unidad/4, mouseEnY*unidad + unidad/4, unidad);
    }
  }
}


void setup() {
  size(900,900);
  
  background(255);
  generarLaberinto(filas, columnas, 1, 1);
  imprimirMatriz(M, filas, columnas, 0, 0);
  cont = 0;

  System.out.println("posiciones de inicio");
  System.out.println("posiciones finales");
}

void draw() {
  dibujarlab();
  dibujarBolita(posicX,posicY);
}
