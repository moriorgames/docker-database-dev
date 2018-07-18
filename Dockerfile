# Build command:
# docker build -t moriorgames/docker-database-dev .
# Run command:
# docker run -td --name database_dev -p 3306:3306 moriorgames/docker-database-dev
FROM    mysql:5.7

# Environment variables
ENV MYSQL_ROOT_PASSWORD root_pwd
ENV MYSQL_USER docker_user
ENV MYSQL_PASSWORD docker_pwd
ENV MYSQL_DATABASE dev_database

# Custom configuration
COPY    ./config/my.cnf  /etc/mysql/my.cnf

# Import dummy data
RUN     mkdir -p /docker-entrypoint-initdb.d/tables
COPY    tables    /docker-entrypoint-initdb.d/tables/
COPY    ./dump.sql  /docker-entrypoint-initdb.d/dump.sql
RUN     chmod 777 /docker-entrypoint-initdb.d/*

EXPOSE  3306
