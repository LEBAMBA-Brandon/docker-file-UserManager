# --- Étape 1 : Build ---
FROM debian:latest AS builder

# Installer les dépendances minimales
RUN apt-get update && apt-get install -y \
    curl git wget unzip xz-utils zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Cloner le SDK Flutter
RUN git clone https://github.com /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Configurer Flutter pour Docker (Désactive les stats et force le mode Root sans invite)
ENV PUB_CACHE=/root/.pub-cache
RUN flutter config --no-analytics \
    && flutter config --enable-web

WORKDIR /app

# Correction ici : On utilise une syntaxe qui ne crash pas si pubspec.lock n'existe pas localement
COPY pubspec.yaml pubspec.lock* ./

# Forcer la résolution des dépendances
RUN flutter pub get

# Copier le reste du projet et compiler
COPY . .
RUN flutter build web --release

# --- Étape 2 : Production ---
FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
