
Microsoft DiskPart versión 10.0.18362.1

Copyright (C) Microsoft Corporation.
En el equipo: DESKTOP-RNTV16H

DISKPART> list disk

  Núm Disco  Estado      Tamaño   Disp     Din  Gpt
  ---------- ----------  -------  -------  ---  ---
  Disco 0    En línea        931 GB      0 B        *
  Disco 1    En línea         28 GB  1315 MB

DISKPART> select disk 1

El disco 1 es ahora el disco seleccionado.

DISKPART> list partition

  Núm Partición  Tipo              Tamaño   Desplazamiento
  -------------  ----------------  -------  ---------------
  Partición 1    Principal          732 MB  1024 KB
  Partición 2    Principal           26 GB  2048 MB

DISKPART> select partition 1

La partición 1 es ahora la partición seleccionada.

DISKPART> detail

Microsoft DiskPart versión 10.0.18362.1

DISK        - Muestra las propiedades del disco seleccionado.
PARTITION   - Muestra las propiedades de la partición seleccionada.
VOLUME      - Muestra las propiedades del volumen seleccionado.
VDISK       - Muestra las propiedades del disco virtual seleccionado.

DISKPART> detail partition

Partición 1
Tipo          : 07
Oculta        : No
Activa        : No
Desplaz. bytes: 1048576

  Núm Volumen Ltr  Etiqueta     Fs     Tipo        Tamaño   Estado     Info
  ----------- ---  -----------  -----  ----------  -------  ---------  --------
* Volume 4                      NTFS   Extraíble    732 MB  Correcto

DISKPART> setid id=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7 override

El tipo especificado no tiene el formato correcto.
Para obtener más información acerca del comando, escriba: HELP SET

DISKPART> setid=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7 override

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP SETID

DISKPART> setid=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7 override

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP SETID

DISKPART> help set

    Cambia el campo de tipo de partición por la partición que recibe el enfoque.

Sintaxis:  SET ID={<BYTE> | <GUID>} [OVERRIDE] [NOERR]

    ID={<BYTE> | <GUID>}

                Especifica el nuevo tipo de partición.

                Para los discos de registro de arranque maestro (MBR), puedes especificar un byte de tipo de
                partición, en formato hexadecimal, para la partición. Se
                puede especificar cualquier byte de tipo de partición con este parámetro, excepto
                para el tipo 0x42 (partición LDM). Ten en cuenta que el "0x" inicial se
                omite al especificar el tipo de partición hexadecimal.

                Para los discos de tabla de particiones GUID (GPT) puedes especificar un
                GUID de tipo de partición para la partición. Los GUID reconocidos
                son:

                    Partición de sistema EFI:
                        c12a7328-f81f-11d2-ba4b-00a0c93ec93b

                    Partición de datos básicos:
                        ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

                Se puede especificar cualquier GUID de tipo de partición con este parámetro,
                excepto los siguientes:

                    Partición reservada de Microsoft:
                        e3c9e316-0b5c-4db8-817d-f92df00215ae

                    Partición de metadatos LDM en un disco dinámico:
                        5808c8aa-7e8f-42e0-85d2-e1e90434cfb3

                    Partición de datos LDM en un disco dinámico:
                        af9b60a0-1431-4f62-bc68-3311714a69ad

                    Partición de metadatos de clúster:
                        db97dba9-0840-4bae-97f0-ffb9a327c7e1


                Excepto las limitaciones mencionadas, DiskPart no
                comprueba la validez del tipo de partición excepto para asegurarse de
                que sea un byte con formato hexadecimal o un GUID.

    OVERRIDE    Permite que DiskPart obligue al sistema de archivos del volumen a
                desmontarse antes de cambiar el tipo de partición. Al cambiar
                el tipo de partición, DiskPart intentará bloquear y desmontar
                el sistema de archivos del volumen. Si no se especifica este parámetro
                y la llamada para bloquear el sistema de archivos no se realiza correctamente (porque otra
                aplicación tiene un identificador abierto en el volumen), toda la
                operación generará un error. Si se especifica este parámetro, el
                desmontaje se aplicará aunque la llamada para bloquear el sistema de archivos
                no se realice correctamente. Al desmontar un sistema de archivos, todos los identificadores abiertos en
                el volumen dejarán de ser válidos.

    NOERR       Solo para scripting. Cuando se encuentra un error, DiskPart
                sigue procesando los comandos como si no existiese el error.
                Sin el parámetro NOERR, un error hace que DiskPart se cierre
                con un código de error.

    Para uso exclusivo de fabricantes de equipo original (OEM).

    Para realizar esta operación correctamente, es necesario seleccionar una partición.

    Precaución:

        Cuando se cambian los campos de tipo de partición con este parámetro, es posible que
        haya errores en el equipo o que no pueda iniciarse. A menos que seas un OEM o un
        profesional de TI con experiencia en discos, no cambies los campos de tipo de
        partición en discos GPT con este parámetro. En su lugar, usa siempre el
        comando CREATE PARTITION EFI para crear particiones de sistema EFI, el
        comando CREATE PARTITION MSR para crear particiones reservadas de Microsoft
        y el comando CREATE PARTITION PRIMARY sin el parámetro ID para
        crear particiones principales en discos GPT.

    Este comando no funciona en discos dinámicos ni en particiones reservadas de
    Microsoft.

    Ejemplo:

    SET ID=07 OVERRIDE
    SET ID=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

