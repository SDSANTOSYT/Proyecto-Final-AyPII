//librerias para cajas de texto
import g4p_controls.*;
import java.awt.Font;
PImage fondoPrin, fondoCredits, Reiniciar, Bombilla, fondoNombre, fondoTutorial1, personaje, fondoTutorial2, fondoTutorial3, fondoTutorial4, fondoTutorial5, buenaSuerte;
static int M[][] = new int[100][100]; // Matriz donde se van generando los caminos
static int Z[][] = new int[100][100];
static int inicio[][] = new int[10000][2]; // inicio de los caminos
static int fin[][] = new int[10000][2]; // fin de los caminos
static int k = 0, l = 0, i, j, direccion;
GTextField textField, textField2;
GSlider sliderDimension;
float m;
String nombre = "Player";
boolean generarLab =  false;
/**
 * función que me dice si una casilla ya ha sido visitada
 * @param casilla
 * return verdadero si la casilla tiene un 1, es decir si fue visitada
 */
boolean fueVisitada(int casilla) {
  return casilla == 1;
}

/**
 * subrutina que genera el stack de las posiciones de inicio
 * @param y posición en Y de la casilla
 * @param x posición en X de la casilla
 */
void hacerStack(int y, int x) {
  inicio[k][0] = y;
  inicio[k][1] = x;
  k++;
}

/**
 * subrutina que genera el stack de las posiciones de final
 * @param y posición en Y de la casilla
 * @param x posición en X de la casilla
 */
void hacerStack1(int y, int x) {
  fin[l][0] = y;
  fin[l][1] = x;
  l++;
}

/**
 * función que verifica si la casilla en la que está tiene alguna sin visitar alrededor
 * @param filas las filas que tiene la matriz del laberinto
 * @param columnas las columnas que tiene la matriz del laberinto
 * @param y posición en Y de la casilla
 * @param x posición en X de la casilla
 */
boolean tieneNoVisitadas(int y, int x, int filas, int columnas) { //
  if (y - 2 >= 1) {
    if (!fueVisitada(M[y - 2][x])) {
      return true;
    }
  }
  if (y + 2 < filas-1) {
    if (!fueVisitada(M[y + 2][x])) {
      return true;
    }
  }
  if (x - 2 >= 1) {
    if (!fueVisitada(M[y][x - 2])) {
      return true;
    }
  }
  if (x + 2 < columnas-1) {
    if (!fueVisitada(M[y][x + 2])) {
      return true;
    }
  }
  return false;
}


/**
 * subrutina que realiza el backtrack hacia las posiciones guardadas anteriormente
 * @param filas las filas que tiene la matriz del laberinto
 * @param columnas las columnas que tiene la matriz del laberinto
 * @param k es la posición en la pila hacia la que se hace backtrack
 */
void backTrack(int k, int filas, int columnas) {
  if (k == 0) {
    i = inicio[0][0];
    j = inicio[0][1];
  } else {
    i = inicio[k - 1][0];
    j = inicio[k - 1][1];
    if (!tieneNoVisitadas(i, j, filas, columnas)) {
      backTrack(k - 1, filas, columnas);
    }
  }
}


/**
 * subrutina que genera el laberinto en una matriz donde los 0 representan paredes y los 1 representan caminos
 * @param filas las filas que tiene la matriz del laberinto
 * @param columnas las columnas que tiene la matriz del laberinto
 * @param y posición en Y de la casilla en la que se encuentra
 * @param x posición en X de la casilla en la que se encuentra
 */
void generarLaberinto(int filas, int columnas, int y, int x) {
  M[y][x] = 1;
  if (tieneNoVisitadas(y, x, filas, columnas)) {
    direccion = (int) (Math.random() * 4 + 1);
    switch (direccion) {
    case 1:
      if (y - 2 >= 1) {
        if (!fueVisitada(M[y - 2][x])) {
          hacerStack(y, x);
          M[y-1][x] = 1;
          hacerStack1(y - 2, x);
          generarLaberinto(filas, columnas, y - 2, x);
        }
      }
      generarLaberinto(filas, columnas, y, x);
      break;
    case 2:
      if (y + 2 < filas-1) {
        if (!fueVisitada(M[y + 2][x])) {
          hacerStack(y, x);
          M[y+1][x] = 1;
          hacerStack1(y + 2, x);
          generarLaberinto(filas, columnas, y + 2, x);
        }
      }
      generarLaberinto(filas, columnas, y, x);
      break;
    case 3:
      if (x - 2 >= 1) {
        if (!fueVisitada(M[y][x - 2])) {
          hacerStack(y, x);
          M[y][x-1] = 1;
          hacerStack1(y, x - 2);
          generarLaberinto(filas, columnas, y, x - 2);
        }
      }
      generarLaberinto(filas, columnas, y, x);
      break;
    case 4:
      if (x + 2 < columnas-1) {
        if (!fueVisitada(M[y][x + 2])) {
          hacerStack(y, x);
          M[y][x+1] = 1;
          hacerStack1(y, x + 2);
          generarLaberinto(filas, columnas, y, x + 2);
        }
      }
      generarLaberinto(filas, columnas, y, x);
      break;
    default:
      break;
    }
  } else {
    backTrack(k, filas, columnas);
    y = i;
    x = j;
    if (x != 1 & y != 1) {
      generarLaberinto(filas, columnas, y, x);
    }
  }
}

void imprimirMatriz(int vector[][], int n, int m, int i, int j) {
  if (i < n) {
    if (j < m) {
      System.out.printf("%d,", vector[i][j]);
      imprimirMatriz(vector, n, m, i, j + 1);
    } else {
      System.out.println();
      j = 0;
      imprimirMatriz(vector, n, m, i + 1, j);
    }
  }
}
