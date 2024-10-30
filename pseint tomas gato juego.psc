Proceso tres_en_raya
    Dimension tablero[3,3]
    Definir i, j, fila, columna Como Entero
    Definir jugador Como Caracter
    Definir turno Como Entero
    Definir hay_ganador Como Logico
    Definir posiciones_libres Como Entero
	
    // Inicializar el tablero
    Para i Desde 0 Hasta 2 Hacer
        Para j Desde 0 Hasta 2 Hacer
            tablero[i,j] = ' '
        Fin Para
    Fin Para
	
    jugador = 'X' // Jugador humano
    turno = 1
    hay_ganador = Falso
    posiciones_libres = 9
	
    Mientras turno <= 9 Y hay_ganador = Falso Hacer
        Escribir "Tablero:"
        Escribir " ",tablero[0,0],"|",tablero[0,1],"|",tablero[0,2]
        Escribir " ---------"
        Escribir " ",tablero[1,0],"|",tablero[1,1],"|",tablero[1,2]
        Escribir " ---------"
        Escribir " ",tablero[2,0],"|",tablero[2,1],"|",tablero[2,2]
        Escribir ""
		
        Si turno Mod 2 <> 0 Entonces
            // Turno del jugador
            Escribir "Jugador, ingresa fila (0-2) y columna (0-2):"
            Leer fila, columna
			
            Mientras fila < 0 O fila > 2 O columna < 0 O columna > 2 O tablero[fila,columna] <> ' ' Hacer
                Escribir "Posición no válida. Intenta de nuevo:"
                Leer fila, columna
            Fin Mientras
			
            tablero[fila,columna] = 'X'
        Sino
            // Turno de la máquina
            Escribir "Turno de la máquina:"
            fila = Aleatorio(0, 2)
            columna = Aleatorio(0, 2)
			
            Mientras tablero[fila,columna] <> ' ' Hacer
                fila = Aleatorio(0, 2)
                columna = Aleatorio(0, 2)
            Fin Mientras
			
            tablero[fila,columna] = 'O'
        Fin Si
		
        // Verificar si hay ganador
        Para i Desde 0 Hasta 2 Hacer
            Si (tablero[i,0] = tablero[i,1] Y tablero[i,1] = tablero[i,2]) Y tablero[i,0] <> ' ' Entonces
                hay_ganador = Verdadero
            Fin Si
            Si (tablero[0,i] = tablero[1,i] Y tablero[1,i] = tablero[2,i]) Y tablero[0,i] <> ' ' Entonces
                hay_ganador = Verdadero
            Fin Si
        Fin Para
		
        Si (tablero[0,0] = tablero[1,1] Y tablero[1,1] = tablero[2,2]) Y tablero[1,1] <> ' ' Entonces
            hay_ganador = Verdadero
        Fin Si
        Si (tablero[0,2] = tablero[1,1] Y tablero[1,1] = tablero[2,0]) Y tablero[1,1] <> ' ' Entonces
            hay_ganador = Verdadero
        Fin Si
		
        turno = turno + 1
    Fin Mientras
	
    Si hay_ganador Entonces
        Si turno Mod 2 = 0 Entonces
            Escribir "¡Ganó la máquina!"
        Sino
            Escribir "¡Ganaste!"
        Fin Si
    Sino
        Escribir "¡Es un empate!"
    Fin Si
Fin Proceso
