FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# dont need an as keyword, this phase begins when builder ends
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html