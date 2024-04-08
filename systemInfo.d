// funciona pero no como quiero
import std.process;
import std.stdio;
import std.file;

void main() {
    // Ruta de la unidad cuyo número de serie del volumen quieres obtener
    string unidad = "F:";

    // Construir el comando para obtener el número de serie del volumen
    string comando = "vol " ~ unidad;

    // Nombre del archivo para capturar la salida del comando
    string outputFile = "output.txt";

    // Ejecutar el comando y redirigir la salida a un archivo
    executeShell(comando ~ " > " ~ outputFile);

    // Leer la salida del archivo y mostrarla en la consola
    string salida = readText(outputFile);
    writeln(salida);

    // Eliminar el archivo de salida
    std.file.remove(outputFile);
}
