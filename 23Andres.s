/*

# Nombre del Programa: Conversión de ASCII a Entero
"""
Programa en Python: Conversión de un carácter ASCII a entero
Concepto/Temática: Convertir un valor ASCII a su correspondiente valor entero.
Aplicación Práctica: Este tipo de conversión es útil cuando se maneja entrada de usuario o datos de texto en aplicaciones que necesitan trabajar con representaciones numéricas de caracteres.

def ascii_to_int(char):
    """
    Convierte un carácter ASCII en su valor entero correspondiente.
    
    Args:
        char (str): Un solo carácter de texto.
    
    Returns:
        int: El valor entero del carácter ASCII.
    """
    # Convertimos el carácter a su valor ASCII usando la función ord()
    return ord(char)

# Ejemplo de uso
char = '7'  # Carácter a convertir
print(f"El valor entero de '{char}' es: {ascii_to_int(char)}")

La salida esperada es:
El valor entero de '7' es: 55

En este ejemplo, la letra '7' tiene el valor ASCII 55.
"""
def ascii_to_int(char):
    """
    Convierte un carácter ASCII en su valor entero correspondiente.
    
    Args:
        char (str): Un solo carácter de texto.
    
    Returns:
        int: El valor entero del carácter ASCII.
    """
    return ord(char)

# Carácter a convertir
char = '7'
# Imprimir el valor entero de '7'
print(f"El valor entero de '{char}' es: {ascii_to_int(char)}")

*/ 

   .global _start

    .text
_start:
    // Conversión de ASCII a Entero
    /*
    Definición del valor ASCII a convertir
    El valor ASCII de '7' es 55
    */
    mov x0, 55         // Cargar el valor ASCII (55 para '7')

    // Imprimir el valor entero del carácter ASCII
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
