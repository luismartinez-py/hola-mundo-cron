FROM node:18

# Instalamos cron
RUN apt-get update && apt-get install -y cron

# Directorio de trabajo
WORKDIR /usr/src/app

# Copiamos archivos
COPY package*.json ./
COPY app.js .
COPY run.sh .
COPY crontab.txt ./

# Damos permisos de ejecución
RUN chmod +x run.sh

# Instalamos dependencias
RUN npm install

# Registramos tareas de cron
RUN crontab crontab.txt

# Creamos directorio de logs
RUN mkdir -p /usr/src/app/logs

# Arrancamos cron en primer plano
CMD ["cron", "-f"]
