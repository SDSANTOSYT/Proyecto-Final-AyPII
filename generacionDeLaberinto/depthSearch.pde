public static int explored[][] = new int[1000][2];
public static int frontier[][] = new int[1000][2];
public static int popped[][] = new int[2][2];
public static int currentCell[][] = new int[2][2];
public static int frontierIndex;
public static int exploredIndex;


int entryRow= 1;
int entryCol= 1;
int exitRow = 1;
int exitCol = 1;

public int count = 0;

char moveTo [] = new char[4];

void directionPriority(int filEntrada, int filSalida, int colEntrada, int colSalida) { // Determina la prioridad de las direcciones de movimiento (Norte, Sur, Este, Oeste) en función de entrada y salida
  boolean state = ((colEntrada - colSalida) > (filEntrada - filSalida));
  
  int i = 0;
  while (i < 2) {
    if (state) {
      if (colEntrada - colSalida < 0) {
        moveTo[i] = 'W';
        moveTo[i + 2] = 'E';
      } else {
        moveTo[i] = 'E';
        moveTo[i + 2] = 'W';
      }
    } else {
      if (filEntrada - filSalida < 0) {
        moveTo[i] = 'S';
        moveTo[i + 2] = 'N';
      } else {
        moveTo[i] = 'N';
        moveTo[i + 2] = 'S';
      }
    }
    i++;
    state = !state;
  }
}
void popMethod() { //Extrae una celda de la pila de la frontera 
  popped[0][0] = frontier[frontierIndex][0];
  popped[0][1] = frontier[frontierIndex][1];
  frontier[frontierIndex][0] = 0;
  frontier[frontierIndex][1] = 0;
  frontierIndex--;
}

boolean isAvaliable(int childCellY, int childCellX) { // verificar una celda dada está dentro de los límites del laberinto
  try {
    return (M[childCellY][childCellX] == 1);
  }
  catch (ArrayIndexOutOfBoundsException e) {
    return false;
  }
}

public static boolean isExplored(int childCellY, int childCellX) { //comprueba si una celda ha sido explorada
  boolean wasIn = false;
  for (int i = 0; i < exploredIndex+1; i++) {
    if ((explored[i][0] == childCellY) && (explored[i][1] == childCellX)) {
      wasIn = true;
    }
  }
  return wasIn;
}

void avaliableDirection(int currentCellX, int currentCellY) { //desde la celda actual agrega las celdas vecinas a la pila de la frontera si son alcanzables y aún no se han explorado
  int iteraction = 0;
  while (iteraction < 4) {
    int childCellX = currentCellX;
    int childCellY = currentCellY;
    switch (moveTo[iteraction]) {
    case 'W':
      childCellX = currentCellX - 1;
      break;
    case 'E':
      childCellX = currentCellX + 1;
      break;
    case 'N':
      childCellY = currentCellY - 1;
      break;
    case 'S':
      childCellY = currentCellY + 1;
      break;
    }
    if (isAvaliable(childCellY, childCellX) && (!isExplored(childCellY, childCellX))) {
      stackAtFrontier(childCellY, childCellX);
      stackAtExplored(childCellY, childCellX);
    }
    iteraction++;
  }
}

void stackAtFrontier(int atY, int atX) {// Agregan una celda a la pila de la frontera
  frontierIndex = frontierIndex + 1;
  frontier[frontierIndex][0] = atY;
  frontier[frontierIndex][1] = atX;
}

void stackAtExplored(int atY, int atX) {// Agrega una celda a la lista de celdas exploradas,
  exploredIndex = exploredIndex + 1;
  explored[exploredIndex][0] = atY;
  explored[exploredIndex][1] = atX;
}

void solveMaze(int startRow, int exitRow, int startColumn, int exitColumn) { //Extrae una celda de la pila de la frontera, actualiza la celda actual y explora las direcciones disponibles hasta alcanzar la salida o hasta que no haya más celdas en la frontera
  stackAtFrontier(startRow, startColumn);
  stackAtExplored(startRow, startColumn);

  while (!((currentCell[0][1] == exitColumn) && (currentCell[0][0] == exitRow)) && (frontierIndex >= 0)) {
    popMethod();
    currentCell[0][0] = popped[0][0];
    currentCell[0][1] = popped[0][1];
    avaliableDirection(currentCell[0][1], currentCell[0][0]);
  }
}
