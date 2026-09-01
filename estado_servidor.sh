#!/bin/bash

#Script para generar reporte del servidor
#Taller de Infraestructura Tecnologica
#Reporte utilizando para monitoreo y automatizacion con cron

DESTINO="/jdelgado633/escuela_rural/sistemas/reportes"

FECHA=$(date +%Y%m%d_%H%M%S)
REPORTE="$DESTINO/estado_$FECHA.txt"

echo "=== ESTADO DEL SERVIDOR ==="

if [ ! -d "$DESTINO" ]; then
	echo "ERROR: el directorio de reportes no existe."
	exit 1
fi

{
echo "REPORTE DEL ESTADO DEL SERVIDOR"
echo "================================"
echo "Fecha y hora: $(date)"
echo
echo "Nombre del servidor"
hostname
echo
echo "Tiempo encendido:"
uptime -p
echo
echo "Memoria RAM:"
free -h
echo
echo "Espacio disponible en disco:"
df -h
echo
echo "Usuarios conectados:"
who
echo
echo "Uso de almacenamiento de /jdelgado633:"
du -sh /jdelgado633
echo
echo "Ultimos accesos registrados:"
last -n 5
} > "$REPORTE"

if [ $? -eq 0 ]; then
	echo "Reporte creado correctamente."
	echo "Archivo: $REPORTE"
else
	echo "ERROR: no se pudo generar el reporte."
	exit 1
fi


