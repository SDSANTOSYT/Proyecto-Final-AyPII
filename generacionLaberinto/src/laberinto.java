public class laberinto {

    static int M[][] = new int[100][100]; // Matriz donde se van generando los caminos
    static int Z[][] = new int[100][100];
    static int inicio[][] = new int[10000][2]; // inicio de los caminos
    static int fin[][] = new int[10000][2]; // fin de los caminos
    static int k = 0, l = 0, i, j, direccion;

    public static boolean fueVisitada(int casilla) { // función que me dice si una casilla ya ha sido visitada
        return casilla == 1;
    }

    public static void hacerStack(int y, int x) { // genera el stack de las posiciones inicio
        inicio[k][0] = y;
        inicio[k][1] = x;
        k++;
    }

    public static void hacerStack1(int y, int x) { // genera el stack de las posiciones final
        fin[l][0] = y;
        fin[l][1] = x;
        l++;
    }

    public static boolean tieneNoVisitadas(int y, int x, int filas, int columnas) { //
        if (y - 2 >= 1) {
            if (!fueVisitada(M[y - 2][x])) {
                return true;
            }
        }
        if (y + 2 < filas - 1) {
            if (!fueVisitada(M[y + 2][x])) {
                return true;
            }
        }
        if (x - 2 >= 1) {
            if (!fueVisitada(M[y][x - 2])) {
                return true;
            }
        }
        if (x + 2 < columnas - 1) {
            if (!fueVisitada(M[y][x + 2])) {
                return true;
            }
        }
        return false;
    }

    public static void backTrack(int k, int filas, int columnas) {
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

    public static void generarLaberinto(int filas, int columnas, int y, int x) {
        M[y][x] = 1;
        if (tieneNoVisitadas(y, x, filas, columnas)) {
            direccion = (int) (Math.random() * 4 + 1);
            switch (direccion) {
                case 1:
                    if (y - 2 >= 1) {
                        if (!fueVisitada(M[y - 2][x])) {
                            hacerStack(y, x);
                            M[y - 1][x] = 1;
                            hacerStack1(y - 2, x);
                            generarLaberinto(filas, columnas, y - 2, x);
                        }
                    }
                    generarLaberinto(filas, columnas, y, x);
                    break;
                case 2:
                    if (y + 2 < filas - 1) {
                        if (!fueVisitada(M[y + 2][x])) {
                            hacerStack(y, x);
                            M[y + 1][x] = 1;
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
                            M[y][x - 1] = 1;
                            hacerStack1(y, x - 2);
                            generarLaberinto(filas, columnas, y, x - 2);
                        }
                    }
                    generarLaberinto(filas, columnas, y, x);
                    break;
                case 4:
                    if (x + 2 < columnas - 1) {
                        if (!fueVisitada(M[y][x + 2])) {
                            hacerStack(y, x);
                            M[y][x + 1] = 1;
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

    public static void imprimirMatriz(int vector[][], int n, int m, int i, int j) {
        if (i < n) {
            if (j < m) {
                System.out.printf("%d|", vector[i][j]);
                imprimirMatriz(vector, n, m, i, j + 1);
            } else {
                System.out.println();
                j = 0;
                imprimirMatriz(vector, n, m, i + 1, j);
            }
        }
    }

    public static void main(String[] args) {
        System.out.println((int) (Math.random() * 4 + 1));

        int n;
        n = 20;
        int filas = n * 2 + 1;
        int columnas = n * 2 + 1;
        generarLaberinto(filas, columnas, 1, 1);
        imprimirMatriz(M, filas, columnas, 0, 0);
        System.out.println("posiciones de inicio");
        imprimirMatriz(inicio, k, 2, 0, 0);
        System.out.println("posiciones finales");
        imprimirMatriz(fin, k, 2, 0, 0);
    }
}