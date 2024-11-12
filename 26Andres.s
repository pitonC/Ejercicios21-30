/*
# Nombre del Programa: Desplazamientos a la Izquierda y Derecha
"""
Programa en Python: Realizar desplazamientos a la izquierda (<<) y a la derecha (>>) a nivel de bits entre dos números.
Concepto/Temática: Los desplazamientos de bits son operaciones fundamentales en la programación de bajo nivel, útiles en la manipulación de datos, optimización de código y criptografía.
Aplicación Práctica: Los desplazamientos de bits se usan en compresión de datos, cifrado, y operaciones matemáticas eficientes a nivel de hardware.

def desplazamientos_bits(a, desplazamiento):
    """
    Realiza desplazamientos a la izquierda y a la derecha a nivel de bits entre dos números.
    
    Args:
        a (int): El número al que se le aplicarán los desplazamientos.
        desplazamiento (int): El número de posiciones para el desplazamiento.
    
    Returns:
        tuple: Los resultados de los desplazamientos a la izquierda y a la derecha.
    """
    desplazamiento_izquierda = a << desplazamiento  # Desplazamiento a la izquierda (<<)
    desplazamiento_derecha = a >> desplazamiento   # Desplazamiento a la derecha (>>)
    return desplazamiento_izquierda, desplazamiento_derecha

# Ejemplo de uso
a = 8  # El número a operar (0x8)
desplazamiento = 2  # Número de posiciones de desplazamiento
izquierda, derecha = desplazamientos_bits(a, desplazamiento)

print(f"{a} << {desplazamiento} = {izquierda}")  # 32
print(f"{a} >> {desplazamiento} = {derecha}")   # 2

La salida esperada es:
8 << 2 = 32
8 >> 2 = 2

En este ejemplo, se operan los desplazamientos de 2 bits sobre el número 8 (0x8).
"""
def desplazamientos_bits(a, desplazamiento):
    """
    Realiza desplazamientos a la izquierda y a la derecha a nivel de bits entre dos números.
    
    Args:
        a (int): El número al que se le aplicarán los desplazamientos.
        desplazamiento (int): El número de posiciones para el desplazamiento.
    
    Returns:
        tuple: Los resultados de los desplazamientos a la izquierda y a la derecha.
    """
    desplazamiento_izquierda = a << desplazamiento  # Desplazamiento a la izquierda (<<)
    desplazamiento_derecha = a >> desplazamiento   # Desplazamiento a la derecha (>>)
    return desplazamiento_izquierda, desplazamiento_derecha

# Ejemplo de uso
a = 8  # El número a operar (0x8)
desplazamiento = 2  # Número de posiciones de desplazamiento
izquierda, derecha = desplazamientos_bits(a, desplazamiento)

print(f"{a} << {desplazamiento} = {izquierda}")  # 32
print(f"{a} >> {desplazamiento} = {derecha}")   # 2

*/

    .global _start

    .text
_start:
    // Desplazamientos a la izquierda y derecha
    /*
    Definición de los dos números a operar
    En este caso, el número es 8 (0x8) y se aplicarán desplazamientos a la izquierda y a la derecha.
    Las operaciones serán:
    - Desplazamiento a la izquierda (<<) de 8 bits: 8 << 2 = 32 (0x20)
    - Desplazamiento a la derecha (>>) de 8 bits: 8 >> 2 = 2 (0x2)
    */

    mov x0, 8         // Cargar el número 8 (0x8) en x0

    // Desplazamiento a la izquierda (x0 << 2)
    lsl x1, x0, 2     // Desplazar x0 a la izquierda en 2 bits (x1 = 8 << 2 = 32)
    mov x2, x1        // Mover el resultado a x2 para imprimirlo
    bl print_int      // Imprimir el resultado de desplazamiento a la izquierda

    // Desplazamiento a la derecha (x0 >> 2)
    lsr x1, x0, 2     // Desplazar x0 a la derecha en 2 bits (x1 = 8 >> 2 = 2)
    mov x2, x1        // Mover el resultado a x2 para imprimirlo
    bl print_int      // Imprimir el resultado de desplazamiento a la derecha

    // Finalizar el programa
    mov x8, 93        // syscall number para exit
    mov x0, 0         // Código de salida
    svc 0

// Función para imprimir un número entero
print_int:
    mov x1, x2         // Copiar el número a x1
    mov x0, 1          // Descriptor de archivo (stdout)
    mov x2, 4          // Longitud del número (4 bytes)
    svc 0
    ret

    .end
