void reiniciarMatrizLab() {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      M[i][j] = 0;
    }
  }
}

void reiniciarSeleccion() {
  cont = 0;
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      viaje[i][j] = 0;
    }
  }
}

void reiniciarDibujoMatriz(){
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      MM[i][j] = 0;
    }
  }
  randomColumna = 0;
  randomFila = 0;
}
