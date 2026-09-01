#!/bin/bash

#Script para auditar usuarios institucionales
#Taller de Infraestructura Tecnologica

DESTINO="/jdelgado633/escuela_rural/sistemas/reportes"

FECHA=$(date +%Y%m%d_%H%M%S)
REPORTE="$DESTINO/auditoria_$FECHA.txt"

USUARIOS="prim01 prim02 prim03 prim04 prim05 bach01 bach02 bach03 bach04 bach05 bach06 bach07 bach08 secretaria coord01 coord02 rector sysadmin"

echo "=== AUDITORIA DE USUARIOS ==="

if [ ! -d "$DESTINO" ]; then
	echo "ERROR: el directorio de reportes no existe."
	exit 1
fi

{
echo "AUDITORIA DE USUARIOS"
echo "====================="
echo "Fecha y hora: $(date)"
echo

for USUARIO in $USUARIOS
do
	if id "$USUARIO" >/dev/null 2>&1; then
		echo "Usuario: $USUARIO"
		echo "UID: $(id -u "$USUARIO")"
		echo "Grupo principal: $(id -gn "$USUARIO")"
		echo "Grupos: $(id -Gn "$USUARIO")"
		echo "Directorio personal: $(getent passwd "$USUARIO" | cut -d: -f6)"
		echo "Shell: $(getent passwd "$USUARIO" | cut -d: -f7)"
		echo "---------------------------------"
	fi
done

} > "$REPORTE"

if [ $? -eq 0 ]; then
	echo "Auditoria creada correctamente."
	echo "Archivo: $REPORTE"
else
	echo "ERROR: no se pudo generar la auditoria."
	exit 1
fi
