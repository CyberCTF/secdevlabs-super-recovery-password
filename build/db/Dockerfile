# The db service of upstream's deployments/docker-compose.yml: mariadb:10.6.3 with its
# environment baked in. Upstream also mounts ../db on /docker-entrypoint-initdb.d, a folder its
# .gitignore excludes and the repository does not have; the API creates its own table and users.
FROM docker.io/library/mariadb:10.6.3
ENV MYSQL_ROOT_PASSWORD=root \
    MYSQL_DATABASE=A4 \
    MYSQL_USER=user \
    MYSQL_PASSWORD=pass
