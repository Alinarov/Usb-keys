import std.file;
import std.stdio;

void main()
{
    // Ruta de la unidad oculta
    string rutaUnidadOculta = "e:\\"; // Reemplaza "X" con la letra de unidad de tu unidad oculta

    // Enumerar archivos en la unidad oculta
    try
    {
        auto archivos = dirEntries(rutaUnidadOculta, SpanMode.shallow);
        
        writeln("Archivos en la unidad oculta:");
        foreach (archivo; archivos)
        {
            writeln(archivo.name);
        }
    }
    catch (Exception e)
    {
        writeln("Error al enumerar archivos: ", e.msg);
    }
    getchar();
}
