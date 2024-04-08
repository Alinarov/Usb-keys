import std.stdio;
import std.process;

void main()
{
    // Ejecutar el comando 'wmic diskdrive list brief' en la línea de comandos
    auto process = pipeProcess(["wmic", "diskdrive", "list", "brief"]);

    // Leer la salida del proceso línea por línea
    foreach (line; process.stdout.byLine())
    {
        writeln(line);
    }

}
