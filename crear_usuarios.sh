#!/bin/bash

#Script para crear usuarios
#Taller de Infraestructura Tecnologica

LOG="/jdelgado633/escuela_rural/sistemas/logs/usuarios.log"

echo "=== CREACION DE USUARIO ==="

read -p "Usuario: " USUARIO
read -p "Grupo: " GRUPO
read -p "Directorio personal: " HOME_USUARIO

if id "$USUARIO" >/dev/null 2>&1; then
	echo "ERROR: el usuario ya existe."
	exit 1
fi

if ! getent group "$GRUPO" >/dev/null 2>&1; then
	echo "ERROR: el grupo no existe."
	exit 1
fi

useradd -m -d "$HOME_USUARIO" -g "$GRUPO" -s /bin/bash "$USUARIO"

if [ $? -eq 0 ]; then
	echo "$(date) - Usuario: $USUARIO - Grupo: $GRUPO" >> "$LOG"
	echo "Usuario creado correctamente."
else
	echo "ERROR: no se pudo crear el usuario."
	exit 1
fi
