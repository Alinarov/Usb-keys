// no borrar por el momento
// si funciona aunq no lo que quiero 
import std.stdio;
import std.windows.registry;
import std;

void main()
{
    // Acceder a la clave USBSTOR en el Registro
    Key usbStorKey = Registry.localMachine.getKey("SYSTEM").getKey("CurrentControlSet").getKey("Enum").getKey("USBSTOR");
    if (!usbStorKey)
    {
        writeln("No se pudo acceder a la clave USBSTOR en el Registro.");
        return;
    }

    // Iterar sobre las subclaves e imprimir sus nombres
    writeln("Nombres de registros en USBSTOR:");
    foreach (string subKeyName; usbStorKey.keyNames)
    {
        writeln(subKeyName);
    }

    writeln("\nAccediendo a la primera subclave de USBSTOR:");

    // Acceder a la primera subclave de USBSTOR
    string firstSubKeyName = usbStorKey.keyNames.front;
    try
    {
        Key firstSubKey = usbStorKey.getKey(firstSubKeyName);

        // Intentar obtener el valor "ClassGUID" dentro de la primera subclave
        try
        {
            string classGUID = firstSubKey.getValue("ClassGUID").value_SZ;
            writeln("GUID de clase para ", firstSubKeyName, ": ", classGUID);
        }
        catch (RegistryException e)
        {
            writeln("No se pudo obtener el GUID de clase para ", firstSubKeyName, ": ", e.msg);
        }
    }
    catch (RegistryException e)
    {
        writeln("No se pudo acceder a la primera subclave de USBSTOR: ", e.msg);
    }
}
