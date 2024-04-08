import std.stdio : File, readln, writeln;

void main() {
    string filePath = "archivo.md";

    // Abrir el archivo en modo de lectura
    auto file = File(filePath, "r");

    // Verificar si el archivo se abrió correctamente
    if (file.isOpen) {
        // Leer y mostrar el contenido del archivo línea por línea
        writeln("Contenido del archivo ", filePath, ":");
        foreach (line; file.byLine()) {
            writeln(line);
        }
        file.close(); // Cerrar el archivo después de leer
    } else {
        writeln("Error al abrir el archivo ", filePath, " para leer.");
        return;
    }

    // Ahora puedes proceder a modificar el archivo si es necesario
    string nuevoContenido = "Nuevo mensaje agregado al archivo.";

    // Abrir el archivo en modo de escritura
    file = File(filePath, "a");

    // Verificar si el archivo se abrió correctamente
    if (file.isOpen) {
        // Escribir el nuevo contenido en el archivo
        file.writeln(nuevoContenido);
        file.close(); // Cerrar el archivo después de escribir

        writeln("Se ha modificado el contenido del archivo ", filePath, " correctamente.");
    } else {
        writeln("Error al abrir el archivo ", filePath, " para escribir.");
    }
}
