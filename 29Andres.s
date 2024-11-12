/*
# Nombre del Programa: Contar los Bits Activados en un Número
"""
Programa en Python: Contar los bits activados en un número.
Concepto/Temática: Contar bits en 1 es una técnica básica de manipulación de bits y se usa en varios campos, desde optimización de memoria hasta criptografía.
Aplicación Práctica: El conteo de bits activados es útil para verificar configuraciones en aplicaciones de redes, manejar permisos y en sistemas de criptografía.

def contar_bits_activados(n):
    """
    Cuenta el número de bits activados (en 1) en la representación binaria de un número.
    
    Args:
        n (int): El número a evaluar.
    
    Returns:
        int: La cantidad de bits activados en el número.
    """
    contador = 0
    while n:
        contador += n & 1   # Suma 1 al contador si el bit menos significativo es 1
        n >>= 1             # Desplaza el número una posición a la derecha
    return contador

# Ejemplo de uso
n = 29  # El número a evaluar (binario 11101)
bits_activados = contar_bits_activados(n)

print(f"El número de bits activados en {n} es: {bits_activados}")

La salida esperada es:
El número de bits activados en 29 es: 4

En este ejemplo, contamos los bits en 1 del número 29 (11101 en binario).
"""
def contar_bits_activados(n):
    """
    Cuenta el número de bits activados (en 1) en la representación binaria de un número.
    
    Args:
        n (int): El número a evaluar.
    
    Returns:
        int: La cantidad de bits activados en el número.
    """
    contador = 0
    while n:
        contador += n & 1   # Suma 1 al contador si el bit menos significativo es 1
        n >>= 1             # Desplaza el número una posición a la derecha
    return contador

# Ejemplo de uso
n = 29  # El número a evaluar (binario 11101)
bits_activados = contar_bits_activados(n)

print(f"El número de bits activados en {n} es: {bits_activados}")

*/   

 .global _start

    .text
_start:
    // Contar los bits activados en un número
    /*
    En este ejemplo, contamos los bits activados en el número 29 (binario 11101).
    Se espera que el resultado sea 4, ya que hay cuatro bits en 1.
    */

    mov x0, 29             // Cargar el número 29 en el registro x0
    mov x1, 0              // Inicializar contador de bits activados en x1

count_bits:
    // Revisar el bit menos significativo
    and x2, x0, 1          // x2 = x0 & 1, extraer el bit menos significativo
    add x1, x1, x2         // Sumar el bit activado al contador (si x2 es 1)

    // Desplazar a la derecha para revisar el siguiente bit
    lsr x0, x0, 1          // Desplazar x0 a la derecha 1 posición

    // Continuar hasta que x0 sea 0
    cbnz x0, count_bits    // Repetir si x0 no es 0

    // Imprimir el número de bits activados
    mov x2, x1             // Mover el resultado a x2 para imprimirlo
    bl print_int           // Llamar a la función para imprimir

    // Finalizar el programa
    mov x8, 93             // syscall number para exit
    mov x0, 0              // Código de salida
    svc 0

// Función para imprimir un número entero
print_int:
    mov x1, x2             // Copiar el número a x1
    mov x0, 1              // Descriptor de archivo (stdout)
    mov x2, 4              // Longitud del número (4 bytes)
    svc 0
    ret

    .end
