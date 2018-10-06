FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

#(aws-access-id): AKIAJKWIF7T6FZL6SL3A
#(aws-secret-key): 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