# React Vite Base

Vite + React + TailwindCSS + TanStack Router + TanStack Query

## Docker

```
docker build -t mailmagnet-web .

docker run -p 5173:5173 mailmagnet-web
```

## Secrets

.env

```
# localhost API
VITE_API_URL=""
```

.env.production

```
# production API
VITE_API_URL=""
```