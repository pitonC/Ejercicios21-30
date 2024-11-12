/*
# Nombre del Programa: Conversión de Entero a ASCII
"""
Programa en Python: Conversión de un entero a su valor ASCII correspondiente
Concepto/Temática: Convertir un valor entero a su correspondiente carácter ASCII.
Aplicación Práctica: Esta conversión es útil para convertir valores numéricos en sus representaciones de caracteres cuando se trabajan con datos o se manipulan cadenas de texto.

def int_to_ascii(number):
    """
    Convierte un número entero en su valor ASCII correspondiente.
    
    Args:
        number (int): Un valor entero que se convertirá a un carácter ASCII.
    
    Returns:
        str: El carácter ASCII correspondiente al valor entero.
    """
    # Convertimos el número entero a un carácter ASCII usando la función chr()
    return chr(number)

# Ejemplo de uso
number = 55  # Número entero a convertir
print(f"El valor ASCII de {number} es: {int_to_ascii(number)}")

La salida esperada es:
El valor ASCII de 55 es: 7

En este ejemplo, el número entero 55 se convierte en el carácter ASCII '7'.
"""
def int_to_ascii(number):
    """
    Convierte un número entero en su valor ASCII correspondiente.
    
    Args:
        number (int): Un valor entero que se convertirá a un carácter ASCII.
    
    Returns:
        str: El carácter ASCII correspondiente al valor entero.
    """
    return chr(number)

# Número entero a convertir
number = 55
# Imprimir el valor ASCII de 55
print(f"El valor ASCII de {number} es: {int_to_ascii(number)}")

*/   

 .global _start

    .text
_start:
    // Conversión de Entero a ASCII
    /*
    Definición del valor entero a convertir
    En este caso, convertiremos el valor entero 55 a su carácter ASCII correspondiente ('7')
    */
    mov x0, 55         // Cargar el valor entero (55 para '7')

    // Convertir el entero a su valor ASCII
    // En este caso, no es necesario realizar una conversión especial, ya que 55 ya es el valor ASCII de '7'

    // Imprimir el carácter correspondiente al valor ASCII
    mov x9, 1          // Descriptor de archivo (stdout)
    bl print_char

    // Finalizar el programa
    mov x8, 93         // syscall number para exit
    mov x0, 0          // Código de salida
    svc 0

// Función para imprimir un carácter (se usa el valor de ASCII en x0)
print_char:
    mov x1, x0          // Copiar el número a x1
    mov x0, 1           // Descriptor de archivo (stdout)
    mov x2, 1           // Longitud del carácter (1 byte)
    svc 0
    ret

    .end
