public int n = 10;
public int filas = n*2+1;
public int columnas = n*2+1;
public int unidad = 450/filas;
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
        fill(255,0,255,90);
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
  //seleccionEntradaSalida();
}

public int randomColumna= 1;
public int randomFila= 1;

void smoothDraw() {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      if (M[i][j] == 2) {
        fill(255,0,255,90);
        square(j*unidad, i*unidad, unidad);
        square(j*unidad + unidad/4, i*unidad + unidad/4, unidad);
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

void drawSelection() {
  int mouseAtRow = mouseX / unidad ;
  int mouseAtColumn = mouseY / unidad;

  fill (0, 255, 0, 50);
  square( mouseAtRow * unidad, mouseAtColumn * unidad, unidad );
}

void mouseClicked() {
  int selectedRow = mouseY / unidad ;
  int selectedColumn = mouseX / unidad;

  if ( count < 2 ) {
    if ( selectedRow % 2 != 0 || selectedColumn % 2 != 0 ) {
      if ( (selectedRow == 0) || (selectedRow == 2*n) || (selectedColumn == 0) || (selectedColumn == 2*n) ) {
        if ( count == 0 ) {
          entryRow = selectedRow;
          entryCol = selectedColumn;
          println(entryRow+" "+entryCol);
        } else {
          exitRow = selectedRow;
          exitCol = selectedColumn;
          println(exitRow+" "+exitCol);
        }
        M[selectedRow][selectedColumn] = 1;
        count++;
      }
    }
  }
  if ( count == 2 ) {
    directionPriority(entryRow, exitRow, entryCol, exitCol);
    solveMaze(entryRow, exitRow, entryCol, exitCol);
  }
}
//void seleccionEntradaSalida() {
//  mouseEnX = mouseX/unidad;
//  mouseEnY = mouseY/unidad;
//  if (cont != 2) {
//    if ((mouseEnX == 0 && mouseEnY < filas) || (mouseEnY == 0 && mouseEnX < columnas) || (mouseEnX == columnas -1 && mouseEnY < filas) || (mouseEnY == filas -1 && mouseEnX < columnas)) {
//      noStroke();
//      fill(#E0B8F2, 170);
//      square(mouseEnX*unidad + unidad/4, mouseEnY*unidad + unidad/4, unidad);
//    }
//  }
//}

void setup() {
  size(1000, 1000);
  background(255);
  generarLaberinto(filas, columnas, 1, 1);
  imprimirMatriz(M, filas, columnas, 0, 0);
  cont = 0;
   

}

int iii= 0;
void draw() {
 dibujarlab();
  smoothDraw();
  dibujarBolita(posicX, posicY);
  drawSelection();
  if ( count == 2  && iii < filas*columnas) {
    drawSteps();
    
  }
}

void drawSteps() {
  M[explored[iii][0]][explored[iii][1]] = 2;
    //fill(255,0,255,90);
    //square(explored[iii][0]*unidad, explored[iii][1]*unidad,unidad);
    if( !(explored[iii][0] == exitRow && explored[iii][1] == exitCol) ){
      iii++;
    }
    
}
