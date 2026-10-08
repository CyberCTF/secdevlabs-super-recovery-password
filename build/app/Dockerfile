# Upstream's deployments/app.Dockerfile with these changes: the React sources are copied from
# app/ (upstream's src/app/); the environment of upstream's deployments/docker-compose.yml is
# baked in; and CI=true is set so the development server keeps running without the terminal
# upstream's compose file opens for it (`stdin_open: true`). Dependencies come from upstream's
# package-lock.json.
FROM docker.io/library/node:18-alpine

WORKDIR /app

ADD ./app/ /app/

ENV PORT=40001 \
    REACT_APP_API_ENDPOINT=http://localhost:3000 \
    CI=true

RUN apk update && npm install

CMD npm start
