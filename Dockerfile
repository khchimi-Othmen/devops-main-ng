# Utilisez une image Node.js pour Angular
FROM node:18.17.1 as build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Utilisez un serveur web pour exécuter l'application Angular
FROM nginx:alpine

COPY --from=build /app/dist/summer-workshop-angular /usr/share/nginx/html

EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]
