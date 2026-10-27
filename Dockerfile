# créer l’image flutter
FROM gmeligio/flutter-web

# definir le repertoir de travail
WORKDIR /app

# copier cette application web
COPY . .

# installer les dépendances
RUN flutter pub get

# exposer sur un port externe
EXPOSE 2020

# lancer l’application
CMD ["flutter", "main.dart"]