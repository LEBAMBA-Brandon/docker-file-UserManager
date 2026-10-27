# 1. Utiliser l'image de base pour le web
FROM gmeligio/flutter-web:3.47.7

# 2. Définir le répertoire de travail
WORKDIR /app

# 3. Copier d'abord uniquement la configuration pour optimiser le cache Docker
COPY pubspec.yaml pubspec.lock ./

# 4. Installer les dépendances
RUN flutter pub get

# 5. Copier le reste du code source
COPY . .

# 6. Compiler l'application pour le Web (Génère le dossier build/web)
RUN flutter build web

# 7. Utiliser un serveur HTTP léger pour servir les fichiers statiques générés
# (Flutter web ne se lance pas avec "flutter main.dart" en production)
FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html

# 8. Exposer le port de Nginx
EXPOSE 80

# 9. Lancer Nginx
CMD ["nginx", "-g", "daemon off;"]
