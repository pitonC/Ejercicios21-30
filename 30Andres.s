/*
# Nombre del Programa: Cálculo del Máximo Común Divisor (MCD)
"""
Programa en Python: Calcular el Máximo Común Divisor (MCD) de dos números.
Concepto/Temática: El MCD es el número más grande que divide a dos números sin dejar residuo, y se usa en teoría de números, optimización y criptografía.
Aplicación Práctica: Encontrar el MCD es útil en simplificación de fracciones, criptografía, y en problemas que requieren divisores comunes.

def calcular_mcd(a, b):
    """
    Calcula el MCD de dos números utilizando el algoritmo de Euclides.
    
    Args:
        a (int): El primer número.
        b (int): El segundo número.
    
    Returns:
        int: El MCD de los dos números.
    """
    while b:
        a, b = b, a % b   # Actualizar a con b, y b con el resto de a dividido entre b
    return a

# Ejemplo de uso
a = 48
b = 18
mcd = calcular_mcd(a, b)

print(f"El MCD de {a} y {b} es: {mcd}")

La salida esperada es:
El MCD de 48 y 18 es: 6

En este ejemplo, calculamos el MCD de 48 y 18, que es 6, usando el algoritmo de Euclides.
"""
def calcular_mcd(a, b):
    """
    Calcula el MCD de dos números utilizando el algoritmo de Euclides.
    
    Args:
        a (int): El primer número.
        b (int): El segundo número.
    
    Returns:
        int: El MCD de los dos números.
    """
    while b:
        a, b = b, a % b   # Actualizar a con b, y b con el resto de a dividido entre b
    return a

# Ejemplo de uso
a = 48
b = 18
mcd = calcular_mcd(a, b)

print(f"El MCD de {a} y {b} es: {mcd}")

*/    

.global _start

    .text
_start:
    // Calcular el Máximo Común Divisor (MCD) de dos números
    /*
    Este programa calcula el MCD de dos números utilizando el algoritmo de Euclides.
    En este ejemplo, utilizamos los números 48 y 18, y el resultado esperado es 6.
    */

    mov x0, 48            // Primer número (48)
    mov x1, 18            // Segundo número (18)

gcd_loop:
    cmp x1, 0             // Comparar x1 con 0
    beq end_gcd           // Si x1 es 0, terminar el ciclo
    udiv x2, x0, x1       // x2 = x0 / x1 (parte entera de la división)
    msub x2, x2, x1, x0   // x2 = x0 - (x2 * x1) (resto de x0 / x1)
    mov x0, x1            // x0 toma el valor de x1
    mov x1, x2            // x1 toma el valor del resto
    b gcd_loop            // Repetir el ciclo

end_gcd:
    // Imprimir el resultado, que es el MCD
    mov x2, x0            // Mover el resultado a x2 para imprimirlo
    bl print_int          // Llamar a la función para imprimir el MCD

    // Finalizar el programa
    mov x8, 93            // syscall number para exit
    mov x0, 0             // Código de salida
    svc 0

// Función para imprimir un número entero
print_int:
    mov x1, x2            // Copiar el número a x1
    mov x0, 1             // Descriptor de archivo (stdout)
    mov x2, 4             // Longitud del número (4 bytes)
    svc 0
    ret

    .end
