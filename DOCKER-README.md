# Docker Setup for Tariff Server

This document provides instructions for building and running the Tariff Server application using Docker.

## Prerequisites

- Docker installed on your machine
- Docker Compose installed on your machine

## Building the Docker Image

To build the Docker image for the Tariff Server application, run the following command from the server directory:

```bash
docker build -t tariff-server .
```

## Running the Docker Container

### Using Docker Run

To run the container using Docker run:

```bash
docker run -p 8080:8080 \
  -e SPRING_PROFILES_ACTIVE=prod \
  -e SPRING_DATASOURCE_URL=jdbc:postgresql://db.xizwjutjdldhrthleubs.supabase.co:5432/postgres \
  -e SPRING_DATASOURCE_USERNAME=postgres \
  -e SPRING_DATASOURCE_PASSWORD=jY8MbHb4bg_hij! \
  -e JWT_SECRET=your-production-secret-key-here \
  tariff-server
```

### Using Docker Compose

Alternatively, you can use Docker Compose to run the application:

```bash
docker-compose up
```

To run it in detached mode:

```bash
docker-compose up -d
```

## Environment Variables

The application requires the following environment variables:

- `SPRING_PROFILES_ACTIVE`: The active Spring profile (dev, prod, direct)
- `SPRING_DATASOURCE_URL`: JDBC URL for the PostgreSQL database
- `SPRING_DATASOURCE_USERNAME`: Database username
- `SPRING_DATASOURCE_PASSWORD`: Database password
- `JWT_SECRET`: Secret key for JWT token generation and validation

## Security Note

For production deployments, it's recommended to:

1. Use Docker secrets or a secure environment variable management system for sensitive information
2. Change the default database credentials and JWT secret
3. Consider using a separate database instance for production

## Accessing the Application

Once the container is running, the application will be accessible at:

```
http://localhost:8080
```

## Stopping the Container

To stop the container when using Docker Compose:

```bash
docker-compose down
```

To stop a container started with Docker run:

```bash
docker stop <container_id>
```
