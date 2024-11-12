 
/*
# Nombre del Programa: Calcular la Longitud de una Cadena
"""
Programa en Python: Calcular la longitud de una cadena de caracteres
Concepto/Temática: Calcular la longitud de una cadena de texto.
Aplicación Práctica: Esta operación es común en procesamiento de cadenas, especialmente cuando se necesita saber cuántos caracteres tiene una cadena dada.

def calcular_longitud(cadena):
    """
    Calcula la longitud de una cadena de caracteres.
    
    Args:
        cadena (str): La cadena de texto cuyo tamaño se quiere conocer.
    
    Returns:
        int: La longitud de la cadena.
    """
    return len(cadena)

# Ejemplo de uso
cadena = "Hola Mundo"  # Cadena a evaluar
print(f"La longitud de la cadena '{cadena}' es: {calcular_longitud(cadena)}")

La salida esperada es:
La longitud de la cadena 'Hola Mundo' es: 10

En este ejemplo, la cadena 'Hola Mundo' tiene una longitud de 10 caracteres.
"""
def calcular_longitud(cadena):
    """
    Calcula la longitud de una cadena de caracteres.
    
    Args:
        cadena (str): La cadena de texto cuyo tamaño se quiere conocer.
    
    Returns:
        int: La longitud de la cadena.
    """
    return len(cadena)

# Cadena a evaluar
cadena = "Hola Mundo"
# Imprimir la longitud de la cadena
print(f"La longitud de la cadena '{cadena}' es: {calcular_longitud(cadena)}")


*/
   .global _start

    .text
_start:
    // Calcular la longitud de una cadena
    /*
    Definición de la cadena a evaluar
    En este caso, la cadena es "Hola Mundo" y su longitud es 10 caracteres.
    */
    // Dirección de la cadena
    mov x0, cadena     // Cargar la dirección de la cadena en x0
    bl calcular_longitud

    // Finalizar el programa
    mov x8, 93         // syscall number para exit
    mov x0, 0          // Código de salida
    svc 0

// Función para calcular la longitud de una cadena
calcular_longitud:
    mov x1, 0          // Inicializar el contador de longitud en 0

contar:
    ldrb w2, [x0], #1  // Cargar el siguiente byte de la cadena
    cmp w2, 0          // Comprobar si es el final de la cadena (carácter nulo)
    beq fin             // Si es 0, salir del bucle
    add x1, x1, 1      // Incrementar el contador
    b contar           // Continuar con el siguiente byte

fin:
    // Imprimir la longitud de la cadena
    mov x9, 1          // Descriptor de archivo (stdout)
    bl print_int

    ret

// Función para imprimir un número entero
print_int:
    mov x1, x1          // Copiar el número a x1
    mov x0, 1           // Descriptor de archivo (stdout)
    mov x2, 4           // Longitud del número (4 bytes)
    svc 0
    ret

    .data
cadena:
    .asciz "Hola Mundo" // Cadena a evaluar
    .end
