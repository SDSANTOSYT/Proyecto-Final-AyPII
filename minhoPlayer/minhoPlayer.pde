
public int posicX, posicY;

PImage sprite[] = new PImage[4];
public int minho;
void initImagen() {
  sprite[0] = loadImage("sprite_00.png");
  sprite[1] = loadImage("sprite_10.png");
  sprite[2] = loadImage("sprite_16.png");
  sprite[3] = loadImage("sprite_14.png");
}

void dibujarBolita (int y, int x) { //crear la "bolita" colores, tamaño y posicion
  if ( count >= 2 ) {

    fill(0, 0, 0, 50);
    ellipse(x*unidad + unidad/1.5, y*unidad + unidad, unidad, unidad);
    imageMode(CORNER);
    image(sprite[minho], x*unidad, y*unidad, unidad + unidad*0.5, unidad + unidad*0.5);
  }
}

void keyPressed () { // Hacemos que la bolita se mueva (cambio de posicion) con las teclas W, S, D, A
  if (count >= 2) {
    try {
      if (key == 'w') {
        minho = 1;
        if ((M[posicY-1][posicX]== 1 || M[posicY-1][posicX]== 2)) {
          posicY= posicY-1;
        }
      } else {
        if (key == 'a') {
          minho = 3;
          if (M[posicY][posicX-1]== 1 || M[posicY][posicX-1]== 2) {
            posicX= posicX-1;
          }
        } else {
          if (key == 's') {
            minho = 0;
            if (M[posicY+1][posicX]== 1 || M[posicY+1][posicX]== 2) {
              posicY= posicY+1;
            }
          } else {
            if (key == 'd') {
              minho = 2;
              if (M[posicY][posicX+1]== 1 || M[posicY][posicX+1]== 2) {
                posicX= posicX+1;
              }
            }
          }
        }
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
    }
  }
}
