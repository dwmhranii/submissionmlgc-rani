# Gunakan base image Node.js berbasis Debian
FROM node:18-bullseye
# FROM node:18

# Set working directory di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Instal dependensi aplikasi
RUN npm install

COPY key.json ./key.json
ENV GOOGLE_APPLICATION_CREDENTIALS="./key.json"

# Salin semua file proyek ke dalam container
COPY . .

# Ekspos port 8080 untuk Google Cloud Run
EXPOSE 8080

# Jalankan aplikasi
CMD ["npm", "start"]
