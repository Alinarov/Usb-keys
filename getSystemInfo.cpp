// si funciona 
#include <iostream>
#include <windows.h>

int main() {
    DWORD VolumeSerialNumber = 0;
    LPCWSTR volume = L"f:\\"; // Cambiamos WCHAR* a LPCWSTR

    WCHAR volumeName[MAX_PATH]; // Variable temporal para el nombre del volumen
    WCHAR fileSystemName[MAX_PATH]; // Variable temporal para el nombre del sistema de archivos

    if (!GetVolumeInformationW(volume, volumeName, MAX_PATH, &VolumeSerialNumber, NULL, NULL, fileSystemName, MAX_PATH)) {
        std::cerr << "Error al obtener el número de serie del volumen." << std::endl;
        return 1;
    }

    // Imprimir el número de serie del volumen formateado como XXXX-XXXX
    printf("Volume Serial Number es %04X-%04X\n",
        HIWORD(VolumeSerialNumber),
        LOWORD(VolumeSerialNumber));

    return 0;
}