DISKPART> set id=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

El tipo especificado no tiene el formato correcto.
Para obtener más información acerca del comando, escriba: HELP SET

DISKPART> set ID=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

El tipo especificado no tiene el formato correcto.
Para obtener más información acerca del comando, escriba: HELP SET

DISKPART> SET ID=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

El tipo especificado no tiene el formato correcto.
Para obtener más información acerca del comando, escriba: HELP SET

DISKPART> SET ID=07 OVERRIDE

DiskPart estableció correctamente el Id. de la partición.

DISKPART>

DISKPART> detail partition

Partición 1
Tipo          : 07
Oculta        : No
Activa        : No
Desplaz. bytes: 1048576

  Núm Volumen Ltr  Etiqueta     Fs     Tipo        Tamaño   Estado     Info
  ----------- ---  -----------  -----  ----------  -------  ---------  --------
* Volume 4                      NTFS   Extraíble    732 MB  Correcto

DISKPART> SET ID=53 OVERRIDE

DiskPart estableció correctamente el Id. de la partición.

DISKPART> SET ID=de94bba4-06d1-4d40-a16a-bfd50179d6ac OVERRIDE

El tipo especificado no tiene el formato correcto.
Para obtener más información acerca del comando, escriba: HELP SET

DISKPART> SET ID=de94bba4-06d1-4d40-a16a-bfd50179d6ac OVERRIDE

El tipo especificado no tiene el formato correcto.
Para obtener más información acerca del comando, escriba: HELP SET

DISKPART> SET ID=de94bba4-06d1-4d40-a16a-bfd50179d6ac FORCE

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP SETID

DISKPART> SET ID=de94bba4-06d1-4d40-a16a-bfd50179d6ac FORCE

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP SETID

DISKPART> SET ID=de94bba4-06d1-4d40-a16a-bfd50179d6ac FORCE

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP SETID

DISKPART> SETID ID=de94bba4-06d1-4d40-a16a-bfd50179d6ac FORCE

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP SETID

DISKPART> help setid

    Cambia el campo de tipo de partición por la partición que recibe el enfoque.

