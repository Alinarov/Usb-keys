import core.sys.windows.winnt : FILE_ATTRIBUTE_HIDDEN, DWORD;
import core.sys.windows.windows : GetFileAttributesW, SetFileAttributesW, INVALID_FILE_ATTRIBUTES;
import std.utf : toUTF16z;
import std.stdio : writeln;

void main() {
    string filePath = "archivo.md";

    // Convertir la ruta del archivo a UTF-16 y agregar el terminador nulo
    const(wchar)* wFilePath = toUTF16z(filePath);

    // Copiar el contenido del puntero a un nuevo array mutable
    wchar[] wFilePathMutable;
    int i = 0;
    while (wFilePath[i] != '\0') {
        wFilePathMutable ~= wFilePath[i];
        i++;
    }
    wFilePathMutable ~= '\0'; // Agregar el terminador nulo

    // Obtener los atributos actuales del archivo
    DWORD currentAttributes = GetFileAttributesW(wFilePathMutable.ptr);

    // Verificar si el archivo existe
    if (currentAttributes != INVALID_FILE_ATTRIBUTES) {
        // Ocultar el archivo si aún no está oculto
        if ((currentAttributes & FILE_ATTRIBUTE_HIDDEN) == 0) {
            // Establecer el atributo de archivo oculto
            if (SetFileAttributesW(wFilePathMutable.ptr, currentAttributes | FILE_ATTRIBUTE_HIDDEN)) {
                writeln("El archivo ", filePath, " se ha ocultado correctamente.");
            } else {
                writeln("Error al intentar ocultar el archivo ", filePath, ".");
            }
        } else {
            writeln("El archivo ", filePath, " ya está oculto.");
        }
    } else {
        writeln("El archivo ", filePath, " no existe.");
    }
}
