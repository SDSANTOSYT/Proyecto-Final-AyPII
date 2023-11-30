public static int explored[][] = new int[5000][2];
public static int frontier[][] = new int[5000][2];
public static int popped[][] = new int[2][2];
public static int currentCell[][] = new int[2][2];
public static int frontierIndex=1;
public static int exploredIndex=-1;
public static int pathIndex;


int entryRow= 1;
int entryCol= 1;
int exitRow = 1;
int exitCol = 1;

public int count = 0;

char moveTo [] = new char[4];

void directionPriority(int filEntrada, int filSalida, int colEntrada, int colSalida, int i, boolean state) { // Determina la prioridad de las direcciones de movimiento (Norte, Sur, Este, Oeste) en función de entrada y salida
  if (i < 2) {
    if (state) {
      if (colEntrada - colSalida < 0) {
        moveTo[i] = 'E';
        moveTo[i + 2] = 'W';
      } else {
        moveTo[i] = 'W';
        moveTo[i + 2] = 'E';
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
    directionPriority(filEntrada, filSalida, colEntrada, colSalida, i+1, !state);
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

public static boolean isExplored(int childCellY, int childCellX, int i) { //comprueba si una celda ha sido explorada
  if (i == exploredIndex || ((explored[i][0] == childCellY) && (explored[i][1] == childCellX))) {
    return (explored[i][0] == childCellY) && (explored[i][1] == childCellX);
  } else {
    return isExplored(childCellY, childCellX, i+1);
  }
}

void avaliableDirection(int currentCellX, int currentCellY, int iteraction) { //desde la celda actual agrega las celdas vecinas a la pila de la frontera si son alcanzables y aún no se han explorado
  if (iteraction < 4) {
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
    if (isAvaliable(childCellY, childCellX) && (!isExplored(childCellY, childCellX, 0))) {
      if (childCellX == exitCol && childCellY == exitRow) {
        currentCellX = childCellX;
        currentCellY = childCellY;
      }
      stackAtFrontier(childCellY, childCellX);
      stackAtExplored(childCellY, childCellX);
    } else {
      avaliableDirection(currentCellX, currentCellY, iteraction+1);
    }
    avaliableDirection(currentCellX, currentCellY, iteraction+1);
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

void solveMaze( int exitRow, int exitColumn) { //Extrae una celda de la pila de la frontera, actualiza la celda actual y explora las direcciones disponibles hasta alcanzar la salida o hasta que no haya más celdas en la frontera
  if (!((currentCell[0][1] == exitColumn) && (currentCell[0][0] == exitRow)) && (frontierIndex >= 0)) {
    popMethod();
    currentCell[0][0] = popped[0][0];
    currentCell[0][1] = popped[0][1];
    directionPriority(currentCell[0][0], exitRow, currentCell[0][1], exitColumn, 0, ((currentCell[0][1]-exitColumn)>(currentCell[0][0]-exitRow)));
    avaliableDirection(currentCell[0][1], currentCell[0][0], 0);
    solveMaze(exitRow, exitColumn);
  }
}
