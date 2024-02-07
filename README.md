# VS Code Server in a Docker Container

This repository contains a Docker and Docker Compose setup for running a Visual Studio Code (VS Code) server in a Docker container. It allows you to access VS Code through a web browser, enabling development from any machine with internet access. This setup uses Ubuntu as the base image and configures a non-root user for running the VS Code server.

## Prerequisites

Before you begin, ensure you have the following installed on your system:
- `Docker`
- `Docker Compose`

## Getting Started

To use this VS Code server setup, follow these steps:

### 1. Clone the Repository

First, clone this repository to your local machine using the following command:

```ssh
git clone https://github.com/MohamedElashri/vscode-server
```
And then move to the repository 

```ssh
cd vscode-server
```

### 2. Configuration

Before building and running the container, you need to configure the environment variables:

- Rename the `sample.env` file to `.env`.
- Edit the `.env` file to set your `ROOT_PASSWORD` and `CONNECTION_TOKEN`. These variables are crucial for accessing your VS Code server securely.

```python 
ROOT_PASSWORD=<root_password>
CONNECTION_TOKEN=<secure_connection_token>
```

### 3. Build and Run with Docker Compose

With Docker Compose, you can build and run the VS Code server container with a single command:

```ssh
docker-compose up -d
```


This command builds the Docker image and starts the VS Code server, binding it to port `2906` on your host machine.

### 4. Accessing VS Code Server

Once the container is running, you can access the VS Code server by opening a web browser and navigating to:


http://localhost:2906


You will need to provide the `CONNECTION_TOKEN` when accessing it for the first time.

### 5. Stopping the Server

To stop the VS Code server, you can use the following Docker Compose command:

```ssh 
docker-compose down
```


## Customization

You can customize the Docker and Docker Compose configuration files to change the exposed port, the volume path, or any other settings according to your needs.

## Security

Ensure that your `ROOT_PASSWORD` and `CONNECTION_TOKEN` are kept secure and are not exposed to unauthorized users.

## Support

For any issues or support related to this setup, please open an issue in the repository.

## Contributing

Contributions to improve this setup are welcome. Please feel free to fork the repository, make your changes, and submit a pull request.


