/*
# Nombre del Programa: Operaciones AND, OR, XOR a Nivel de Bits
"""
Programa en Python: Realizar operaciones AND, OR y XOR a nivel de bits entre dos números.
Concepto/Temática: Ejecutar operaciones a nivel de bits, que son fundamentales en operaciones con máscaras, cifrado, y otros algoritmos de procesamiento de bajo nivel.
Aplicación Práctica: Las operaciones AND, OR y XOR son utilizadas en programación de sistemas, criptografía y manipulación de datos a nivel de bits.

def operaciones_bitwise(a, b):
    """
    Realiza operaciones AND, OR y XOR a nivel de bits entre dos números.
    
    Args:
        a (int): El primer número.
        b (int): El segundo número.
    
    Returns:
        tuple: Los resultados de las operaciones AND, OR y XOR.
    """
    and_result = a & b    # Operación AND
    or_result = a | b     # Operación OR
    xor_result = a ^ b    # Operación XOR
    return and_result, or_result, xor_result

# Ejemplo de uso
a = 12  # Primer número (0xC)
b = 10  # Segundo número (0xA)
and_result, or_result, xor_result = operaciones_bitwise(a, b)

print(f"{a} AND {b} = {and_result}")  # 8
print(f"{a} OR {b} = {or_result}")    # 14
print(f"{a} XOR {b} = {xor_result}")  # 6

La salida esperada es:
12 AND 10 = 8
12 OR 10 = 14
12 XOR 10 = 6

En este ejemplo, se operan los números 12 (0xC) y 10 (0xA) para obtener los resultados de AND, OR y XOR.
"""
def operaciones_bitwise(a, b):
    """
    Realiza operaciones AND, OR y XOR a nivel de bits entre dos números.
    
    Args:
        a (int): El primer número.
        b (int): El segundo número.
    
    Returns:
        tuple: Los resultados de las operaciones AND, OR y XOR.
    """
    and_result = a & b    # Operación AND
    or_result = a | b     # Operación OR
    xor_result = a ^ b    # Operación XOR
    return and_result, or_result, xor_result

# Ejemplo de uso
a = 12  # Primer número (0xC)
b = 10  # Segundo número (0xA)
and_result, or_result, xor_result = operaciones_bitwise(a, b)

print(f"{a} AND {b} = {and_result}")  # 8
print(f"{a} OR {b} = {or_result}")    # 14
print(f"{a} XOR {b} = {xor_result}")  # 6

*/  

  .global _start

    .text
_start:
    // Operaciones AND, OR, XOR a nivel de bits
    /*
    Definición de los dos números a operar
    En este caso, los números son 12 (0xC) y 10 (0xA).
    Las operaciones serán:
    - AND: 12 & 10 = 8 (0x8)
    - OR: 12 | 10 = 14 (0xE)
    - XOR: 12 ^ 10 = 6 (0x6)
    */

    mov x0, 12         // Cargar el primer número (12)
    mov x1, 10         // Cargar el segundo número (10)

    // Operación AND
    and x2, x0, x1     // AND entre x0 y x1, resultado en x2 (x2 = 12 & 10 = 8)
    mov x3, x2         // Mover el resultado a x3 para imprimirlo
    bl print_int       // Imprimir el resultado de AND

    // Operación OR
    orr x2, x0, x1     // OR entre x0 y x1, resultado en x2 (x2 = 12 | 10 = 14)
    mov x3, x2         // Mover el resultado a x3 para imprimirlo
    bl print_int       // Imprimir el resultado de OR

    // Operación XOR
    eor x2, x0, x1     // XOR entre x0 y x1, resultado en x2 (x2 = 12 ^ 10 = 6)
    mov x3, x2         // Mover el resultado a x3 para imprimirlo
    bl print_int       // Imprimir el resultado de XOR

    // Finalizar el programa
    mov x8, 93         // syscall number para exit
    mov x0, 0          // Código de salida
    svc 0

// Función para imprimir un número entero
print_int:
    mov x1, x3          // Copiar el número a x1
    mov x0, 1           // Descriptor de archivo (stdout)
    mov x2, 4           // Longitud del número (4 bytes)
    svc 0
    ret

    .end
