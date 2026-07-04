FROM nginx:alpine

# Menerima argumen build dari docker-compose
ARG ORG_NAME
ARG ORG_FOUNDED
ARG ORG_EMAIL

# Metadata Organisasi Resmi Sesuai Instruksi Soal
LABEL org.name="${ORG_NAME}" \
      org.founded="${ORG_FOUNDED}" \
      maintainer="${ORG_EMAIL}"

# Copy file HTML dan CSS ke dalam container Nginx
COPY html/index.html /usr/share/nginx/html/index.html
COPY html/style.css /usr/share/nginx/html/style.css

# Menggunakan variabel ARG untuk mengganti placeholder secara otomatis saat build
RUN sed -i "s/ORG_NAME_PLACEHOLDER/${ORG_NAME}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/ORG_TAGLINE_PLACEHOLDER/Sinergi, Integritas, dan Totalitas untuk Almamater/g" /usr/share/nginx/html/index.html && \
    sed -i "s/ORG_FOUNDED_PLACEHOLDER/${ORG_FOUNDED}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/ORG_MEMBERS_PLACEHOLDER/45+/g" /usr/share/nginx/html/index.html && \
    sed -i "s/ORG_DIVISION_PLACEHOLDER/6/g" /usr/share/nginx/html/index.html && \
    sed -i "s/ORG_MISSION_PLACEHOLDER/Mewujudkan mahasiswa STMIK Tazkia yang aktif, solutif, unggul dalam teknologi, serta berjiwa sosial tinggi./g" /usr/share/nginx/html/index.html && \
    sed -i "s/ORG_VISION_PLACEHOLDER/Menjadi wadah aspirasi dan kolaborasi mahasiswa yang berlandaskan nilai islami dan profesionalisme modern./g" /usr/share/nginx/html/index.html && \
    sed -i "s/ORG_EMAIL_PLACEHOLDER/${ORG_EMAIL}/g" /usr/share/nginx/html/index.html && \
    sed -i "s/ORG_LOCATION_PLACEHOLDER/Kampus Utama STMIK Tazkia, Bogor/g" /usr/share/nginx/html/index.html
