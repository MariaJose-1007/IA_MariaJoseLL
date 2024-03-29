"Maria Jose Lopez Leyva"
def free(row, col):#Determinamos si la casilla row,col está libre de los ataques, para este caso row seria fila y col columna y el true determina si la casilla está libre de ataques por otras reinas.
        for i in range(8):
            if tablero[row][i] == 'R' or tablero[i][col] == 'R':
                return False

        if row <= col:
            c = col - row
            r = 0
        else:
            r = row - col
            c = 0
        while c < 8 and r < 8:
            if tablero[r][c] == 'R':
                return False
            r += 1
            c += 1

        if row <= col:
            r = 0
            c = col + row
            if c > 7:
                r = c - 7
                c = 7
        else:
            c = 7
            r = row - (7 - col)

        while c >= 0 and r < 8:
            if tablero[r][c] == 'R':
                return False
            r += 1
            c -= 1

        return True

def agregar_reina(n): #Agregamos n reinas al tablero, n: El numero de reinas que vamos a agregar, true: Si logramos agregar las reinas requeridas.
        if n < 1:
            return True

        for idx_row in range(8):
            for idx_col in range(8):
                if free(idx_row, idx_col):
                    tablero[idx_row][idx_col] = 'R'
                    if agregar_reina(n-1):
                        return True
                    else:
                        tablero[idx_row][idx_col] = '_'

        return False
tablero = []
for i in range(8):
    tablero.append(['_'] * 8)
agregar_reina(8)
for row in tablero:
    print(*row)