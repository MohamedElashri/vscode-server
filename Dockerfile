# Ubuntu as the base image
FROM ubuntu:latest

# Set arguments for externalizing sensitive information
ARG ROOT_PASSWORD
ARG CONNECTION_TOKEN

# Install necessary packages in a single RUN command to reduce the number of layers
RUN apt-get update && \
    apt-get install -y software-properties-common apt-transport-https wget gpg sudo nano git curl wget unzip npm ssh && \
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list && \
    apt-get update && \
    apt-get install -y code && \
    echo "root:${ROOT_PASSWORD}" | chpasswd


# Create a non-root user for running applications
RUN useradd -m vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode

# Switch to the non-root user
USER vscode

# Set the home directory environment variable
ENV HOME /home/vscode

# Expose the port for VS Code
EXPOSE 2906

# Start Visual Studio Code on port 2906
CMD ["code", "serve-web", "--host", "0.0.0.0", "--port", "2906", "--user-data-dir", "/home/vscode", "--connection-token", "${CONNECTION_TOKEN}"]

