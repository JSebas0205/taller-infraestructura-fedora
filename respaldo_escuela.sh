#!/bin/bash

#Script para respaldar informacion academica
#Taller de Infraestructura Tecnologica

ORIGEN="/jdelgado633/escuela_rural/academico"
DESTINO="/jdelgado633/escuela_rural/sistemas/respaldos"
LOG="/jdelgado633/escuela_rural/sistemas/logs/respaldos.log"

FECHA=$(date +%Y%m%d_%H%M%S)
ARCHIVO="$DESTINO/academico_$FECHA.tar.gz"

echo "=== RESPALDO ACADEMICO ==="

if [ ! -d "$ORIGEN" ]; then
	echo "ERROR: el directorio de origen no existe."
	exit 1
fi

if [ ! -d "$DESTINO" ]; then
	echo "ERROR: el directorio de respaldos no existe"
	exit 1
fi

tar -czf "$ARCHIVO" "$ORIGEN"

if [ $? -eq 0 ]; then
	echo "$(date) - Respaldo correcto: $ARCHIVO" >> "$LOG"
	echo "Respaldo creado correctamente."
else
	echo "$(date) - ERROR al generar respaldo." >> "$LOG"
	echo "ERROR: no se pudo crear el respaldo."
	exit 1
fi
