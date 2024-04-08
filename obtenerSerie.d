import std.stdio;
import std.windows.registry;

void main()
{
    // Abrir la clave del Registro que contiene la información de los dispositivos USB
    auto usbKey = Registry.openKey(Registry.HKEY_LOCAL_MACHINE, "SYSTEM\\CurrentControlSet\\Enum\\USB");

    if (usbKey is null)
    {
        stderr.writeln("No se pudo abrir la clave del Registro de USB.");
        return;
    }

    // Enumerar todos los subnodos (dispositivos USB) dentro de la clave del Registro
    auto subKeys = usbKey.subKeyNames();

    // Iterar sobre cada subnodo para obtener el GUID de cada dispositivo USB
    foreach (subKey; subKeys)
    {
        auto deviceKey = usbKey.openKey(subKey);
        if (deviceKey !is null)
        {
            auto guid = deviceKey.getStringValue("Device Parameters", "DeviceInstanceGUID");
            if (!guid.empty)
            {
                writeln("GUID del dispositivo USB: ", guid);
            }
            deviceKey.close();
        }
    }

    // Cerrar la clave del Registro
    usbKey.close();
}
