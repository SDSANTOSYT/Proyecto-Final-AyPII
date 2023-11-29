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
