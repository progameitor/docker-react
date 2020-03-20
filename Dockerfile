
# primera fase
FROM  node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


#segunda fase
FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html



