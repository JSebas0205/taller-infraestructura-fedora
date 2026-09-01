#!/bin/bash

#Script para limpiar archivos temporales
#Taller de Infraestructura Tecnologica

TEMPORAL="/jdelgado633/escuela_rural/temporal"
LOG="/jdelgado633/escuela_rural/sistemas/logs/limpieza.log"

echo "=== LIMPIEZA DE ARCHIVOS TEMPORALES ==="

if [ ! -d "$TEMPORAL" ]; then
	echo "ERROR: el directorio temporal no existe."
	exit 1
fi

CANTIDAD=$(find "$TEMPORAL" -type f -mtime +7 | wc -l)

find "$TEMPORAL" -type f -mtime +7 -delete

if [ $? -eq 0 ]; then
	echo "$(date) - Arhivos eliminados: $CANTIDAD" >> "$LOG"
	echo "Limpieza completada correctamente."
	echo "Archivos eliminados: $CANTIDAD"
else
	echo "$(date) - ERROR durante la limpieza." >> "$LOG"
	echo "ERROR: no se pudo completar la limpieza."
	exit 1
fi
