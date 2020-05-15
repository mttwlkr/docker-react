FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# dont need an as keyword, this phase begins when builder ends
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html