
public int posicX, posicY;

void dibujarBolita (int y, int x) { //crear la "bolita" colores, tamaño y posicion
  if ( cont == 2 ) {
    fill(#FF4D53);
    circle(x*unidad+unidad/2, y*unidad+unidad/2, unidad);
  }
}

void keyPressed () { // Hacemos que la bolita se mueva (cambio de posicion) con las teclas W, S, D, A
  if (key == 'w' && M[posicX-1][posicY]== 1) {
    posicX= posicX-1;
  } else {
    if (key == 'a' && M[posicX][posicY-1]== 1) {
      posicY= posicY-1;
    } else {
      if (key == 's' && M[posicX+1][posicY]== 1) {
        posicX= posicX+1;
      } else {
        if (key == 'd' && M[posicX][posicY+1]== 1) {
          posicY= posicY+1;
        }
      }
    }
  }
}
