# Upstream's deployments/api.Dockerfile with these changes: the base image is pinned to
# golang:1.23 (upstream: golang, i.e. latest; 1.23 was current at the secDevLabs commit); the
# sources are copied from app/ (upstream's src/api/); the environment of upstream's
# deployments/docker-compose.yml is baked in; the program is compiled once at build time so
# `go run` starts quickly and offline; and the compose command (`go run server.go`) is the CMD.
FROM docker.io/library/golang:1.23

WORKDIR /a4-insecure-design

COPY ./app/go.mod ./app/go.sum ./
RUN go mod download

COPY ./app ./

ENV JWT_SECRET=secret-key \
    MYSQL_HOST=db \
    MYSQL_ROOT_PASSWORD=root \
    MYSQL_DATABASE=A4 \
    MYSQL_USER=user \
    MYSQL_PASSWORD=pass \
    MYSQL_PORT=3306

RUN go build -o /dev/null .
CMD ["go", "run", "server.go"]