Sintaxis:  SET ID={<BYTE> | <GUID>} [OVERRIDE] [NOERR]

    ID={<BYTE> | <GUID>}

                Especifica el nuevo tipo de partición.

                Para los discos de registro de arranque maestro (MBR), puedes especificar un byte de tipo de
                partición, en formato hexadecimal, para la partición. Se
                puede especificar cualquier byte de tipo de partición con este parámetro, excepto
                para el tipo 0x42 (partición LDM). Ten en cuenta que el "0x" inicial se
                omite al especificar el tipo de partición hexadecimal.

                Para los discos de tabla de particiones GUID (GPT) puedes especificar un
                GUID de tipo de partición para la partición. Los GUID reconocidos
                son:

                    Partición de sistema EFI:
                        c12a7328-f81f-11d2-ba4b-00a0c93ec93b

                    Partición de datos básicos:
                        ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

                Se puede especificar cualquier GUID de tipo de partición con este parámetro,
                excepto los siguientes:

                    Partición reservada de Microsoft:
                        e3c9e316-0b5c-4db8-817d-f92df00215ae

                    Partición de metadatos LDM en un disco dinámico:
                        5808c8aa-7e8f-42e0-85d2-e1e90434cfb3

                    Partición de datos LDM en un disco dinámico:
                        af9b60a0-1431-4f62-bc68-3311714a69ad

                    Partición de metadatos de clúster:
                        db97dba9-0840-4bae-97f0-ffb9a327c7e1


                Excepto las limitaciones mencionadas, DiskPart no
                comprueba la validez del tipo de partición excepto para asegurarse de
                que sea un byte con formato hexadecimal o un GUID.

    OVERRIDE    Permite que DiskPart obligue al sistema de archivos del volumen a
                desmontarse antes de cambiar el tipo de partición. Al cambiar
                el tipo de partición, DiskPart intentará bloquear y desmontar
                el sistema de archivos del volumen. Si no se especifica este parámetro
                y la llamada para bloquear el sistema de archivos no se realiza correctamente (porque otra
                aplicación tiene un identificador abierto en el volumen), toda la
                operación generará un error. Si se especifica este parámetro, el
                desmontaje se aplicará aunque la llamada para bloquear el sistema de archivos
                no se realice correctamente. Al desmontar un sistema de archivos, todos los identificadores abiertos en
                el volumen dejarán de ser válidos.

    NOERR       Solo para scripting. Cuando se encuentra un error, DiskPart
                sigue procesando los comandos como si no existiese el error.
                Sin el parámetro NOERR, un error hace que DiskPart se cierre
                con un código de error.

    Para uso exclusivo de fabricantes de equipo original (OEM).

    Para realizar esta operación correctamente, es necesario seleccionar una partición.

    Precaución:

        Cuando se cambian los campos de tipo de partición con este parámetro, es posible que
        haya errores en el equipo o que no pueda iniciarse. A menos que seas un OEM o un
        profesional de TI con experiencia en discos, no cambies los campos de tipo de
        partición en discos GPT con este parámetro. En su lugar, usa siempre el
        comando CREATE PARTITION EFI para crear particiones de sistema EFI, el
        comando CREATE PARTITION MSR para crear particiones reservadas de Microsoft
        y el comando CREATE PARTITION PRIMARY sin el parámetro ID para
        crear particiones principales en discos GPT.

    Este comando no funciona en discos dinámicos ni en particiones reservadas de
    Microsoft.

    Ejemplo:

    SET ID=07 OVERRIDE
    SET ID=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

DISKPART> SET ID=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

El tipo especificado no tiene el formato correcto.
Para obtener más información acerca del comando, escriba: HELP SET

DISKPART> set ID=07 override SET ID=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP SETID

DISKPART> SET ID=de94bba4-06d1-4d40-a16a-bfd50179d6ac

El tipo especificado no tiene el formato correcto.
Para obtener más información acerca del comando, escriba: HELP SET

DISKPART> sel disk

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP SELECT DISK

El disco 1 es ahora el disco seleccionado.

DISKPART> list part

  Núm Partición  Tipo              Tamaño   Desplazamiento
  -------------  ----------------  -------  ---------------
* Partición 1    Principal          732 MB  1024 KB
  Partición 2    Principal           26 GB  2048 MB

DISKPART> detail part

Partición 1
Tipo          : 53
Oculta        : Sí
Activa        : No
Desplaz. bytes: 1048576

No hay volumen asociado con esta partición.

DISKPART> assign letter = k

