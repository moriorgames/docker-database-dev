Docker database dev
===================

Docker database dev is a sample repository about how to maintain a database for development environment with jenkins testing pipeline

It provides an interface to connect to a Mysql with standard way (port 3306), and it dumps dummy data when the container is initialized.

```
# Clone
$ git clone https://github.com/moriorgames/docker-database-dev.git
# Navigate to folder
$ cd docker-database-dev
# Create the Docker image from Dockerfile
$ docker build -t moriorgames/docker-database-dev .
# Run the mysql image locally in a Container
$ docker run -td --name database_dev -p 3306:3306 moriorgames/docker-database-dev
# When starting database will dump all SQL data contained inside dump.sql file
```
