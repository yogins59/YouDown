# Gunakan image Python resmi yang ringan
FROM python:3.9-slim

# Instal FFmpeg dan dependensi sistem lainnya
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Setel direktori kerja
WORKDIR /app

# Salin requirements.txt dan instal library Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Salin seluruh file aplikasi lainnya ke dalam container
COPY . .

# Tentukan perintah untuk menjalankan aplikasi Flask
CMD ["python", "app.py"]
