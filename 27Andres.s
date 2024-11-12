/*
# Nombre del Programa: Establecer, Borrar y Alternar Bits
"""
Programa en Python: Realizar operaciones de establecimiento, borrado y alternancia de bits sobre un número.
Concepto/Temática: Manipular bits de un número es una operación fundamental en la programación de bajo nivel, útil para el manejo eficiente de datos, optimización y en algoritmos de criptografía y compresión.
Aplicación Práctica: Establecer, borrar y alternar bits se usa en control de hardware, manipulación de máscaras, redes y en programación de sistemas.

def manipular_bits(a, bit_pos):
    """
    Realiza las operaciones de establecer, borrar y alternar un bit en una posición específica de un número.
    
    Args:
        a (int): El número sobre el que se realizará la operación.
        bit_pos (int): La posición del bit a modificar (0-indexado).
    
    Returns:
        tuple: Los resultados de las tres operaciones (establecer, borrar, alternar).
    """
    # Establecer el bit (OR)
    establecer = a | (1 << bit_pos)
    # Borrar el bit (AND con el complemento)
    borrar = a & ~(1 << bit_pos)
    # Alternar el bit (XOR)
    alternar = a ^ (1 << bit_pos)
    
    return establecer, borrar, alternar

# Ejemplo de uso
a = 5  # El número a operar (0x5 = 0101)
bit_pos = 1  # La posición del bit a modificar (por ejemplo, el bit 1)
establecer, borrar, alternar = manipular_bits(a, bit_pos)

print(f"{a} | (1 << {bit_pos}) = {establecer}")  # Establecer el bit
print(f"{a} & ~(1 << {bit_pos}) = {borrar}")    # Borrar el bit
print(f"{a} ^ (1 << {bit_pos}) = {alternar}")   # Alternar el bit

La salida esperada es:
5 | (1 << 1) = 7
5 & ~(1 << 1) = 1
5 ^ (1 << 1) = 7

En este ejemplo, se manipula el número 5 (0x5 = 0101), y se establece, borra y alterna el bit en la posición 1 (segunda posición).
"""
def manipular_bits(a, bit_pos):
    """
    Realiza las operaciones de establecer, borrar y alternar un bit en una posición específica de un número.
    
    Args:
        a (int): El número sobre el que se realizará la operación.
        bit_pos (int): La posición del bit a modificar (0-indexado).
    
    Returns:
        tuple: Los resultados de las tres operaciones (establecer, borrar, alternar).
    """
    # Establecer el bit (OR)
    establecer = a | (1 << bit_pos)
    # Borrar el bit (AND con el complemento)
    borrar = a & ~(1 << bit_pos)
    # Alternar el bit (XOR)
    alternar = a ^ (1 << bit_pos)
    
    return establecer, borrar, alternar

# Ejemplo de uso
a = 5  # El número a operar (0x5 = 0101)
bit_pos = 1  # La posición del bit a modificar (por ejemplo, el bit 1)
establecer, borrar, alternar = manipular_bits(a, bit_pos)

print(f"{a} | (1 << {bit_pos}) = {establecer}")  # Establecer el bit
print(f"{a} & ~(1 << {bit_pos}) = {borrar}")    # Borrar el bit
print(f"{a} ^ (1 << {bit_pos}) = {alternar}")   # Alternar el bit

*/  

  .global _start

    .text
_start:
    // Establecer, borrar y alternar bits
    /*
    Definición de los números a operar
    En este caso, el número es 0x5 (binario 0101) y se realizarán las siguientes operaciones:
    - Establecer el bit 1: Se establece el bit 1 (posición 1), 0x5 | 0x2 = 0x7 (binario 0111)
    - Borrar el bit 2: Se borra el bit 2 (posición 2), 0x5 & ~0x4 = 0x1 (binario 0001)
    - Alternar el bit 1: Se alterna el bit 1 (posición 1), 0x5 ^ 0x2 = 0x7 (binario 0111)
    */

    mov x0, 5         // Cargar el número 0x5 (binario 0101)

    // Establecer el bit 1 (posición 1)
    orr x1, x0, 2     // Establecer el bit 1: 0x5 | 0x2 = 0x7
    mov x2, x1        // Mover el resultado a x2 para imprimirlo
    bl print_int      // Imprimir el resultado de establecer el bit

    // Borrar el bit 2 (posición 2)
    and x1, x0, 0xFFFFFFFB // Borrar el bit 2: 0x5 & ~0x4 = 0x1
    mov x2, x1        // Mover el resultado a x2 para imprimirlo
    bl print_int      // Imprimir el resultado de borrar el bit

    // Alternar el bit 1 (posición 1)
    eor x1, x0, 2     // Alternar el bit 1: 0x5 ^ 0x2 = 0x7
    mov x2, x1        // Mover el resultado a x2 para imprimirlo
    bl print_int      // Imprimir el resultado de alternar el bit

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
