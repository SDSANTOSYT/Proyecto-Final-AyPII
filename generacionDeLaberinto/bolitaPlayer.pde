
public int posicX, posicY;

void dibujarBolita (int y, int x) { //crear la "bolita" colores, tamaño y posicion
  if ( count >= 2 ) {
    fill(#FF4D53);
    circle(x*unidad+unidad/2, y*unidad+unidad/2, unidad);
  }
}

void keyPressed () { // Hacemos que la bolita se mueva (cambio de posicion) con las teclas W, S, D, A
  if (count >= 2) {
    try {
      if (key == 'w' && (M[posicY-1][posicX]== 1 || M[posicY-1][posicX]== 2)) {
        posicY= posicY-1;
      } else {
        if (key == 'a' && (M[posicY][posicX-1]== 1 || M[posicY][posicX-1]== 2)) {
          posicX= posicX-1;
        } else {
          if (key == 's' && (M[posicY+1][posicX]== 1 || M[posicY+1][posicX]== 2)) {
            posicY= posicY+1;
          } else {
            if (key == 'd' && (M[posicY][posicX+1]== 1 || M[posicY][posicX+1]== 2)) {
              posicX= posicX+1;
            }
          }
        }
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
    }
  }
}
