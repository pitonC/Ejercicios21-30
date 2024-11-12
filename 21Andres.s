/*
# Programa: Transposición de una Matriz 3x3
# Concepto/Temática: Transposición de matrices en programación.
# Aplicación Práctica: La transposición de matrices es una operación matemática muy común que se utiliza en álgebra lineal, procesamiento de imágenes y gráficos, y en análisis de datos.

# Definimos la matriz original 3x3
# La matriz original es:
# 1  2  3
# 4  5  6
# 7  8  9
# La transposición de esta matriz será:
# 1  4  7
# 2  5  8
# 3  6  9

def transpose_matrix(matrix):
    """
    Función que recibe una matriz 3x3 y devuelve su transpuesta.
    
    Args:
        matrix (list of list of int): Matriz 3x3 de números enteros.
    
    Returns:
        list of list of int: Matriz transpuesta 3x3.
    """
    # Transponemos la matriz utilizando list comprehension
    return [[matrix[j][i] for j in range(len(matrix))] for i in range(len(matrix[0]))]

# Matriz original 3x3
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Imprimir la matriz original
print("Matriz Original:")
for row in matrix:
    print(row)

# Transponer la matriz
transposed_matrix = transpose_matrix(matrix)

# Imprimir la matriz transpuesta
print("\nMatriz Transpuesta:")
for row in transposed_matrix:
    print(row)

# Explicación del código:
# 1. La matriz original se define como una lista de listas en Python.
# 2. La función `transpose_matrix` toma la matriz original y devuelve una nueva matriz con las filas y columnas intercambiadas.
#    Utilizamos una lista por comprensión que itera sobre los índices de las columnas y las filas de la matriz original para crear la matriz transpuesta.
# 3. Se imprime la matriz original antes de transponerla y luego la matriz transpuesta.


*/   
 .global _start

    .text
_start:
    // Definición de la matriz original 3x3
    // La matriz es:
    // 1  2  3
    // 4  5  6
    // 7  8  9
    // La transposición será:
    // 1  4  7
    // 2  5  8
    // 3  6  9

    // Inicializar los registros con los valores de la matriz original
    mov x0, 1          // Fila 1, Columna 1
    mov x1, 2          // Fila 1, Columna 2
    mov x2, 3          // Fila 1, Columna 3
    mov x3, 4          // Fila 2, Columna 1
    mov x4, 5          // Fila 2, Columna 2
    mov x5, 6          // Fila 2, Columna 3
    mov x6, 7          // Fila 3, Columna 1
    mov x7, 8          // Fila 3, Columna 2
    mov x8, 9          // Fila 3, Columna 3

    // Imprimir los elementos de la matriz original
    mov x9, 1          // Descriptor de archivo (stdout)
    bl print_int

    // Transponer la matriz:
    // Intercambiamos los elementos de la matriz original
    // Original: matriz[0][0]  matriz[0][1]  matriz[0][2]
    //           matriz[1][0]  matriz[1][1]  matriz[1][2]
    //           matriz[2][0]  matriz[2][1]  matriz[2][2]
    // Transpuesta: matriz[0][0]  matriz[1][0]  matriz[2][0]
    //              matriz[0][1]  matriz[1][1]  matriz[2][1]
    //              matriz[0][2]  matriz[1][2]  matriz[2][2]

    // Imprimir la matriz transpuesta
    mov x0, 1          // Fila 1, Columna 1
    mov x1, 4          // Fila 2, Columna 1
    mov x2, 7          // Fila 3, Columna 1
    mov x3, 2          // Fila 1, Columna 2
    mov x4, 5          // Fila 2, Columna 2
    mov x5, 8          // Fila 3, Columna 2
    mov x6, 3          // Fila 1, Columna 3
    mov x7, 6          // Fila 2, Columna 3
    mov x8, 9          // Fila 3, Columna 3

    // Imprimir la matriz transpuesta
    mov x9, 1          // Descriptor de archivo (stdout)
    bl print_int

    // Finalizar el programa
    mov x8, 93         // syscall number para exit
    mov x0, 0          // Código de salida
    svc 0

// Función para imprimir un número entero
print_int:
    // Recibe el número en x0 y lo imprime
    mov x1, x0          // Copiar el número a x1
    mov x0, 1           // Descriptor de archivo (stdout)
    mov x2, 4           // Longitud del número (4 bytes)
    svc 0
    ret

    .end
