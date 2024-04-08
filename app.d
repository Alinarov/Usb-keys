import core.sys.windows.windows;
import std.stdio;
import std.array;
import std.conv;

extern (Windows) {
    BOOL GetDiskFreeSpaceExA(LPSTR lpDirectoryName, PULARGE_INTEGER lpFreeBytesAvailableToCaller, PULARGE_INTEGER lpTotalNumberOfBytes, PULARGE_INTEGER lpTotalNumberOfFreeBytes);
    DWORD GetLogicalDriveStringsA(DWORD nBufferLength, LPSTR lpBuffer);
}

void main() {
    char[260] buffer; // El tamaño máximo para GetLogicalDriveStrings es 260
    DWORD drives = GetLogicalDriveStringsA(cast(DWORD) buffer.length, buffer.ptr);

    if (drives == 0) {
        writeln("Error al obtener las letras de unidad.");
        return;
    }

    writeln("Letras de unidad disponibles y sus tamaños:");

    auto visibleDrives = split(buffer[0 .. cast(ulong)drives], '\0'); // Dividir la cadena en partes

    foreach (drive; visibleDrives) {
        string unidad = to!string(drive);
        writeln("Unidad: ", unidad);

        ulong totalBytes, freeBytes;
        ULARGE_INTEGER lpFreeBytesAvailableToCaller, lpTotalNumberOfBytes, lpTotalNumberOfFreeBytes;

        if (GetDiskFreeSpaceExA(cast(LPSTR)unidad.ptr, &lpFreeBytesAvailableToCaller, &lpTotalNumberOfBytes, &lpTotalNumberOfFreeBytes)) {
            totalBytes = lpTotalNumberOfBytes.QuadPart;
            freeBytes = lpTotalNumberOfFreeBytes.QuadPart;

            writeln("Tamaño total: ", totalBytes, " bytes");
            writeln("Espacio libre: ", freeBytes, " bytes");
        } else {
            writeln("Error al obtener el tamaño del volumen.");
        }
        writeln(); // Línea en blanco entre cada unidad
    }
}
