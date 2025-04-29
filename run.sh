#!/bin/bash

# Nos movemos al directorio correcto
cd /usr/src/app

# Creamos un directorio para logs si no existe
mkdir -p logs

# Archivo de log con fecha de hoy (ej: logs/2025-04-28.log)
LOG_FILE="logs/$(date '+%Y-%m-%d').log"

# Ejecutamos la app y redirigimos salida estándar y errores al log
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Ejecutando app.js..." >> "$LOG_FILE"
/usr/local/bin/node app.js >> "$LOG_FILE" 2>&1

# Guardamos el código de salida de node
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: La app falló con código $EXIT_CODE" >> "$LOG_FILE"
else
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] OK: La app terminó correctamente" >> "$LOG_FILE"
fi
