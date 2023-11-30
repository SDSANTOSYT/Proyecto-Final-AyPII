//subrutina para agregar botones
void botons(int x, int y, int w, int   h, int window, String texto, int r) {
  if ((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y + h)) {
    fill(#A15CBF);
    if (mousePressed == true) {
      op = window;
    }
  } else {
    fill(#612F77);
  }

  rect(x, y, w, h, r);
  fill(255);
  textSize(50);
  text(texto, x + 200, y + 45);
}

void mouseClicked() {
  int selectedRow = mouseY / unidad ;
  int selectedColumn = mouseX / unidad;

  if (op == 21 && (mouseX >= 580 && mouseX <= 980) && (mouseY >= 800 && mouseY <= 850) && generarLab == false && n != -1 && nombre.length() <= 10) {
    filas = n*2+1;
    columnas = n*2+1;
    unidad = 900/filas;
    generarLab = true;
    generarLaberinto(filas, columnas, 1, 1);
  }

  if (op == 1 && (mouseX >= 1150 && mouseX <= 1550) && (mouseY >= 800 && mouseY <= 850)) {
    generarLab = false;
  }

  if (op == 2 && (mouseX >= 1468 && mouseX <= 1583) && (mouseY >= 16 && mouseY <= 131)) {
    generarLab = false;
  }

  if ( count < 2 && op == 27 ) {
    if ( selectedRow % 2 != 0 || selectedColumn % 2 != 0 ) {
      if ( (selectedRow == 0 && selectedColumn <= 2*n) || (selectedRow == 2*n && selectedColumn <= 2*n) || (selectedColumn == 0 && selectedRow <= 2*n) || (selectedColumn == 2*n && selectedRow <= 2*n) ) {
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
    stackAtFrontier(entryRow,entryCol);
    stackAtExplored(entryRow,entryCol);
    directionPriority(entryRow, exitRow, entryCol, exitCol,0,((entryCol-exitCol)>(entryRow-exitRow)));
    solveMaze(exitRow, exitCol);
  }
}

void reiniciarMatrizLab() {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      M[i][j] = 0;
    }
  }
}

void reiniciarSeleccion() {
  count = 0;
}

void reiniciarDibujoMatriz() {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      MM[i][j] = 0;
    }
  }
  randomColumna = 0;
  randomFila = 0;
}

void reiniciarBusqueda() {
  for (int i = 0; i < frontierIndex; i++) {
    for (int j = 0; j < 2; j++) {
      frontier[i][j] = 0;
    }
  }
  for (int i = 0; i < exploredIndex; i++) {
    for (int j = 0; j < 2; j++) {
      explored[i][j] = 0;
    }
  }
  frontierIndex = 0;
  exploredIndex = -1;
}
