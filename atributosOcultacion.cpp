#include <Windows.h>

int main() {
    LPCWSTR filePath = L"archivo.md";

    DWORD attributes = GetFileAttributesW(filePath);
    if (attributes != INVALID_FILE_ATTRIBUTES) {
        attributes |= FILE_ATTRIBUTE_SYSTEM | FILE_ATTRIBUTE_HIDDEN;
        SetFileAttributesW(filePath, attributes);
        // Verificar si SetFileAttributes fue exitoso
        if (GetLastError() == ERROR_SUCCESS) {
            // Éxito
        }
    }
    return 0;
}