No se ha especificado un volumen.
Seleccione un volumen e inténtelo de nuevo.

DISKPART> attributes

Microsoft DiskPart versión 10.0.18362.1

VOLUME      - Manipular los atributos de volumen.
DISK        - Manipular los atributos de disco.

DISKPART> attributes volume clean hidden

Los argumentos especificados para este comando no son válidos.
Para obtener más información acerca del comando, escriba: HELP ATTRIBUTES VOLUME

DISKPART> attributes volume clear hidden

No hay un volumen seleccionado.
Seleccione un volumen e inténtelo de nuevo.

DISKPART> detail part

Partición 1
Tipo          : 53
Oculta        : Sí
Activa        : No
Desplaz. bytes: 1048576

No hay volumen asociado con esta partición.

DISKPART> set id=07

DiskPart estableció correctamente el Id. de la partición.

DISKPART> list par

  Núm Partición  Tipo              Tamaño   Desplazamiento
  -------------  ----------------  -------  ---------------
* Partición 1    Principal          732 MB  1024 KB
  Partición 2    Principal           26 GB  2048 MB

DISKPART> sel part 1

La partición 1 es ahora la partición seleccionada.

DISKPART> detail

Microsoft DiskPart versión 10.0.18362.1

DISK        - Muestra las propiedades del disco seleccionado.
PARTITION   - Muestra las propiedades de la partición seleccionada.
VOLUME      - Muestra las propiedades del volumen seleccionado.
VDISK       - Muestra las propiedades del disco virtual seleccionado.

DISKPART> detail part

Partición 1
Tipo          : 07
Oculta        : No
Activa        : No
Desplaz. bytes: 1048576

  Núm Volumen Ltr  Etiqueta     Fs     Tipo        Tamaño   Estado     Info
  ----------- ---  -----------  -----  ----------  -------  ---------  --------
* Volume 4                      NTFS   Extraíble    732 MB  Correcto

DISKPART> assign letter = k

DiskPart asignó correctamente una letra de unidad o punto de montaje.

DISKPART>



Los identificadores de tipo de partición (ID) son códigos que se utilizan para identificar el tipo de partición en un disco. Aquí hay algunos de los ID más comunes utilizados para particiones en sistemas de archivos comunes:

07 (NTFS/ExFAT): Este es el ID utilizado para particiones formateadas con el sistema de archivos NTFS (Sistema de Archivos de Nueva Tecnología) utilizado en Windows, así como ExFAT (Extended File Allocation Table), que es un sistema de archivos optimizado para unidades flash y dispositivos extraíbles.

0C (FAT32): Este ID se utiliza para particiones formateadas con el sistema de archivos FAT32 (File Allocation Table), que es compatible con la mayoría de los sistemas operativos, incluidos Windows, macOS y Linux. FAT32 es especialmente común en unidades USB y tarjetas de memoria.

0B (FAT32 CHS): Similar al ID 0C, pero se utiliza específicamente para particiones FAT32 que utilizan el modo de direccionamiento de cilindro, cabeza y sector (CHS). Este modo es menos común y generalmente no se recomienda.

17 (Hidden NTFS): Este ID se utiliza para particiones NTFS que se han ocultado. Las particiones ocultas generalmente no se muestran en el Explorador de archivos de Windows ni en otras utilidades de administración de discos.

EF (EFI System Partition): Este ID se utiliza para la partición del sistema EFI (Extensible Firmware Interface). Esta partición almacena datos de inicio y archivos de configuración del firmware EFI en sistemas basados en EFI, como los sistemas modernos con Windows 10 y la mayoría de las distribuciones de Linux.

Estos son solo algunos ejemplos de ID de partición comunes, pero hay muchos más. Cada sistema operativo y tipo de partición puede tener sus propios ID específicos. Es importante tener en cuenta que cambiar el ID de una partición puede afectar su comportamiento y su capacidad para ser reconocida y utilizada por diferentes sistemas operativos. Siempre haz una copia de seguridad de tus datos importantes antes de realizar cambios en la configuración de las particiones.