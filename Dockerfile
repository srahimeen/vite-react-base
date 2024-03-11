# This Dockerfile is for deploying to fly.io, not local use

FROM node:18 as build

WORKDIR /web

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the built React app
COPY --from=build /web/dist /usr/share/nginx/html

# This needs be referenced in fly.toml's internal_port, usually 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]