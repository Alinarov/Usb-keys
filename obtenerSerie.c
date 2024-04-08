// Esto ya no
#include <stdio.h>
#include <windows.h>
#include <initguid.h> // Necesario para definir GUID_DEVINTERFACE_USB_DEVICE
#include <devguid.h>  // Necesario para GUID_DEVINTERFACE_USB_DEVICE

int main() {
    // Definir el GUID para la interfaz de dispositivo USB
    DEFINE_GUID(GUID_DEVINTERFACE_USB_DEVICE, 0xA5DCBF10L, 0x6530, 0x11D2, 0x90, 0x1F, 0x00, 0xC0, 0x4F, 0xB9, 0x51, 0xED);

    // Inicializar variables
    HDEVINFO hDevInfo;
    SP_DEVICE_INTERFACE_DATA devInterfaceData;
    DWORD dwIndex = 0;
    BOOL bResult;

    // Inicializar estructuras
    devInterfaceData.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);

    // Obtener una lista de dispositivos USB conectados
    hDevInfo = SetupDiGetClassDevs(&GUID_DEVINTERFACE_USB_DEVICE, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
    if (hDevInfo == INVALID_HANDLE_VALUE) {
        printf("Error al obtener la lista de dispositivos USB.\n");
        return 1;
    }

    // Iterar a través de los dispositivos USB
    while (TRUE) {
        bResult = SetupDiEnumDeviceInterfaces(hDevInfo, NULL, &GUID_DEVINTERFACE_USB_DEVICE, dwIndex++, &devInterfaceData);
        if (!bResult) {
            DWORD dwLastError = GetLastError();
            if (dwLastError == ERROR_NO_MORE_ITEMS) {
                // No hay más dispositivos para enumerar
                break;
            } else {
                printf("Error al enumerar los dispositivos USB: %lu\n", dwLastError);
                SetupDiDestroyDeviceInfoList(hDevInfo);
                return 1;
            }
        }

        // Obtener el detalle del dispositivo
        SP_DEVICE_INTERFACE_DETAIL_DATA *devInterfaceDetailData;
        DWORD dwRequiredSize;
        bResult = SetupDiGetDeviceInterfaceDetail(hDevInfo, &devInterfaceData, NULL, 0, &dwRequiredSize, NULL);
        if (!bResult && GetLastError() != ERROR_INSUFFICIENT_BUFFER) {
            printf("Error al obtener el tamaño necesario para el detalle del dispositivo USB: %lu\n", GetLastError());
            SetupDiDestroyDeviceInfoList(hDevInfo);
            return 1;
        }

        devInterfaceDetailData = (SP_DEVICE_INTERFACE_DETAIL_DATA*)malloc(dwRequiredSize);
        if (!devInterfaceDetailData) {
            printf("Error al asignar memoria para el detalle del dispositivo USB.\n");
            SetupDiDestroyDeviceInfoList(hDevInfo);
            return 1;
        }

        devInterfaceDetailData->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

        bResult = SetupDiGetDeviceInterfaceDetail(hDevInfo, &devInterfaceData, devInterfaceDetailData, dwRequiredSize, NULL, NULL);
        if (!bResult) {
            printf("Error al obtener el detalle del dispositivo USB: %lu\n", GetLastError());
            free(devInterfaceDetailData);
            SetupDiDestroyDeviceInfoList(hDevInfo);
            return 1;
        }

        // Imprimir el identificador del dispositivo (GUID)
        printf("GUID del dispositivo USB: %s\n", devInterfaceDetailData->DevicePath);

        free(devInterfaceDetailData);
    }

    // Limpiar
    SetupDiDestroyDeviceInfoList(hDevInfo);
    getchar();
    return 0;
}
